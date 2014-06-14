import QtQuick 2.0
import QtMultimedia 5.0
import "Logic.js" as Logic

Rectangle {
    id: rootForca
    width: root.width
    height: root.height - 30
    color: parent.color
    anchors.centerIn: parent
    visible: false
    state: "ObjFlor"

    Keys.onPressed: {
        if(event.key === Qt.Key_Escape)
            Qt.quit()
        Logic.manage_speed(event, sweepingTime5);
        if(column.visible && event.key === Qt.Key_Return)
        {
            if(rootForca.state == "ObjFlor")
                rootForca.state = "ObjLua"
            else(rootForca.state == "ObjLua")
                rootForca.state = "ObjFlor"
        }

        if (sweepingTime5.running)
        {
        sweepingTime5.restart()
        }

    }

    states: [
        State {
            name: "ObjFlor"
            PropertyChanges {
                target: pictureObject
                source: "images/flor.png"
            }
            PropertyChanges {
                target: palavra
                text: "_lor"
            }
            PropertyChanges {
                target: palavra2
                text: "F"
            }
        },

        State {
            name: "ObjLua"
            PropertyChanges {
                target: pictureObject
                source: "images/lua.png"
            }
            PropertyChanges {
                target: palavra
                text: "L_a"
            }

            PropertyChanges {
                target: palavra2
                text: "u"
            }
        }
    ]

    Column {
        id: column
        spacing: parent.width / 5

        Row{
            id: object
            x: parent.x / 2
            y: (parent.y / 4) + 15
            spacing: 20

            BorderImage {
                id: pictureObject
                width: 200
                height: 350
                horizontalTileMode: BorderImage.Stretch
                verticalTileMode: BorderImage.Stretch
            }
        }
    }

    Row {
        id: row
        x: 250
        y: 75
        spacing: 20
        Text {
            id: palavra
            font.pointSize: 96
        }
    }

    Row {
        id: buttonsRow
        x: 220
        y: 300
        spacing: 20


        ImageButton {
            id: button1
            width: 100
            height: 100

            imageOnFocus: "images/x_focus.png"
            imageOutOfFocus: "images/x_no_focus.png"
        }

        ImageButton {
            id: button2
            width: 100
            height: 100

            imageOnFocus: "images/f_focus.png"
            imageOutOfFocus: "images/f_no_focus.png"
        }

        ImageButton {
            id: button3
            width: 100
            height: 100

            imageOnFocus: "images/b_focus.png"
            imageOutOfFocus: "images/b_no_focus.png"
        }
    }

    Timer {
        id: sweepingTime5
        running: rootForca.visible && column.visible
        repeat: true
        interval: 1
        onTriggered: {
            if (button1.focus)
            {
                button2.focus = true;
            }
            else if (button2.focus)
            {
                button3.focus = true;
            }
            else if (button3.focus)
            {
                button1.focus = true;
            }
            else
            {
                button1.focus = true;
                sweepingTime5.interval = root.menuSpeed
            }
        }
    }
}
