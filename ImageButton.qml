import QtQuick 2.0

Rectangle {
    id: root
    property string imageOnFocus
    property string imageOutOfFocus
    color: "transparent"

    Image {
        id: buttonImage
        source: root.focus ? imageOnFocus : imageOutOfFocus
        anchors.fill: parent
    }
}
