// VpnWidget.qml
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.theme
import qs.components

Pill {
    id: pill
    color: Theme.gruvbox.bg0_h
    clickable: false

    property bool showIp: false
    onClicked: {
    }

    RowLayout {
        spacing: 6

        Text {
            text: "ts"
            color: Network.allVpns.includes("Tailscale")
                ? Theme.accent : Theme.gruvbox.bg3
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }

        Text {
            text: "ftecs"
            color: Network.vpns.some(s => s.includes("ftecs"))
                ? Theme.accent : Theme.gruvbox.bg3
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }

        Text {
            text: "\udb81\udd82"
            color: Network.vpns.some(s => !s.includes("ftecs"))
                ? Theme.accent : Theme.gruvbox.bg3
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }
    }
}

