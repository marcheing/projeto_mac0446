import QtQuick 2.0

Column {
    id: alfabetoColumn
    spacing: 20
    visible: false

    Keys.onPressed: {
        if(alfabetoColumn.visible)
        {
            if(event.key === Qt.Key_Escape)
                Qt.quit()
            if(consoantes.focus)
            {
                root.state = "MenuAlfabeto"
            }
            else if(vogais.focus)
            {
                root.state = "MenuPalavras"
            }
            else
            {
                root.state = "MenuPrincipal"
            }
            sweepingTime2.interval = 1
        }
    }

    MenuButton {
        id: consoantes
        width: page.width / 2
        height: page.height / 5
        borderWidth: 5
        borderColor: "black"
        text: "Consoantes"
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
        text: "Vogais"
        fontSize: 24
        colorFocusUp: "pink"
        colorFocusDown: "red"
    }

    MenuButton {
        id: voltar
        width: page.width / 2
        height: page.height / 5
        radius: 100
        borderWidth: 5
        borderColor: "black"
        text: "Voltar"
        fontSize: 24
        colorFocusUp: "lightgreen"
        colorFocusDown: "green"
    }

    Timer {
        id: sweepingTime2
        running: alfabetoColumn.visible
        repeat: true
        interval: 1
        onTriggered: {
            if(consoantes.focus)
            {
                consoantes.focus = false;
                vogais.focus = true;
                voltar.focus = false;
            }
            else if (vogais.focus)
            {
                consoantes.focus = false;
                vogais.focus = false;
                voltar.focus = true;
            }
            else if (voltar.focus)
            {
                consoantes.focus = true;
                vogais.focus = false;
                voltar.focus = false;
            }
            else {
                consoantes.focus = true;
                sweepingTime2.interval = 1000
            }
        }
    }


}
