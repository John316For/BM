import QtQuick.Controls 1.5
import QtQml.Models 2.2
import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQml 2.2
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: pauseWindow
    width: parent.width// 735
    height: parent.height//500
    color: "#c7c5c5"
    opacity: 0.7
    anchors.fill: parent

    Column {
        id: column1
        x: 288
        y: 111
        width: 200
        height: 256
        spacing: 5
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            id: text1
            color: "#050303"
            text: qsTr("Пауза")
            opacity: 1
            font.pixelSize: 36
        }

        Button {
            id: returnGame
            text: qsTr("Вернуться в игру")
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 180
                    implicitHeight: 70
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
            onClicked: {
                // visible Field
                //main.setVisible(2)
                pauseWindow.visible = false
            }
        }

        Button {
            id: exitGameinMenu
            text: qsTr("Главное меню")
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 180
                    implicitHeight: 70
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
                main.setVisible(1)
                pauseWindow.visible = false
            }
        }
    }
}

