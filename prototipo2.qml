import QtQuick 2.2
import QtQuick.Controls 1.1

Item {
    id: root
    width: 640
    height: 480

    Keys.onPressed: {
        if(event.key == Qt.Key_Escape)
            Qt.quit()
        if(alfabeto.focus)
        {
            root.state = "MenuAlfabeto"
        }
        else if(palavras.focus)
        {
            root.state = "MenuPalavras"
        }
    }

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
        },
        State {
            name: "MenuAlfabeto"
            PropertyChanges {
                target: menuGradientStop1
                color: "blue"
            }
        }
    ]

    transitions: [
        Transition {
            to: "*"
            ColorAnimation {
                target: menuGradientStop1
                duration: 1000
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

            MenuButton {
                id: alfabeto
                width: page.width / 2
                height: page.height / 4
                focus: true
                borderWidth: 5
                borderColor: "black"
                text: "Alfabeto"
                fontSize: 24
                radius: 100
                colorFocusUp: "skyblue"
                colorFocusDown: "blue"
            }

            MenuButton {
                id: palavras
                width: page.width / 2
                height: page.height / 4
                radius: 100
                focus: false
                borderWidth: 5
                borderColor: "black"
                text: "palavras"
                fontSize: 24
                colorFocusUp: "pink"
                colorFocusDown: "red"
            }


        }
    }
}
