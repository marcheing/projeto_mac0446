import QtQuick 2.0
import QtMultimedia 5.0
import "Logic.js" as Logic

Column {
    id: mainMenuColumn
    spacing: 20
    visible: true

    Keys.onPressed: {
        if(event.key === Qt.Key_Escape)
            Qt.quit()
        Logic.manage_speed(event, sweepingTime);
        if(mainMenuColumn.visible && event.key === Qt.Key_Return)
        {
            Logic.manage_speed(event, sweepingTime);
            if(alfabeto.focus)
            {
                root.state = "MenuAlfabeto"
                sweepingTime.interval = 1
            }
            else if(palavras.focus)
            {
                root.state = "MenuPalavras"
            }
        }
        sweepingTime.interval = root.menuSpeed;
    }

    SoundEffect {
        id: soundLetras
        source: "sounds/letras.wav"
    }

    SoundEffect {
        id: soundPalavras
        source: "sounds/palavras.wav"
    }

    MenuButton {
        id: alfabeto
        width: page.width / 2
        height: page.height / 4
        borderWidth: 5
        borderColor: "black"
        text: "Letras"
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
        borderWidth: 5
        borderColor: "black"
        text: "Palavras"
        fontSize: 24
        colorFocusUp: "pink"
        colorFocusDown: "red"
    }

    Timer {
        id: sweepingTime
        interval: 1
        running: mainMenuColumn.visible
        repeat: true
        onTriggered: {
            if(alfabeto.focus)
            {
                palavras.focus = true;
                soundPalavras.play()
            }
            else if (palavras.focus)
            {
                alfabeto.focus = true;
                soundLetras.play()
            }
            else
            {
                alfabeto.focus = true;
                soundLetras.play()
                sweepingTime.interval = root.menuSpeed;
            }
        }
    }


}
