import QtQuick 2.0

Column {
    id: mainMenuColumn
    spacing: 20
    visible: true

    Keys.onPressed: {
        if(mainMenuColumn.visible)
        {
            if(event.key === Qt.Key_Escape)
                Qt.quit()
            if(alfabeto.focus)
            {
                root.state = "MenuAlfabeto"
            }
            else if(palavras.focus)
            {
                root.state = "MenuPalavras"
            }
            sweepingTime.interval = 1
        }
    }

    MenuButton {
        id: alfabeto
        width: page.width / 2
        height: page.height / 4
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
                alfabeto.focus = false;
                palavras.focus = true;
            }
            else if (palavras.focus)
            {
                alfabeto.focus = true;
                palavras.focus = false;
            }
            else
            {
                alfabeto.focus = true;
                sweepingTime.interval = 1000;
            }
        }
    }


}
