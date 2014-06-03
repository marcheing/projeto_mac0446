import QtQuick 2.0
import QtMultimedia 5.0
import "Logic.js" as Logic

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
        Logic.manage_speed(event, sweepingTime3);
        if(row.visible && event.key === Qt.Key_Return)
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
        else if (vogaisFimColumn.visible  && event.key === Qt.Key_Return)
        {
            root.state = "MenuAlfabeto"
            rootVogais.state = "vogaisA"
        }
        sweepingTime3.interval = root.menuSpeed;
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
            PropertyChanges {
                target: vogalImagem
                source: "images/abacaxi.png"
            }
        },
        State {
            name: "vogaisE"
            PropertyChanges {
                target: vogal
                text: "E"
            }
            PropertyChanges {
                target: vogalImagem
                source: "images/elefante.png"
            }
        },
        State {
            name: "vogaisI"
            PropertyChanges {
                target: vogal
                text: "I"
            }
            PropertyChanges {
                target: vogalImagem
                source: "images/igreja.png"
            }
        },
        State {
            name: "vogaisO"
            PropertyChanges {
                target: vogal
                text: "O"
            }
            PropertyChanges {
                target: vogalImagem
                source: "images/oculos.png"
            }
        },
        State {
            name: "vogaisU"
            PropertyChanges {
                target: vogal
                text: "U"
            }
            PropertyChanges {
                target: vogalImagem
                source: "images/uva.png"
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
        spacing: 40
        anchors.centerIn: parent

        Text {
            id: vogaisFimTextoPrincipal
            text: "Fim\ndas\nVogais"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 56
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

            BorderImage {
                id: vogalImagem
                width: 250
                height: 200
                horizontalTileMode: BorderImage.Stretch
                verticalTileMode: BorderImage.Stretch
            }

            Text {
                id: vogal
                font.pointSize: 96
                x: vogalImagem.x + vogalImagem.width / 2 - width / 2
            }

        }


        Column {
            id: buttonsColumn
            y: parent.y
            spacing: 20

            ImageButton {
                id: soundButton
                width: 150
                height: 150

                imageOnFocus: "images/sound_focus.png"
                imageOutOfFocus: "images/sound_no_focus.png"
            }

            ImageButton {
                id: nextButton
                width: 140
                height: 80

                imageOnFocus: "images/avancar_foco.png"
                imageOutOfFocus: "images/avancar_sem_foco.png"
            }

            ImageButton {
                id: previousButton
                width: 140
                height: 80

                imageOnFocus: "images/voltar_foco.png"
                imageOutOfFocus: "images/voltar_sem_foco.png"
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
                nextButton.focus = true;
            }
            else if (nextButton.focus)
            {
                previousButton.focus = true;
            }
            else if (previousButton.focus)
            {
                soundButton.focus = true;
            }
            else
            {
                soundButton.focus = true;
                sweepingTime3.interval = root.menuSpeed
            }
        }
    }

}
