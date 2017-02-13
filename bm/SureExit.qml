import QtQuick.Controls 1.5
import QtQml.Models 2.2
import QtQuick 2.7
import QtQuick.Layouts 1.2
import QtQml 2.2
import QtQuick.Controls.Styles 1.4
import "./"

Rectangle {
    id: exitWindow
    width: parent.width // 735
    height: parent.height //500
    color: "#c7c5c5"
    anchors.fill: parent

    Text {
        id: text1
        x: 209
        y: 73
        width: 318
        height: 56
        color: "#9b0909"
        text: qsTr("Вы уверены, что хотите выйти из игры?")
        anchors.verticalCenterOffset: -112
        anchors.horizontalCenterOffset: 0
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        horizontalAlignment: Text.AlignLeft
        //styleColor: "#9b0909"
        textFormat: Text.PlainText
        visible: true
        wrapMode: Text.WrapAtWordBoundaryOrAnywhere
        font.pixelSize: 25
    }

    RowLayout {
        id: rowLayout1
        x: 190
        y: 199
        width: 253
        height: 129
        spacing: 50
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        Button {
            id: yew
            width: 100
            height: 50
            text: qsTr("Да")
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 50
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
            onClicked: Qt.quit()
        }

        Button {
            id: no
            text: qsTr("Нет")
            style: ButtonStyle {
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 50
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
                // visible MainMenu
                main.setVisible(1)
                exitWindow.visible = false
            }
        }
    }
}
