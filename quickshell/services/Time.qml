// Time.qml
pragma Singleton

import Quickshell
import QtQuick

Singleton {
    id: root
    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm AP").replace(/ ?[AP]M$/i, "")
    }
    readonly property date date: { clock.date }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
