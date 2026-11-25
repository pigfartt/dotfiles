// NosleepWidget.qml
import QtQuick
import qs.services
import qs.theme
import qs.components

Pill {
    color: Theme.gruvbox.bg0_h
    clickable: true
    onClicked: Nosleep.toggle()

    Text {
        //text: "\udb84\udc5e" // hollow sun sheild
        //text: "\udb84\udc5d" // filled sun sheild
        text: "\udb81\udcb3" // zzz cross

        color: Nosleep.active ? Theme.gruvbox.yellow : Theme.gruvbox.bg4
        font.family: Theme.fontFamily
        font.pixelSize: Theme.fontSize
    }
}
