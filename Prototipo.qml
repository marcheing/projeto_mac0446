import QtQuick 2.2
import QtQuick.Controls 1.1

Item {
    id: root
    width: 640
    height: 480

    states: [
        State {
            name: "MenuPrincipal"
        },
        State {
            name: "MenuPalavras"
        },
        State {
            name: "MenuAlfabeto"
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
        },
        State {
            name: "AlfabetoVogais"
            PropertyChanges {
                target: titleText
                text: "Alfabeto\nVogais"

            }
        },
        State {
             name: "AlfabetoConsoantes"
             PropertyChanges {
                 target: titleText
                 text: "Alfabeto\nConsoantes"
             }
        }

    ]

    Rectangle {
        id: page
        width: parent.width
        height: parent.height
        color: "#4e555b"
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

            VogaisScreen {
                id: vogaisScreen
                anchors.centerIn: parent
            }
        }

    }


}