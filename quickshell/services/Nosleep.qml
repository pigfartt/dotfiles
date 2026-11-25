// services/Nosleep.qml
pragma Singleton

import Quickshell
import Quickshell.Io
import QtQuick

Singleton {
    id: root

    property bool active: false

    function toggle() {
        if (startProc.running || stopProc.running) return
        (active ? stopProc : startProc).running = true
    }

    Process {
        id: startProc
        command: ["nosleep", "start"]
        onExited: statusProc.running = true
    }

    Process {
        id: stopProc
        command: ["nosleep", "stop"]
        onExited: statusProc.running = true
    }

    Process {
        id: statusProc
        command: ["nosleep", "status"]
        stdout: StdioCollector {
            onStreamFinished: root.active = (text.trim() === "active")
        }
    }

    Component.onCompleted: statusProc.running = true
}
