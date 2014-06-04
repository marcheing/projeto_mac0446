import QtQuick 2.0
import QtMultimedia 5.0
import "Logic.js" as Logic

Rectangle {
    id: rootPalavras
    width: root.width
    height: root.height - 30
    color: parent.color
    anchors.centerIn: parent
    visible: false
    state: "Palavras1"

    Keys.onPressed: {
        if(event.key === Qt.Key_Escape)
            Qt.quit()
        Logic.manage_speed(event, sweepingTime5);
        if(row.visible && event.key === Qt.Key_Return)
        {
            var soundMap = {}
            soundMap['1'] = sound1
            soundMap['2'] = sound2
            soundMap['3'] = sound3
            soundMap['4'] = sound4
            soundMap['5'] = sound5
            if(soundButton.focus)
            {
                soundMap[palavra.text].play()
            }
            else if (nextButton.focus)
            {
                if(rootPalavras.state == "Palavras1")
                    rootPalavras.state = "Palavras2"
                else if(rootPalavras.state == "Palavras2")
                    rootPalavras.state = "Palavras3"
                else if(rootPalavras.state == "Palavras3")
                    rootPalavras.state = "Palavras4"
                else if(rootPalavras.state == "Palavras4")
                    rootPalavras.state = "Palavras5"
                else if(rootPalavras.state == "Palavras5")
                    rootPalavras.state = "PalavrasFim"
            }
            else
            {
                if(rootPalavras.state == "Palavras1")
                    root.state = "MenuPrincipal"
                else if (rootPalavras.state == "Palavras2")
                    rootPalavras.state = "Palavras1"
                else if(rootPalavras.state == "Palavras3")
                    rootPalavras.state = "Palavras2"
                else if(rootPalavras.state == "Palavras4")
                    rootPalavras.state = "Palavras3"
                else if(rootPalavras.state == "Palavras5")
                    rootPalavras.state = "Palavras4"
            }
            soundButton.focus = true;
            if (sweepingTime5.running)
            {
            sweepingTime5.restart()
            }
        }
        else if (palavrasFimColumn.visible  && event.key === Qt.Key_Return)
        {
            root.state = "MenuPrincipal"
            rootPalavras.state = "Palavras1"
        }
        sweepingTime5.interval = root.menuSpeed;
    }

    SoundEffect {
        id: sound1
        source: "sounds/1.wav"
    }

    SoundEffect {
        id: sound2
        source: "sounds/2.wav"
    }

    SoundEffect {
        id: sound3
        source: "sounds/3.wav"
    }

    SoundEffect {
        id: sound4
        source: "sounds/4.wav"
    }

    SoundEffect {
        id: sound5
        source: "sounds/5.wav"
    }


    states: [
        State {
            name: "Palavras1"
            PropertyChanges {
                target: palavra
                text: "Galo"
            }
            PropertyChanges {
                target: palavraImagem
                source: "images/galo.png"
            }
        },
        State {
            name: "Palavras2"
            PropertyChanges {
                target: palavra
                text: "Flor"
            }
            PropertyChanges {
                target: palavraImagem
                source: "images/flor.png"
            }
        },
        State {
            name: "Palavras3"
            PropertyChanges {
                target: palavra
                text: "Peixe"
            }
            PropertyChanges {
                target: palavraImagem
                source: "images/peixe.png"
            }
        },
        State {
            name: "Palavras4"
            PropertyChanges {
                target: palavra
                text: "Lua"
            }
            PropertyChanges {
                target: palavraImagem
                source: "images/lua.png"
            }
        },
        State {
            name: "Palavras5"
            PropertyChanges {
                target: palavra
                text: "Maçã"
            }
            PropertyChanges {
                target: palavraImagem
                source: "images/maça.png"
            }
        },
        State {
            name: "PalavrasFim"
            PropertyChanges {
                target: row
                visible: false
            }
            PropertyChanges {
                target: palavrasFimColumn
                visible: true
            }
            PropertyChanges {
                target: backToMenuButton
                focus: true
            }
        }
    ]

    Column {
        id: palavrasFimColumn
        visible: false
        spacing: 40
        anchors.centerIn: parent

        Text {
            id: palavrasFimTextoPrincipal
            text: "Fim\ndas\nPalavras"
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
            id: palavrasColumn
            y: parent.y
            spacing: 20

            BorderImage {
                id: palavraImagem
                width: 250
                height: 200
                horizontalTileMode: BorderImage.Stretch
                verticalTileMode: BorderImage.Stretch
            }

            Text {
                id: palavra
                font.pointSize: 96
                x: palavraImagem.x + palavraImagem.width / 2 - width / 2
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
        id: sweepingTime5
        running: rootPalavras.visible && row.visible
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
                sweepingTime5.interval = root.menuSpeed
            }
        }
    }

}
