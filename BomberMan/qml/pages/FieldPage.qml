import QtQuick 2.0
import Sailfish.Silica 1.0
import "Scene.js" as Scene


Page {
    id: page
    allowedOrientations: Orientation.Landscape

    Item{
        id: board
        anchors.fill: parent

        Image {
            source: "image/back.jpg"
            fillMode: Image.Tile

            anchors.fill: parent
            z: -1
        }

        Mario {
            id: mario
            x: Scene.getMarioxpos()*50
            y: Scene.getMarioypos()*50
            z:1
            focus: true
            //onXChanged: if(Field.processCollisions(x, y))
        }

        Field {
            id: fieldMeneger
            gameBoard: board
            stoneWidth: 50
            stoneHeight: 50
            boxWidth: 50
            boxHeight: 50
            // Количество генерируемых неигровых объектов
            Component.onCompleted: generatefield()

        }
        ////////TAYA
        //////////////////JOYSTICK//////////////////////////////


        Rectangle {
            id: root
            width: joystick.width
            height: joystick.height
            color: "transparent"
             y:400
             x:50
             z:1



            Image {
                id: joystick

                property real angle : 0
                property real distance : 0

                source: "image/background1.jpg"
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

                    /*onPressed: {
                        actorMario.x=actorMario.x+100
                        returnAnimation.stop();
                    }
                    */
                    onPressAndHold: {
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



                        if(angle*180/Math.PI > -45 && angle*180/Math.PI <45) actorMario.x= actorMario.x+10
                        if(angle*180/Math.PI >-180 && angle*180/Math.PI < -90) actorMario.y = actorMario.y-10
                          if(angle*180/Math.PI >=45 && angle*180/Math.PI <=135) actorMario.y= actorMario.y+10
                           if(angle*180/Math.PI <= -135 || angle*180/Math.PI > 135) actorMario.x= actorMario.x-10

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
                    source: "image/finger1.jpg"
                    anchors.centerIn: parent
                }

                Image {
                    id: actorMario
                    source: "image/mario.png"
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

             source: "image/en4.jpg"
         }

        }





//          Actor {
//              id: actor

//             x: parent.width / 2 - width / 2
//             y: parent.height / 2 - height / 2
//              z: 1

//              focus: true


//        ///////TAYA

//    }
}
}
