import QtQuick.Controls 1.5
import QtQml.Models 2.2
import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQml 2.2
import QtQuick.Controls.Styles 1.4
import "./"


Rectangle {
Item {
     var scenelevelone = [[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
        [4,5,9,9,9,3,9,9,2,1,2,9,9,9,9,2,9,5,4],
        [4,9,4,9,4,2,4,9,4,9,4,9,4,9,4,9,4,9,4],
        [4,2,2,9,9,9,9,2,9,9,2,9,9,9,9,9,2,9,4],
        [4,9,4,9,4,2,4,9,4,2,4,9,4,9,4,9,4,9,4],
        [4,9,9,2,9,9,9,9,9,5,9,2,9,9,2,2,9,2,4],
        [4,9,4,9,4,9,4,2,4,9,4,9,4,9,4,9,4,9,4],
        [4,2,9,2,9,9,9,9,9,2,9,9,9,9,9,9,2,9,4],
        [4,9,4,9,4,2,4,9,4,9,4,9,4,9,4,2,4,9,4],
        [4,5,9,2,9,9,9,9,9,2,9,9,9,2,9,2,9,5,4],
        [4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]]
        function getfieldinfo(i,j){
            return scenelevelone[1][1];
        }
            function getcolor(i){
               // var
            }
}



        Repeater {
            model: 4
            Rectangle{
                width: 5
                height: 5
                color: "green"
                Text { text: "I'm item " + index }
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
        x: 647
        y: 27
        text: qsTr("Пауза")
        onClicked: {
            console.log("pause click")
            // visible PauseMenu
            main.setVisible(3)
        }
    }

    Button {
        id: gameOverButton
        x: 45
        y: 34
        text: qsTr("GameOver")
        onClicked: {
            console.log("gameover click")
            fieldWindow.visible = false
            // visible PauseMenu
            main.setVisible(5)
        }
    }
}
