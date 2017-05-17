import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: pausemenuPage
    allowedOrientations: Orientation.Landscape

    SilicaListView {
        anchors.fill: parent
        /*PullDownMenu {
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

            MenuItem {
                                        text: "Настройки"
                                                                                    onClicked: console.log("Настройки")
                                                                                                                                            }
            MenuLabel {
                //anchors.horizontalCenter: parent.horizontalCenter
                text: "Настройки"
                color: "white"
            }
        }*/

        Label {
            text: "Пауза"
            //truncationMode: TruncationMode.Fade
            color: "black"//Theme.highlightColor
            x:200
            y:50
            /*anchors {
                left: parent.left
                leftMargin: Theme.horizontalPageMargin
                right: parent.right
                rightMargin: Theme.horizontalPageMargin
                //verticalCenter: parent.verticalCenter
            }*/
        }

        Image {
            id: pauseMenuIm
            //width: page.height
            //height: page.height
            width: parent.width
            height: parent.height
            source: "image/pause.jpg"
        }

        Column {
            id: mainColumn
            width: parent.width
            spacing: Theme.paddingLarge
            anchors.centerIn: parent

            Button {
                text: "Возобновить игру"
                color: "black"
                highlightBackgroundColor: "black"
                highlightColor: "black"
                opacity: 1
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                  pageStack.push(Qt.resolvedUrl("FieldPage.qml"))
                }
            }
            Button {
                text: "Выйти в главное меню"
                color: "black"
                highlightBackgroundColor: "black"
                highlightColor: "black"
                opacity: 1
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("MenuPage.qml"))
                }
            }
        }
    }
}

