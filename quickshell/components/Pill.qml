// Pill.qml
import QtQuick
import qs.theme

Rectangle {
    id: root

    property real padding: Theme.outerMargin
    property bool clickable: false

    default property alias content: holder.data

    implicitWidth: holder.implicitWidth + 2 * padding
    color: Theme.background


    Item {
        id: holder
        anchors.centerIn: parent
        implicitWidth: childrenRect.width
        implicitHeight: childrenRect.height
    }

    signal clicked()

    MouseArea {
        anchors.fill: parent
        enabled: root.clickable
        cursorShape: root.clickable ? Qt.PointingHandCursor : Qt.ArrowCursor
        onClicked: root.clicked()
        onWheel: event => root.scrolled(event.angleDelta.y / 120)
    }

    signal scrolled(real steps)
}

