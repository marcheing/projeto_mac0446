import QtQuick 2.2
import QtQuick.Controls 1.1

Item {
    id: root
    width: 640
    height: 480

    states: [
        State {
            name: "MenuPrincipal"
            PropertyChanges {
                target: menuGradientStop1
                color: "green"
            }
        },
        State {
            name: "MenuPalavras"
            PropertyChanges {
                target: menuGradientStop1
                color: "red"
            }
            PropertyChanges {
                target: mainMenuColumn
                visible: false
            }
        },
        State {
            name: "MenuAlfabeto"
            PropertyChanges {
                target: menuGradientStop1
                color: "blue"
            }
            PropertyChanges {
                target: titleText
                text: "Alfabeto"
            }
            PropertyChanges {
                target: mainMenu
                visible: false
            }
            PropertyChanges {
                target: alphabetMenu
                visible: true
            }
        }
    ]

    transitions: [
        Transition {
            to: "*"
            ParallelAnimation {
                ColorAnimation {
                    target: menuGradientStop1
                    duration: 1000
                }
            }
        }
    ]



    Rectangle {
        id: page
        width: parent.width
        height: parent.height

        gradient: Gradient {
            id: menuGradient
            GradientStop {
                id: menuGradientStop1
                position: 0.0
                color: "green"
            }
            GradientStop {
                id: menuGradientStop2
                position: 1.0
                color: "white"
            }
        }

        TitleText {
            id: titleText
        }

        Rectangle {
            id: menuContent
            anchors.centerIn: parent
            width: parent.width
            height: parent.height - 30
            color: "transparent"

            MainMenuColumn {
                id: mainMenu
                anchors.centerIn: parent
            }

            AlphabetColumn {
                id: alphabetMenu
                anchors.centerIn: parent
            }
        }

    }


}
