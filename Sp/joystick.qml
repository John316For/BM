import QtQuick 2.5
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")




    Rectangle {
        id: root
        width: joystick.width
        height: joystick.height
        color: "transparent"




        Image {
            id: joystick

            property real angle : 0
            property real distance : 0

            source: "background.png"
            anchors.centerIn: parent

            ParallelAnimation {
                id: returnAnimation
                NumberAnimation { target: thumb.anchors; property: "horizontalCenterOffset";
                    to: 0; duration: 200; easing.type: Easing.OutSine }
                NumberAnimation { target: thumb.anchors; property: "verticalCenterOffset";
                    to: 0; duration: 200; easing.type: Easing.OutSine }
            }

            MouseArea {
                id: mouse
                property real fingerAngle : Math.atan2(mouseX, mouseY)
                property int mcx : mouseX - width * 0.5
                property int mcy : mouseY - height * 0.5
                property bool fingerInBounds : fingerDistance2 < distanceBound2
                property real fingerDistance2 : mcx * mcx + mcy * mcy
                property real distanceBound : width * 0.5 - thumb.width * 0.5
                property real distanceBound2 : distanceBound * distanceBound

                property double signal_x : (mouseX - joystick.width/2) / distanceBound
                property double signal_y : -(mouseY - joystick.height/2) / distanceBound

                anchors.fill: parent

                onPressed: {
                  // Actor.xVelocity = 0;
                     console.log("joystick is moving!!!")
                    returnAnimation.stop();
                }

                onReleased: {
                     console.log("release joystick!!!")
                    returnAnimation.restart()


                }

                onPositionChanged: {
                     console.log("release joystick!!!");
                    if (fingerInBounds) {
                        thumb.anchors.horizontalCenterOffset = mcx
                        thumb.anchors.verticalCenterOffset = mcy
                    } else {
                        var angle = Math.atan2(mcy, mcx)
                        thumb.anchors.horizontalCenterOffset = Math.cos(angle) * distanceBound
                        thumb.anchors.verticalCenterOffset = Math.sin(angle) * distanceBound
                    }

                    // Fire the signal to indicate the joystick has moved
                    angle = Math.atan2(signal_y, signal_x)

                }
            }

            Image {
                id: thumb
                source: "finger.png"
                anchors.centerIn: parent
            }


        }
    }



}
