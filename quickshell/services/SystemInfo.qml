// SystemInfo.qml
pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property real cpuUsage: 0
    property real cpuTemp: 0
    property real memTotal: 0
    property real memUsed: 0

    property string hwmonDir: ""

    property var _prev: null

    // run once to find best file for cputemp readings
    Process {
        id: findHwmon
        command: ["sh", "-c", "grep -lxE 'k10temp|coretemp' /sys/class/hwmon/hwmon*/name"]
        running: true

        stdout: StdioCollector {
            onStreamFinished: {
                const namePath = text.trim().split("\n")[0]
                if (namePath)
                    root.hwmonDir = namePath.replace(/\/name$/, "")
            }
        }
    }

    FileView { id: statFile; path: "/proc/stat"; blockLoading: true }
    FileView { id: memFile; path: "/proc/meminfo"; blockLoading: true }
    FileView {
        id: tempFile
        path: root.hwmonDir ? root.hwmonDir + "/temp1_input" : ""
        blockLoading: true
    }

    Timer {
        interval: 2000
        running: true
        repeat: true
        triggeredOnStart: true
        onTriggered: {
            statFile.reload(); memFile.reload();
            root.readCpu(statFile.text())
            root.readMem(memFile.text())

            if (hwmonDir) {
                tempFile.reload()
                root.cpuTemp = Number(tempFile.text()) / 1000
            }
        }
    }

    function readCpu(text) {
        const f = text.split("\n")[0].trim().split(/\s+/).slice(1).map(Number)
        const idle = f[3] + f[4]                  // idle + iowait
        const total = f.reduce((a, b) => a + b, 0)
        if (_prev) {
            const dTotal = total - _prev.total
            const dIdle = idle - _prev.idle
            cpuUsage = dTotal > 0 ? 1 - dIdle / dTotal : 0
        }
        _prev = { total: total, idle: idle }
    }
    function readMem(text) {
        const total = Number(/MemTotal:\s+(\d+)/.exec(text)[1])
        const avail = Number(/MemAvailable:\s+(\d+)/.exec(text)[1])
        memTotal = total / (1024 * 1024)
        memUsed = (total - avail) / (1024 * 1024)
    }

}
