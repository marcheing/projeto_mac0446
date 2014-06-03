import QtQuick 2.0

Rectangle {
    width: 50
    height: 50
    Text {
        id: myText
        anchors.centerIn: parent
        text: mySliderHandle.x
    }

    Rectangle {
        id: mySlider

        anchors {
            left: parent.left
            right: parent.right
            bottom: parent.bottom
            leftMargin: 20
            rightMargin: 20
            bottomMargin: 10
        }

        height: 20
        radius: 10
        smooth: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "white" }
            GradientStop { position: 1.0; color: "gray" }
        }

        Rectangle {
            id: mySliderHandle
            x: 1; y: 1; width: 30; height: 20
            radius: 10
            smooth: true
            color: "blue"

            MouseArea {
                anchors.fill: parent
                drag.target: parent
                drag.axis: Drag.XAxis
                drag.minimumX: 20
                drag.maximumX: 200
            }
        }
    }
}
