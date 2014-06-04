import QtQuick 2.0
import QtMultimedia 5.0
import "Logic.js" as Logic

Rectangle {
    id: rootConsoantes
    width: root.width
    height: root.height - 30
    color: parent.color
    anchors.centerIn: parent
    visible: false
    state: "consoantesB"

    Keys.onPressed: {
        if(event.key === Qt.Key_Escape)
            Qt.quit()
        Logic.manage_speed(event, sweepingTime3);
        if(row.visible && event.key === Qt.Key_Return)
        {
            var soundMap = {}
            soundMap['B'] = soundA
            soundMap['C'] = soundE
            soundMap['G'] = soundI
            soundMap['T'] = soundO
            soundMap['Z'] = soundU
            if(soundButton.focus)
            {
                soundMap[vogal.text].play()
            }
            else if (nextButton.focus)
            {
                if(rootConsoantes.state == "consoantesB")
                    rootConsoantes.state = "consoantesC"
                else if(rootConsoantes.state == "consoantesC")
                    rootConsoantes.state = "consoantesG"
                else if(rootConsoantes.state == "consoantesG")
                    rootConsoantes.state = "consoantesT"
                else if(rootConsoantes.state == "consoantesT")
                    rootConsoantes.state = "consoantesZ"
                else if(rootConsoantes.state == "consoantesZ")
                    rootConsoantes.state = "consoantesFim"
            }
            else
            {
                if(rootConsoantes.state == "consoantesB")
                    root.state = "MenuAlfabeto"
                else if (rootConsoantes.state == "consoantesC")
                    rootConsoantes.state = "consoantesB"
                else if(rootConsoantes.state == "consoantesG")
                    rootConsoantes.state = "consoantesC"
                else if(rootConsoantes.state == "consoantesT")
                    rootConsoantes.state = "consoantesG"
                else if(rootConsoantes.state == "consoantesZ")
                    rootConsoantes.state = "consoantesT"
            }
            soundButton.focus = true;
            sweepingTime3.restart()
        }
        else if (consoantesFimColumn.visible  && event.key === Qt.Key_Return)
        {
            root.state = "MenuAlfabeto"
            rootConsoantes.state = "consoantesB"
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
            name: "consoantesB"
            PropertyChanges {
                target: vogal
                text: "B"
            }
            PropertyChanges {
                target: vogalImagem
                source: "images/bola.png"
            }
        },
        State {
            name: "consoantesC"
            PropertyChanges {
                target: vogal
                text: "C"
            }
            PropertyChanges {
                target: vogalImagem
                source: "images/cachorro.png"
            }
        },
        State {
            name: "consoantesG"
            PropertyChanges {
                target: vogal
                text: "G"
            }
            PropertyChanges {
                target: vogalImagem
                source: "images/gato.png"
            }
        },
        State {
            name: "consoantesT"
            PropertyChanges {
                target: vogal
                text: "T"
            }
            PropertyChanges {
                target: vogalImagem
                source: "images/tartaruga.png"
            }
        },
        State {
            name: "consoantesZ"
            PropertyChanges {
                target: vogal
                text: "Z"
            }
            PropertyChanges {
                target: vogalImagem
                source: "images/zebra.png"
            }
        },
        State {
            name: "consoantesFim"
            PropertyChanges {
                target: row
                visible: false
            }
            PropertyChanges {
                target: consoantesFimColumn
                visible: true
            }
            PropertyChanges {
                target: backToMenuButton
                focus: true
            }
        }
    ]

    Column {
        id: consoantesFimColumn
        visible: false
        spacing: 40
        anchors.centerIn: parent

        Text {
            id: consoantesFimTextoPrincipal
            text: "Fim\ndas\nConsoantes"
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 56
        }

        MenuButton {
            id: backToMenuButton
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
            id: consoantesColumn
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
        running: rootConsoantes.visible && row.visible
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
