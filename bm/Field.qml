import QtQuick.Controls 1.5
import QtQml.Models 2.2
import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQml 2.2
import QtQuick.Controls.Styles 1.4
import "./"

Rectangle {
    id: fieldWindow
    width: parent.width // 735
    height: parent.height //500
    color: "#b6b2b2"
    property alias backImage: backImage
    anchors.fill: parent

    Image {
        id: backImage
        x: 146
        y: 400
        width: 735
        height: 401
        anchors.verticalCenterOffset: 42
        anchors.horizontalCenterOffset: 0
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        sourceSize.height: 401
        sourceSize.width: 735
        fillMode: Image.Tile
        source: "im/back_clean.png"
        Grid {
            id: grid
            x: 31
            y: 30
            width: 671
            height: 340
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            rows: 10
            columns: 20
            Repeater {
                id: composer
                model: 10*20

                Image {
                    width: 34
                    height: 34
                    sourceSize.height: 34
                    sourceSize.width: 34
                    source:  {
              //          console.log(

                      //  cField.numInCage(index).toString();

                        //myObjsect.
                        "im/bomb.png"
                    }
                }


                /*
                1 - MainMenu
                2- Field
                3 - PauseMenu
                4 - BetweenLevels
                5 - GameOver
                6 - SureExit */

               /* Repeater { model: 24
                                   Rectangle { width: 70; height: 70
                                               color: "lightgreen"

                                               Text { text: index
                                                      font.pointSize: 30
                                                      anchors.centerIn: parent } }
                        }*/

                /*switch(numDisplay) {
                case 1:
                    console.log("MainMenu display activated")
                    menu.visible = true
                    field.visible = false
                break;
                case 2:
                    console.log("Field display activated")
                    field.visible = true
                break;
                case 3:
                    console.log("PauseMenu display activated")
                    pauseMenu.visible = true
                break;
                case 4:
                    console.log("BetweenLevels display activated")
                    //pauseMenu.visible = true
                break;
                case 5:
                    console.log("GameOver display activated")
                    gameOver.visible = true
                break;
                case 6:
                    console.log("SureExit display activated")
                    exit.visible = true
                break;
                default: console.log("ERROR:default case in display activated")
                break;
                }*/


            }
        }
    }

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
