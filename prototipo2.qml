import QtQuick 2.2
import QtQuick.Controls 1.1

Rectangle {
    id: page
    width: 640
    height: 480

    gradient: Gradient {
        GradientStop {
            position: 0.0
            color: "green"
        }
        GradientStop {
            position: 1.0
            color: "white"
        }
    }

    Timer {
        id: sweepingTime
        interval: 1000
        running: true
        repeat: true
        onTriggered: {
            if(alfabeto.focus)
            {
                alfabeto.focus = false;
                palavras.focus = true;
            }
            else
            {
                alfabeto.focus = true;
                palavras.focus = false;
            }
        }
    }

    Text {
        id: textAprendendoPortugues
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.y + 20
        text: "Aprendendo Português"
        font.pointSize: 24
    }

    Column {
        anchors.centerIn: parent
        spacing: 20

        Rectangle {
            id: alfabeto

            width: page.width / 2
            height: page.height / 4
            focus: true
            border.width: 5
            border.color: "black"
            Text {
                text: "Alfabeto"
                anchors.centerIn: parent
                font.pointSize: 24
            }

            radius: 100

            KeyNavigation.down: palavras
            KeyNavigation.up: palavras


            gradient: Gradient {
                GradientStop {
                    id: gradUp
                    position: 0.0
                    color: alfabeto.focus ? "lightsteelblue" : "lightgray"
                }
                GradientStop {
                    id: gradDown
                    position: 1.0
                    color: alfabeto.focus ? "blue": "gray" }
            }
        }

        Rectangle {
            id: palavras

            width: page.width / 2
            height: page.height / 4
            KeyNavigation.up: alfabeto
            KeyNavigation.down: alfabeto
            radius: 100
            focus: false
            border.width: 5
            border.color: "black"

            Text {
                text: "Palavras"
                anchors.centerIn: parent
                font.pointSize: 24
            }

            gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: palavras.focus ? "pink" : "lightgray"
                }
                GradientStop {
                    position: 1.0
                    color: palavras.focus ? "red": "gray"
                }
            }
        }
    }
}
