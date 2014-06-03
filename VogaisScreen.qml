import QtQuick 2.0
import QtMultimedia 5.0

Rectangle {
    id: rootVogais
    width: root.width
    height: root.height - 30
    color: parent.color
    anchors.centerIn: parent
    visible: false
    state: "vogaisA"

    Keys.onPressed: {
        if(event.key === Qt.Key_Escape)
            Qt.quit()
        if(row.visible)
        {
            var soundMap = {}
            soundMap['A'] = soundA
            soundMap['E'] = soundE
            soundMap['I'] = soundI
            soundMap['O'] = soundO
            soundMap['U'] = soundU
            if(soundButton.focus)
            {
                soundMap[vogal.text].play()
            }
            else if (nextButton.focus)
            {
                if(rootVogais.state == "vogaisA")
                    rootVogais.state = "vogaisE"
                else if(rootVogais.state == "vogaisE")
                    rootVogais.state = "vogaisI"
                else if(rootVogais.state == "vogaisI")
                    rootVogais.state = "vogaisO"
                else if(rootVogais.state == "vogaisO")
                    rootVogais.state = "vogaisU"
                else if(rootVogais.state == "vogaisU")
                    rootVogais.state = "vogaisFim"
            }
            else
            {
                if(rootVogais.state == "vogaisA")
                    root.state = "MenuAlfabeto"
                else if (rootVogais.state == "vogaisE")
                    rootVogais.state = "vogaisA"
                else if(rootVogais.state == "vogaisI")
                    rootVogais.state = "vogaisE"
                else if(rootVogais.state == "vogaisO")
                    rootVogais.state = "vogaisI"
                else if(rootVogais.state == "vogaisU")
                    rootVogais.state = "vogaisO"
            }
        }
        else if (vogaisFimColumn.visible)
        {
            root.state = "MenuAlfabeto"
            rootVogais.state = "vogaisA"
        }
    }

    SoundEffect {
        id: soundA
        source: "sounds/a.wav"
    }

    SoundEffect {
        id: soundE
        source: "sounds/e.wav"
    }

    SoundEffect {
        id: soundI
        source: "sounds/i.wav"
    }

    SoundEffect {
        id: soundO
        source: "sounds/o.wav"
    }

    SoundEffect {
        id: soundU
        source: "sounds/u.wav"
    }


    states: [
        State {
            name: "vogaisA"
            PropertyChanges {
                target: vogal
                text: "A"
            }
        },
        State {
            name: "vogaisE"
            PropertyChanges {
                target: vogal
                text: "E"
            }
        },
        State {
            name: "vogaisI"
            PropertyChanges {
                target: vogal
                text: "I"
            }
        },
        State {
            name: "vogaisO"
            PropertyChanges {
                target: vogal
                text: "O"
            }
        },
        State {
            name: "vogaisU"
            PropertyChanges {
                target: vogal
                text: "U"
            }
        },
        State {
            name: "vogaisFim"
            PropertyChanges {
                target: row
                visible: false
            }
            PropertyChanges {
                target: vogaisFimColumn
                visible: true
            }
        }
    ]

    Column {
        id: vogaisFimColumn
        visible: false
        spacing: 30
        anchors.centerIn: parent

        Text {
            id: vogaisFimTextoPrincipal
            text: "Fim\ndas\nVogais"
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 64
        }

        MenuButton {
            id: backToMenuButton
            focus: true
            height: 80
            radius: 100
            borderWidth: 5
            borderColor: "black"
            text: "Menu Principal"
            fontSize: 24
            colorFocusUp: "pink"
            colorFocusDown: "red"
        }
    }

    Row {
        id: row
        anchors.centerIn: parent
        spacing: parent.width / 5

        Column {
            id: vogaisColumn
            y: parent.y
            spacing: 20

            Rectangle {
                id: image
                color: "gold"
                width: 200
                height: 200
                Text {
                    text: "Placeholder para imagem"
                }
            }

            Text {
                id: vogal
                font.pointSize: 96
                x: image.x + image.width / 2 - width / 2
            }

        }


        Column {

            states: [
                State {
                    name: "first"
                    PropertyChanges {
                        target: object

                    }
                },
                State {
                    name: "mid"
                    PropertyChanges {
                        target: object

                    }
                },
                State {
                    name: "last"
                    PropertyChanges {
                        target: object

                    }
                }
            ]

            id: buttonsColumn
            y: parent.y
            spacing: 20
            SoundButton {
                id: soundButton
                borderWidth: 10
                borderColor: "black"
                colorFocusUp: "yellow"
                colorFocusDown: "transparent"
                rectWidth: 150
                rectHeight: 150
            }

            MenuButton {
                id: nextButton
                width: 140
                height: 80
                radius: 100
                borderWidth: 5
                borderColor: "black"
                text: "Próximo"
                fontSize: 24
                colorFocusUp: "pink"
                colorFocusDown: "red"
            }

            MenuButton {
                id: previousButton
                width: 140
                height: 80
                radius: 100
                borderWidth: 5
                borderColor: "black"
                text: "Anterior"
                fontSize: 24
                colorFocusUp: "lightblue"
                colorFocusDown: "blue"
            }
        }
    }

    Timer {
        id: sweepingTime3
        running: rootVogais.visible && row.visible
        repeat: true
        interval: 1
        onTriggered: {
            if(soundButton.focus)
            {
                soundButton.focus = false;
                nextButton.focus = true;
                previousButton.focus = false;
            }
            else if (nextButton.focus)
            {
                soundButton.focus = false;
                nextButton.focus = false;
                previousButton.focus = true;
            }
            else if (previousButton.focus)
            {
                soundButton.focus = true;
                nextButton.focus = false;
                previousButton.focus = false;
            }
            else
            {
                soundButton.focus = true;
                sweepingTime3.interval = 1000
            }
        }
    }

}
