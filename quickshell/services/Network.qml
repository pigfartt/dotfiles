// Network.qml
pragma Singleton

import Quickshell
import Quickshell.Networking
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    readonly property bool wired: Networking.devices.values.some(
        d => d.type === DeviceType.Wired && d.connected)
    readonly property bool wifi: Networking.devices.values.some(
        d => d.type === DeviceType.Wifi && d.connected)
    readonly property bool offline: wired ? false : wifi ? false : true

    property bool wifiEnabled: Networking.wifiEnabled

    readonly property string deviceName: offline ? "No Connection" : Networking.devices.values.find(
        d => d.connected && (d.type === DeviceType.Wired || DeviceType.Wifi))?.name ?? ""

    // IP FUNCTIONALITY
    property string ip: ""

    function refreshIp() {
        if (deviceName && !offline) ipProc.running = true
    }

    Process {
        id: ipProc
        command: ["ip", "-4", "-j", "addr", "show", "dev", root.deviceName]
        stdout: StdioCollector {
            onStreamFinished: {
                try {
                    root.ip = JSON.parse(text)[0]?.addr_info?.[0]?.local ?? ""
                } catch (e) {
                    root.ip = ""
                }
            }
        }
    }

    // VPN INFO
    property var vpns: []
    readonly property var allVpns: tailscale ? [...vpns, "Tailscale"] : vpns
    readonly property bool vpnActive: allVpns.length > 0

    Process {
        id: vpnQuery
        command: ["nmcli", "-t", "-f", "NAME,TYPE", "connection", "show", "--active"]
        stdout: StdioCollector {
            onStreamFinished: {
                //console.log("vpn raw: ", text) // debug
                root.vpns = text.trim().split("\n")
                    .filter(l => l)
                    .map (l => {
                        const i = l.lastIndexOf(":")
                        return { name: l.slice(0,i), type: l.slice(i + 1) }
                    })
                    .filter(c => c.type === "vpn" || c.type === "wireguard")
                    .map(c => c.name)
            }
        }
    }

    Timer { id: vpnDebounce; interval: 200; onTriggered: vpnQuery.running = true }

    Process {
        running: true
        command: ["nmcli", "monitor"]
        stdout: SplitParser { onRead: vpnDebounce.restart() }
    }

    Component.onCompleted: {
        vpnQuery.running = true
        tsQuery.running = true
    }

    // TAILSCALE
    property bool tailscale: false
    property bool tailscaleExitNode: false
    property string tailscaleIp: ""

    Process {
        id: tsQuery
        command: ["tailscale", "status", "--json", "--peers=false"]
        stdout: StdioCollector {
            onStreamFinished: {
                if (text.trim() === "") {          // daemon down or not installed
                    root.tailscale = false
                    root.tailscaleExitNode = false
                    root.tailscaleIp = ""
                    return
                }
                try {
                    const s = JSON.parse(text)
                    root.tailscale = s.BackendState === "Running"
                    root.tailscaleExitNode = root.tailscale && !!s.ExitNodeStatus
                    root.tailscaleIp = root.tailscale ? (s.TailscaleIPs?.[0] ?? "") : ""
                } catch (e) {
                    console.log("tailscale parse failed:", e)
                }
                //console.log("found: ", root.allVpns)
            }
        }
    }

    Timer { id: tsDebounce; interval: 300; onTriggered: tsQuery.running = true }

    Process {
        running: true
        command: ["tailscale", "debug", "watch-ipn"]
        stdout: SplitParser { onRead: tsDebounce.restart() }
    }
}



