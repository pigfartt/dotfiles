// MemWidget.qml
import QtQuick
import qs.services
import qs.theme
import qs.components

Pill {
    color: Theme.gruvbox.orange
    Text {
        text: "  " + SystemInfo.memUsed.toFixed(1) + "G/" + SystemInfo.memTotal.toFixed(1) + "G"

        color: Theme.gruvbox.bg0_h
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
    }
}
