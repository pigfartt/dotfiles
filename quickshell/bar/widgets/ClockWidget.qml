// ClockWidget.qml
import QtQuick
import qs.services
import qs.theme
import qs.components

Pill {
    color: Theme.foreground

    Text {
        text: Time.time

        color: Theme.background
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
    }
}
