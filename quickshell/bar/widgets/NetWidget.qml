// NetWidget.qml
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.theme
import qs.components

Pill {
    id: pill
    color: Theme.gruvbox.red
    clickable: true

    property bool showIp: false
    onClicked: {
        showIp = !showIp
        if (showIp) Network.refreshIp()
    }

    RowLayout {
        spacing: 6


        Text {
            text: {
                if (Network.offline) return "\udb81\uddaa"
                if (Network.wifi) return "\udb81\udda9"
                if (Network.wired) return "\uef09"
                return "\udb85\udeb5" // unknown
            }
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }

        Text {
            id: label
            visible: text !== ""
            text: {
                if (pill.showIp) return Network.ip
                if (!Network.deviceName) return "Unstable"
                return Network.wired ? "" : Network.deviceName
            }
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }
    }
}
