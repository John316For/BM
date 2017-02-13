import QtQuick.Controls 1.5
import QtQml.Models 2.2
import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQml 2.2
import QtQuick.Controls.Styles 1.4

Rectangle{
    id: mainMenu
    height: 500
    width: 755
    anchors.fill: parent
    Image {
        id: backImage
        anchors.fill: parent
        fillMode: Image.Tile
        sourceSize.height: 500
        sourceSize.width: 755
        source: "im/MenuPict.png"
        Column {
            id: column1
            x: 288
            y: 111
            width: 200
            height: 256
            spacing: 5
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter

            Button {
                id: newGame
                text: qsTr("Новая игра")
                style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 180
                        implicitHeight: 70
                        border.color: "#9b0909"
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
                onClicked: {
                    mainMenu.visible = false
                    main.setVisible(2)
                }
            }

            Button {
                id: exit
                text: qsTr("Выход")
                style: ButtonStyle {
                    background: Rectangle {
                        implicitWidth: 180
                        implicitHeight: 70
                        radius: 15
                        border.color: "#9b0909"
                        border.width: 3
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
                    mainMenu.visible = false
                    // SureExit visible
                    main.setVisible(6)
                }
            }
        }
    }
}
