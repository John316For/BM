import QtQuick.Controls 1.5
import QtQml.Models 2.2
import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQml 2.2
import QtQuick.Controls.Styles 1.4
import "./"
import "Scene.js" as Scene

Item{

Rectangle {

    Repeater {
            id:first
            model: 209
            Rectangle{
                id:cage
                   x: cage.width*(index%19)
                   y: cage.height*Math.floor((index)/19)
                   width: 25
                   height: 25
                   color: Scene.getcolor(index)
                   Image {
                       anchors.fill: parent
                       //fillMode: Image.Tile
                       source: Scene.getpicture(index)
                   }
                   //Text { text: "x" + cage.x +" y"+cage.y}
                }
            }

    id: fieldWindow
    width: parent.width // 735
    height: parent.height //500
    color: "#b6b2b2"
    //property alias backImage: backImage
    anchors.fill: parent
      Button {
        id: pauseButton
       // x: 647
        //y: 27
        anchors.right: parent.right
        anchors.margins: 10
        text: qsTr("Пауза")
        onClicked: {
            console.log("pause click")
            // visible PauseMenu
            main.setVisible(3)
        }
    }

    Button {
        id: gameOverButton
       // x: 45
        //y: 34
        anchors.top: pauseButton.bottom
        anchors.right: parent.right
        anchors.margins: 10
        text: qsTr("GameOver")
        onClicked: {
            console.log("gameover click")
            fieldWindow.visible = false
            // visible PauseMenu
            main.setVisible(5)
        }
    }
}

}
