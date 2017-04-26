import QtQuick 2.2
import Sailfish.Silica 1.0

Page {
    id: menuPage
    allowedOrientations: Orientation.Landscape

    SilicaListView {
        anchors.fill: parent
        PullDownMenu {
            opacity: 1
            highlightColor: "blue"
            backgroundColor: "blue"
            Slider {
                id: slider
                label: "Звук"
                onPressed: console.log("Clicked slider")
                width: parent.width
                minimumValue: 0
                maximumValue: 10
                stepSize: 1
                valueText: value
            }

            /*MenuItem {
                text: "Настройки"
                onClicked: console.log("Настройки")
            }*/
            MenuLabel {
                        //anchors.horizontalCenter: parent.horizontalCenter
                        text: "Настройки"
                        color: "white"
            }
        }

        Label {
                text: "BomberMario"
                //truncationMode: TruncationMode.Fade
                color: "blue" //Theme.highlightColor

                anchors {
                    left: parent.left
                    leftMargin: Theme.horizontalPageMargin
                    right: parent.right
                    rightMargin: Theme.horizontalPageMargin
                    //verticalCenter: parent.verticalCenter
                }
            }


        BackgroundItem {
            Image {
                id: mainMenuIm
                //width: page.height
                //height: page.height
                source: "image/mainMenu960x540.jpg"
            }
        }


        Column {
            id: mainColumn
            width: parent.width
            spacing: Theme.paddingLarge
            anchors.centerIn: parent
            //anchors.verticalCenter: parent.verticalCenter// + parent.width / 3
            //anchors.horizontalCenter: parent.horizontalCenter// + parent.width / 2

            Button {
                text: "Новая игра"
                color: "blue"
                highlightBackgroundColor: "blue"
                highlightColor: "black"
                opacity: 1
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    onClicked: console.log("new game")
                }
            }
            Button {
                text: "продолжить"
                color: "blue"
                highlightBackgroundColor: "blue"
                highlightColor: "black"
                opacity: 1
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("FieldPage.qml"))
                }
            }
        }
    }
}
