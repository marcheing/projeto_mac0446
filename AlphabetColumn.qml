import QtQuick 2.0
import QtMultimedia 5.0
import "Logic.js" as Logic

Column {
    id: alfabetoColumn
    spacing: 20
    visible: false

    Keys.onPressed: {
        if(event.key === Qt.Key_Escape)
            Qt.quit()
        Logic.manage_speed(event, sweepingTime2);
        if(alfabetoColumn.visible && event.key === Qt.Key_Return)
        {
            if(consoantes.focus)
            {
                root.state = "AlfabetoConsoantes"
            }
            else if(vogais.focus)
            {
                root.state = "AlfabetoVogais"
            }
            else
            {
                root.state = "MenuPrincipal"
            }
//            sweepingTime2.interval = 1
            if (sweepingTime2.running)
            {
            sweepingTime2.restart()
            }
        sweepingTime2.interval = root.menuSpeed;
    }
    }


    MenuButton {
        id: consoantes
        width: page.width / 2
        height: page.height / 5
        borderWidth: 5
        borderColor: "black"
        text: "Consoantes\nB - C - G - T - Z"
        fontSize: 24
        radius: 100
        colorFocusUp: "skyblue"
        colorFocusDown: "blue"
    }

    MenuButton {
        id: vogais
        width: page.width / 2
        height: page.height / 5
        radius: 100
        borderWidth: 5
        borderColor: "black"
        text: "Vogais\nA - E - I - O - U"
        fontSize: 24
        colorFocusUp: "pink"
        colorFocusDown: "red"
    }

    ImageButton {
        id: voltar
        width: page.width / 2
        height: page.height / 5

        imageOnFocus: "images/voltar_foco.png"
        imageOutOfFocus: "images/voltar_sem_foco.png"
    }

    SoundEffect {
        id: soundVogais
        source: "sounds/vogais.wav"
    }

    SoundEffect {
        id: soundConsoantes
        source: "sounds/consoantes.wav"
    }


    Timer {
        id: sweepingTime2
        running: alfabetoColumn.visible
        repeat: true
        interval: 1
        onTriggered: {
            if(consoantes.focus)
            {
                vogais.focus = true;
                soundVogais.play()
            }
            else if (vogais.focus)
            {
                voltar.focus = true;
            }
            else if (voltar.focus)
            {
                consoantes.focus = true;
                soundConsoantes.play()
            }
            else {
                consoantes.focus = true;
                soundConsoantes.play()
                sweepingTime2.interval = root.menuSpeed
            }
        }
    }


}
