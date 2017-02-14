import QtQuick.Dialogs 1.2
import QtQuick.Controls 1.5
import QtQml.Models 2.2
import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQml 2.2
import QtQuick.Controls.Styles 1.4
import "./"
//import com.cage 1.0

ApplicationWindow {
    id: wind
    visible: true
    width: 755
    height: 500
    maximumHeight: height
    maximumWidth: width
    minimumHeight: height
    minimumWidth: width
    title: qsTr("BomberMan")

    MainForm {
        id: main

        ///////////////////////////////////////
/*
        Rectangle {
            x: 10
            y: 10
            width: 60
            height: 60

            MyObject {
               id: myobject
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {

                    console.log(myobject.numInCage(8))

                }
            }
        }
*/
        ///////////////////////////////////////


        function setVisible(numDisplay) {
            /*
            1 - MainMenu
            2- Field
            3 - PauseMenu
            4 - BetweenLevels
            5 - GameOver
            6 - SureExit */
            switch(numDisplay) {
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
            }
        }

        // ЭТО cpp для заполнения массива
        /*MyObject {
               id: myObject
            }
            */

        //инициализация экранов

        //экран главного меню
        MainMenu {
            id: menu
            visible: true

        }
        //экран поля
        Field {
            id: field
            visible: false
        }
        //экран паузы
        PauseMenu {
            id: pauseMenu
            visible: false

        }
        //экран GameOver
        GameOver {
            id: gameOver
            visible: false
        }

        //экран выхода Sure Exit
        SureExit {
            id: exit
            visible: false
        }



        Image {
            visible: false
            id: box
            x: 10
            y: 10
            width: 34
            height: 34
            sourceSize.height: 34
            sourceSize.width: 34
            anchors.verticalCenter: parent.verticalCenter
            source: "im/box.png"
        }
    }
}
