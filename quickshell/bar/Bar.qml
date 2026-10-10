// Bar.qml
import Quickshell
import QtQuick
import QtQuick.Layouts
import qs.bar.widgets
import qs.theme

Scope {

    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            anchors { top: true; left: true; right: true }
            implicitHeight: 30

            color: Theme.background
            RowLayout {
                anchors.fill: parent
                spacing: 0

                Item { Layout.fillWidth: true }
                AudioWidget { Layout.fillHeight: true }
                VpnWidget { Layout.fillHeight: true }
                NetWidget { Layout.fillHeight: true }
                CpuWidget { Layout.fillHeight: true }
                MemWidget { Layout.fillHeight: true }
                DateWidget { Layout.fillHeight: true }
                ClockWidget { Layout.fillHeight: true }
            }
        }
    }
}
