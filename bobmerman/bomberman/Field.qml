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
    id: fieldWindow
    width: parent.width // 735
    height: parent.height //500
    color: "#b6b2b2"
    //property alias backImage: backImage
    anchors.fill: parent


    Repeater {
            id:first
            model: 209
            Rectangle{
                id:cage
                   x: cage.width*(index%19)
                   y: cage.height*Math.floor((index)/19)
                   width: 30
                   height: 30
                   color: Scene.getcolor(index)
                   Image {
                       anchors.fill: parent
                       //fillMode: Image.Tile
                       source: Scene.getpicture(index)
                   }
                   //Text { text: "x" + cage.x +" y"+cage.y}
                }

            }
//    MouseArea {
//     anchors.fill: parent
    Item {
        anchors.fill: parent
        id: keyHandler
        focus: true
     Keys.onPressed:  {
     if (event.isAutoRepeat) {
             return;
         }

         switch (event.key) {
         case Qt.Key_A:
             console.log("Key_Left pressed")
            Scene.permakestep(-1,0);
             break;
         case Qt.Key_D:
             console.log("Key_Right pressed")
            Scene.permakestep(1,0);
             break;
         case Qt.Key_W:
             console.log("Key_UP pressed")
            Scene.permakestep(0,-1);
             break;
         case Qt.Key_S:
             console.log("Key_Down pressed")
            Scene.permakestep(0,1);
             break;
         }
     }

     Keys.onReleased: {
         if (event.isAutoRepeat) {
             return;
         }
         switch (event.key) {
         case Qt.Key_Left:

             break;
         case Qt.Key_Right:

             break;
         case Qt.Key_Up:

             break;
         case Qt.Key_Down:

             break;
         }
     }
    }

      Button {
        id: pauseButton
        x: 647
        y: 27
        //anchors.left: parent.horizontalCenter
        //anchors.margins: 10
        text: qsTr("Пауза")
        onClicked: {
            console.log("pause click")
            // visible PauseMenu
            main.setVisible(3)
        }
    }

    Button {
        id: gameOverButton
        x: 647
        y: 34
        anchors.top: pauseButton.bottom
        //anchors.left: parent.horizontalCenter
        //anchors.margins: 10
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
