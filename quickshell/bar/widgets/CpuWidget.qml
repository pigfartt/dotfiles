// CpuWidget.qml
import QtQuick
import QtQuick.Layouts
import qs.services
import qs.theme
import qs.components

Pill {
    color: Theme.gruvbox.bg0_h

    RowLayout {
        spacing: 6

        Text {
            text: "\uf4bc"
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }
        Text {
            text: (SystemInfo.cpuUsage * 100).toFixed(1) + "% "
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }

        Text {
            text: {
                const t = SystemInfo.cpuTemp
                if (t < 45) return "\uf2cb"
                if (t < 60) return "\uf2ca"
                if (t < 70) return "\uf2c9"
                if (t < 82) return "\uf2c8"
                return "\uf2c7"
            }
            color: SystemInfo.cpuTemp >=82 ? Theme.warning
                 : Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }

        Text {
            text: SystemInfo.cpuTemp.toFixed(0) + "°"
            color: Theme.foreground
            font.family: Theme.fontFamily
            font.pixelSize: Theme.fontSize
        }
    }
}
