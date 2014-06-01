import QtQuick 2.0

Rectangle {
    id: rootVogais
    width: root.width
    height: root.height - 30
    color: parent.color
    anchors.centerIn: parent
    visible: false

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
                text: "A"
                x: image.x + image.width / 2 - width / 2
            }

        }


        Column {
            id: buttonsColumn
            y: parent.y
            spacing: 20
            SoundButton {
                id: soundButton
                borderWidth: 10
                borderColor: "black"
                colorFocusUp: "yellow"
                colorFocusDown: "gray"
                rectWidth: 180
                rectHeight: 180
            }

            MenuButton {
                id: nextButton
                width: 140
                height: 100
                radius: 100
                borderWidth: 5
                borderColor: "black"
                text: "Próximo"
                fontSize: 24
                colorFocusUp: "pink"
                colorFocusDown: "red"
            }
        }
    }

    Timer {
        id: sweepingTime3
        running: rootVogais.visible
        repeat: true
        interval: 1
        onTriggered: {
            if(soundButton.focus)
            {
                soundButton.focus = false;
                nextButton.focus = true;
            }
            else if (nextButton.focus)
            {
                soundButton.focus = true;
                nextButton.focus = false;
            }
            else
            {
                soundButton.focus = true;
                sweepingTime3.interval = 1000
            }
        }
    }

}
