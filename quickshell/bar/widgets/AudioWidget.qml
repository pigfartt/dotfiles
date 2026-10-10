// AudioWidget.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.theme
import qs.components

Pill {
    color: Theme.gruvbox.purple

    onScrolled: steps => Audio.changeVolume(-steps * 0.05)
    clickable: true
    onClicked: Audio.toggleMute()

    RowLayout {
        spacing: 6
        
        Text {
            text: Audio.muted ? "\udb81\udd81" : "\udb81\udd7e"
            
            color: Theme.gruvbox.bg0_h
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }
        Text {
            visible: text !== ""
            text:  Audio.percent + "%"
            color: Audio.muted ? Theme.gruvbox.bg1 : Theme.gruvbox.bg0_h
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }
    }
}
