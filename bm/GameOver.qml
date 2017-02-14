import QtQuick.Controls 1.5
import QtQml.Models 2.2
import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQml 2.2
import QtQuick.Controls.Styles 1.4
import "./"

Rectangle {
    id: gameOverWindow
    color: "#ffffff"
    anchors.fill: parent
    width: 755
    height: 500

    ColumnLayout {
        id: columnLayout1
        x: 230
        y: 100
        width: 190
        height: 322
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: text1
            text: qsTr("Game Over")
            textFormat: Text.AutoText
            verticalAlignment: Text.AlignTop
            wrapMode: Text.NoWrap
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
        }
        Button {
            id: mainMenuButton
            text: qsTr("Главное меню")

            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 180
                    implicitHeight: 70
                    border.color: "black"
                    border.width: 3
                    radius: 15
                }
                label: Text {
                    renderType: Text.NativeRendering
                    verticalAlignment: Text.AlignVCenter
                    horizontalAlignment: Text.AlignHCenter
                    font.family: "Helvetica"
                    font.pointSize: 15
                    color: "black"
                    text: control.text
                }
            }
            //visible MainMenu
            onClicked: {
                gameOverWindow.visible = false
                main.setVisible(1)
            }
        }
        Image {
            id: gameOverMario
            height: 190
            width: 189
            sourceSize.height: 190
            sourceSize.width: 189
            source: "im/exitMario.png"
        }
    }
}
