import QtQuick 2.0

Rectangle {
    id: root
    property int borderWidth
    property color borderColor
    property string text
    property int fontSize
    property color colorFocusUp
    property color colorFocusDown

    border.width: borderWidth
    border.color: borderColor

    Text {
        id: rectText
        text: root.text
        anchors.centerIn: parent
        font.pointSize: fontSize
    }

    gradient: Gradient {
        id: menuButtonGradient
        GradientStop {
            id: gradientStop1
            position: 0.0
            color: root.focus ? colorFocusUp : "lightgray"
        }
        GradientStop {
            id: gradientStop2
            position: 1.0
            color: root.focus ? colorFocusDown: "gray"
        }
    }


}
