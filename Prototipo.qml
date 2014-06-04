import QtQuick 2.2
import QtQuick.Controls 1.1

Item {
    id: root
    width: 640
    height: 480
    state: "MenuPrincipal"
    property int menuSpeed: 1000;

    states: [
        State {
            name: "MenuPrincipal"
        },
        State {
            name: "MenuPalavras"
            PropertyChanges {
                target: titleText
                text: "Palavras"
            }
            PropertyChanges {
                target: mainMenu
                visible: false
            }
            PropertyChanges {
                target: alphabetMenu
                visible: false
            }
            PropertyChanges {
                target: vogaisScreen
                visible: false
            }
            PropertyChanges {
                target: consoantesScreen
                visible: false
            }
            PropertyChanges {
                target: palavrasScreen
                visible: true
            }

        },
        State {
            name: "MenuAlfabeto"
            PropertyChanges {
                target: titleText
                text: "Letras"
            }
            PropertyChanges {
                target: mainMenu
                visible: false
            }
            PropertyChanges {
                target: alphabetMenu
                visible: true
            }
            PropertyChanges {
                target: vogaisScreen
                visible: false
            }
            PropertyChanges {
                target: consoantesScreen
                visible: false
            }
            PropertyChanges {
                target: palavrasScreen
                visible: false
            }
        },
        State {
            name: "AlfabetoVogais"
            PropertyChanges {
                target: titleText
                text: "Letras ~ Vogais"
            }
            PropertyChanges {
                target: mainMenu
                visible: false
            }
            PropertyChanges {
                target: alphabetMenu
                visible: false
            }
            PropertyChanges {
                target: vogaisScreen
                visible: true
            }
            PropertyChanges {
                target: consoantesScreen
                visible: false
            }
            PropertyChanges {
                target: palavrasScreen
                visible: false
            }
        },
        State {
             name: "AlfabetoConsoantes"
             PropertyChanges {
                 target: titleText
                 text: "Letras ~ Consoantes"
             }
             PropertyChanges {
                 target: mainMenu
                 visible: false
             }
             PropertyChanges {
                 target: alphabetMenu
                 visible: false
             }
             PropertyChanges {
                 target: vogaisScreen
                 visible: false
             }
             PropertyChanges {
                 target: consoantesScreen
                 visible: true
             }
             PropertyChanges {
                 target: palavrasScreen
                 visible: false
             }
             }

    ]

    Rectangle {
        id: page
        width: parent.width
        height: parent.height
        color: "#C2DFFF"
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
            ConsoantesScreen {
                id: consoantesScreen
                anchors.centerIn: parent
            }
            PalavrasScreen {
                id: palavrasScreen
                anchors.centerIn: parent
            }
        }

    }

    SweepingSpeedIndicator {
        id: speedIndicator
    }


}
