import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: gameoverPage
    allowedOrientations: Orientation.Landscape

    SilicaListView {
        anchors.fill: parent

        /*Label {
            text: "GameOver"
            color: "blue"
            x:200
            y:50

        }*/

        Image {
            id: gameOverIm
            width: parent.width
            height: parent.height
            source: "image/0fgj.jpg"
        }

        Column {
            id: mainColumn
            width: parent.width
            spacing: Theme.paddingLarge
            anchors.centerIn: parent

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
           /* Button {
                text: "Выйти в главное меню"
                color: "blue"
                highlightBackgroundColor: "blue"
                highlightColor: "black"
                opacity: 1
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("MenuPage.qml"))
                }
            }*/
        }
    }
}


