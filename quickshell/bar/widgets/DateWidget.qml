// DateWidget.qml
import QtQuick
import qs.services
import qs.theme
import qs.components

Pill {
    color: Theme.gruvbox.bg0_h
    Text {
        text: Qt.formatDate(Time.date, "d MMM yyyy")

        color: Theme.foreground
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
    }
}
