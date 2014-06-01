import QtQuick 2.0

Rectangle {
    id: buttonRoot
    property int borderWidth
    property color borderColor
    property color colorFocusUp
    property color colorFocusDown
    property int rectWidth
    property int rectHeight

    width: rectWidth
    height: rectHeight
    color: buttonRoot.focus ? colorFocusUp : colorFocusDown

    BorderImage {
         width: rectWidth - buttonRoot.borderWidth
         height: rectHeight - buttonRoot.borderWidth
         border {
             left: buttonRoot.borderWidth
             top: buttonRoot.borderWidth
             right: buttonRoot.borderWidth
             bottom: buttonRoot.borderWidth
         }
         horizontalTileMode: BorderImage.Stretch
         verticalTileMode: BorderImage.Stretch
         source: "images/sound.png"
     }
}
