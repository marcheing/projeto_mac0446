import QtQuick 2.0

Rectangle {
    width: root.width
    height: root.height

    Row {
        id: row
        anchors.centerIn: parent

        Rectangle {
            id: image
        }

        Rectangle {
            id: buttons
        }
    }

}
