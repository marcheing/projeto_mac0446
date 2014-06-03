import QtQuick 2.0

Rectangle {
    id: rect
    color: "transparent"
    state: "hidden"
    anchors {
        right: parent.right
        bottom: parent.bottom
    }

    width: indicator.paintedWidth
    height: indicator.paintedHeight

    states: [
        State {
            name: "hidden"
            PropertyChanges {
                target: indicator
                color: "transparent"
            }
        },
        State {
            name: "showing"
            PropertyChanges {
                target: indicator
                color: "#000000"
            }
        }
    ]

    Text {
        id: indicator
        text: "Tempo de varredura: " + root.menuSpeed / 1000 + " segundos"
    }

    transitions: [
        Transition {
            from: "showing"
            to: "hidden"
            ColorAnimation {
                duration: 1000
            }
        }
    ]

    Timer {
        id: toTransparent
        running: rect.state == "showing"
        onTriggered: {
            rect.state = "hidden"
        }
    }
}
