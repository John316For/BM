import QtQuick 2.0
import Sailfish.Silica 1.0
import "Scene.js" as Scene

Page {
    id: page
    allowedOrientations: Orientation.Landscape

    Item {
        id: board
        anchors.fill: parent
        width: page.width
        height: page.height
        Image {
            width: parent.width
            height: parent.height
            source: "image/back.jpg"
            fillMode: Image.Tile
            anchors.fill: parent
            z: -1
        }

        //natalia
        // кнопка устновки бомбы
        Rectangle {
            id: bombRect
            width: page.width / 12
            height: page.width / 12
            x: page.width - bombRect.width * 2
            y: page.height - bombRect.width * 2
            z: 1
            MouseArea {
                id: bombMouseArea
                anchors.fill: parent
                onClicked: {
                    console.log("set bomb")
                    bomb.setBomb()
                    console.log("set bomb call")
                }
            }
            Image {
                id: setBombPict
                source: "image/bomb.png"
                width: parent.width
                height: parent.width
            }
        }
        Bomb {
            id: bomb
            x: Scene.getBombX() * Scene.cagesize
            y: Scene.getBombY() * Scene.cagesize
            z: 1 //Scene.getBombZ()
            focus: false
        }
        //natalias

        //+++++++++++++++++++++++++++++++++++++++++++++++++++
        //+++++++++++++++++++++Марио и счетчик
        Mario {
            id: mario
            x: Scene.getMarioxpos() * Scene.cagesize
            y: Scene.getMarioypos() * Scene.cagesize
            z: 1
            focus: true
            onXChanged: console.log("mario x", x)
            //onXChanged: if(Field.processCollisions(x, y))
        }
        Lfpoint {
            id: lifepoint
            x: 10 * Scene.cagesize
            y: 1 / 3 * Scene.cagesize
            z: 3
        }

        //++++++++++++++++++++++++++++++++++++++++++++++++++++
        Field {
            id: fieldMeneger
            gameBoard: board
            stoneWidth: Scene.cagesize
            stoneHeight: Scene.cagesize
            boxWidth: Scene.cagesize
            boxHeight: Scene.cagesize
            // Количество генерируемых неигровых объектов
            Component.onCompleted: generatefield()
        }
        /////////////SIMPLE JOYSTICK||||||||||||||||||||||||||||||||||||||||
        // Rectangle {
        // Item{
        //        id: root
        //            width: page.width / 6 //joystick.width
        //            height: page.width / 6 //joystick.height
        //            //color: "transparent"
        //            //color:"red"
        //            y: parent.height - parent.height / 3 //400
        //            x: 20
        //            z: 1
        Rectangle {
            id: rectLeft
            //anchors.left: parent.left
            color: "grey"
            width: page.width / 13
            height: page.height / 9
            x: 10
            y: parent.height - parent.height / 6
            z: 1
            MouseArea {
                id: mouseLeft
                anchors.fill: parent
                onPressed: {
                    mario.gotoLeft();
                }
                onReleased: {
                    mario.rest();
                }
            }
        }
                    Rectangle {
                        id: rectRight
                        color: "grey"
                        width: page.width / 13
                        height: page.height / 9
                        x: 10+rectLeft.width+rectLeft.height
                        y: parent.height - parent.height / 6
                        z: 1
                        MouseArea {
                            id: mouseRight
                            anchors.fill: parent
                            onPressed: {
                                mario.gotoRight();
                            }
                            onReleased: {
                                mario.rest();
                            }
                        }
                    }
                    Rectangle {
                        id: rectUp
                        color: "grey"
                        width: page.height / 9
                        height:  page.width / 13
                        x: 10+rectLeft.width
                        y: rectLeft.y - rectUp.height
                        z: 1
                        MouseArea {
                            id: mouseUp
                            anchors.fill: parent
                            onPressed: {
                                mario.gotoUp();
                            }
                            onReleased: {
                                mario.rest();
                            }
                        }
                    }
                    Rectangle {
                        id: rectDown
                        color: "grey"
                        width:  page.height / 9
                        height: page.width / 13
                        x: 10+rectLeft.width
                        y: rectLeft.y+rectLeft.height
                        z: 1
                        MouseArea {
                            id: mouseDown
                            anchors.fill: parent
                            onPressed: {
                                mario.gotoDown();
                            }
                            onReleased: {
                                mario.rest();
                            }
                        }
                    }
        // }

        ////////TAYA
        //////////////////JOYSTICK//////////////////////////////
        //        Rectangle {
        //            id: root
        //            width: page.width / 6 //joystick.width
        //            height: page.width / 6 //joystick.height
        //            color: "transparent"
        //            y: parent.height - parent.height / 3 //400
        //            x: 20
        //            z: 1

        //            Image {
        //                id: joystick

        //                width: parent.width
        //                height: parent.width
        //                source: "image/background1.png"
        //                anchors.centerIn: parent

        //                property real angle: 0
        //                property real distance: 0
        //                ParallelAnimation {
        //                    id: returnAnimation
        //                    NumberAnimation {
        //                        target: thumb.anchors
        //                        property: "horizontalCenterOffset"
        //                        to: 0
        //                        duration: 200
        //                        easing.type: Easing.OutSine
        //                    }
        //                    NumberAnimation {
        //                        target: thumb.anchors
        //                        property: "verticalCenterOffset"
        //                        to: 0
        //                        duration: 200
        //                        easing.type: Easing.OutSine
        //                    }
        //                }

        //                MouseArea {
        //                    id: mouse
        //                    property real fingerAngle: Math.atan2(mouseX, mouseY)
        //                    property int mcx: mouseX - width * 0.5
        //                    property int mcy: mouseY - height * 0.5
        //                    property bool fingerInBounds: fingerDistance2 < distanceBound2
        //                    property real fingerDistance2: mcx * mcx + mcy * mcy
        //                    property real distanceBound: width * 0.5 - thumb.width * 0.5
        //                    property real distanceBound2: distanceBound * distanceBound

        //                    property double signal_x: (mouseX - joystick.width / 2) / distanceBound
        //                    property double signal_y: -(mouseY - joystick.height / 2) / distanceBound

        //                    anchors.fill: parent

        //                    onPressed: {
        //                        actorMario.x = actorMario.x // + 50
        //                        returnAnimation.stop()
        //                        console.log("mcx: " + mcx + " mcy: " + mcy)
        //                    }

        //                    onPressAndHold: {
        //                        if (fingerInBounds) {
        //                            thumb.anchors.horizontalCenterOffset = mcx
        //                            thumb.anchors.verticalCenterOffset = mcy
        //                        } else {
        //                            var angle = Math.atan2(mcy, mcx)
        //                            thumb.anchors.horizontalCenterOffset = Math.cos(
        //                                        angle) * distanceBound
        //                            thumb.anchors.verticalCenterOffset = Math.sin(
        //                                        angle) * distanceBound
        //                        }
        //                        if (angle * 180 / Math.PI > -45
        //                                && angle * 180 / Math.PI < 45)
        //                            actorMario.x = actorMario.x + 10
        //                        if (angle * 180 / Math.PI > -180
        //                                && angle * 180 / Math.PI < -90)
        //                            actorMario.y = actorMario.y - 10
        //                        if (angle * 180 / Math.PI >= 45
        //                                && angle * 180 / Math.PI <= 135)
        //                            actorMario.y = actorMario.y + 10
        //                        if (angle * 180 / Math.PI <= -135
        //                                || angle * 180 / Math.PI > 135)
        //                            actorMario.x = actorMario.x - 10

        //                        actorMario.x = actorMario.x + 50
        //                        console.log("mcx: " + mcx + " mcy: " + mcy)
        //                        returnAnimation.stop()
        //                    }
        //                    onReleased: {
        //                        console.log("RELEAS")
        //                        mcx = 0
        //                        mcy = 0
        //                        returnAnimation.restart()
        //                    }

        //                    onPositionChanged: {
        //                        if (fingerInBounds) {
        //                            thumb.anchors.horizontalCenterOffset = mcx
        //                            thumb.anchors.verticalCenterOffset = mcy
        //                        } else {
        //                            var angle = Math.atan2(mcy, mcx)
        //                            thumb.anchors.horizontalCenterOffset = Math.cos(
        //                                        angle) * distanceBound
        //                            thumb.anchors.verticalCenterOffset = Math.sin(
        //                                        angle) * distanceBound
        //                        }

        //                        if (angle * 180 / Math.PI > -45
        //                                && angle * 180 / Math.PI < 45)
        //                            actorMario.x = actorMario.x + 10
        //                        if (angle * 180 / Math.PI > -180
        //                                && angle * 180 / Math.PI < -90)
        //                            actorMario.y = actorMario.y - 10
        //                        if (angle * 180 / Math.PI >= 45
        //                                && angle * 180 / Math.PI <= 135)
        //                            actorMario.y = actorMario.y + 10
        //                        if (angle * 180 / Math.PI <= -135
        //                                || angle * 180 / Math.PI > 135)
        //                            actorMario.x = actorMario.x - 10

        //                        //console.log(angle*180/Math.PI)

        //                        //if(angle >90) actorMario.y= actorMarioy-1
        //                        //if(angle == 0) actorMario.x= actorMariox+1
        //                        //actorMario.x = actorMario.x + thumb.anchors.horizontalCenterOffset
        //                        //actorMario.y=  actorMario.y + thumb.anchors.verticalCenterOffset

        //                        // Fire the signal to indicate the joystick has moved
        //                        angle = Math.atan2(signal_y, signal_x)
        //                    }

        //                    Image {
        //                        id: thumb
        //                        width: joystick.width / 2
        //                        height: joystick.height / 2
        //                        source: "image/finger1.png"
        //                        anchors.centerIn: parent
        //                    }

        //                    Image {
        //                        id: actorMario
        //                        source: "image/mario.png"
        //                        x: 200
        //                        y: 0
        //                    }
        //                }
        //            }
        //        }

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

            //}
            //Katya
            Button {
                text: "Пауза"
                color: "white"
                highlightBackgroundColor: "black"
                highlightColor: "black"
                opacity: 1.0
                // capacity: 1
                //anchors.
                // anchors.left: parent.left
                //anchors.fill: update
                x: -30
                y: -70
                // anchors {
                //   left: parent.left
                // leftMargin: Theme.horizontalPageMargin
                //right: parent.right
                // rightMargin: Theme.horizontalPageMargin
                //verticalCenter: parent.verticalCenter
                //}
                onClicked: {
                    pageStack.push(Qt.resolvedUrl("PauseMenu.qml"))
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
}
