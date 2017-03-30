import QtQuick 2.0

Item {
    property var bombX
     property var bombY
    id: board

    width: 800
    height: 480




    Image {

        width: 700
        height: 480

        x:100
        source: "back1.jpg"




    }


    //////////////////JOYSTICK//////////////////////////////


    Rectangle {
        id: root
        width: joystick.width
        height: joystick.height
        color: "transparent"
         y:350
         x:10



        Image {
            id: joystick

            property real angle : 0
            property real distance : 0

            source: "background1.jpg"
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
                    actorMario.x=actorMario.x+50
                    returnAnimation.stop();
                }

                onReleased: {
                    returnAnimation.restart()

                }

                onPositionChanged: {
                    if (fingerInBounds) {
                        thumb.anchors.horizontalCenterOffset = mcx
                        thumb.anchors.verticalCenterOffset = mcy
                    } else {
                        var angle = Math.atan2(mcy, mcx)
                        thumb.anchors.horizontalCenterOffset = Math.cos(angle) * distanceBound
                        thumb.anchors.verticalCenterOffset = Math.sin(angle) * distanceBound
                    }



                    if(angle*180/Math.PI > -45 && angle*180/Math.PI <45) actorMario.x= actorMario.x+1
                    if(angle*180/Math.PI >-180 && angle*180/Math.PI < -90) actorMario.y = actorMario.y-1
                      if(angle*180/Math.PI >=45 && angle*180/Math.PI <=135) actorMario.y= actorMario.y+1
                       if(angle*180/Math.PI <= -135 || angle*180/Math.PI > 135) actorMario.x= actorMario.x-1

                    console.log(angle*180/Math.PI)



                    //if(angle >90) actorMario.y= actorMarioy-1
                    //if(angle == 0) actorMario.x= actorMariox+1
                    //actorMario.x = actorMario.x + thumb.anchors.horizontalCenterOffset
                    //actorMario.y=  actorMario.y + thumb.anchors.verticalCenterOffset

                    // Fire the signal to indicate the joystick has moved
                    angle = Math.atan2(signal_y, signal_x)

                }



            Image {
                id: thumb
                source: "finger1.jpg"
                anchors.centerIn: parent
            }

            Image {
                id: actorMario
                source: "mario.png"
                x:200
                y:0

            }
        }


}
    }


    //////////////////JOYSTICK/////////////////////////////




    Rectangle {
     id: ghost1
     width: 40
     height: 50
     x: 100
     y: 100

     Image {

         width: 40
         height: 50

         source: "en4.jpg"
     }

    }





      Actor {
          id: actor

         x: parent.width / 2 - width / 2
         y: parent.height / 2 - height / 2
          z: 1

          focus: true




      }

      EnemyManager {
            id: enemyManager

            gameBoard: board

            actorWidth: 118
            actorHeight: 118

            enemyWidth: 118
            enemyHeight: 118

            enemyNumber: 10

            Component.onCompleted: generateEnemies()
        }


}
