import QtQuick 2.0
import Sailfish.Silica 1.0





Item {
    width: 118
    height: 118
    property int xVelocity: 0
    property int yVelocity: 0
    property var enemyX: 0
    property var enemyY: 0
    property var bombX: 0
    property var bombY: 0
     property var flag: false

    Rectangle {
     id: bomb
     width: 30
     height: 30
     x: bombX
     y: bombY
     visible: false

     Image {

         width: 30
         height: 30

         source: "image/bomb.jpg"
     }

    }



    SpriteSequence {
        id: r
        x: 0
        y: 0
        width: 50
        height: 50
        interpolate: false

        Sprite {
            name: "left"
            source: "image/mmario.jpg"
            frameCount: 1
            frameWidth: 40
            frameHeight: 50
            frameX: 0
            frameY: 0
        }

        Sprite {
            name: "right"
            source: "image/mmario.jpg"
            frameCount: 1
            frameWidth: 40
            frameHeight: 50
            frameX: 40
            frameY: 0
        }

        Sprite {
            name: "top"
            source: "image/mmario.jpg"
            frameCount: 1
            frameWidth: 40
            frameHeight: 50
            frameX: 120
            frameY: 0
        }

        Sprite {
            name: "bottom"
            source: "image/mmario.jpg"
            frameCount: 1
            frameWidth: 40
            frameHeight: 50
            frameX: 80
            frameY: 0
        }



    }

    Keys.onPressed: {
        if (event.isAutoRepeat) {
            return;
        }
      console.log("the key was pressed!!!")

        switch (event.key) {
            case Qt.Key_A:
                xVelocity -= 1
                console.log(" x is "+xVelocity)
                 console.log(" y is "+yVelocity)
                break;
            case Qt.Key_D:
                xVelocity += 1
                console.log(" x is "+xVelocity)
                 console.log(" y is "+yVelocity)
                break;
            case Qt.Key_W:
                yVelocity -= 1
                break;
            case Qt.Key_S:
                yVelocity += 1
                break;
            case Qt.Key_Space:
                 console.log("the SPACE key was pressed!!!")
            flag = true


                break;

        }
    }

    Keys.onReleased: {
        if (event.isAutoRepeat) {
            return;
        }

        switch (event.key) {
        case Qt.Key_A:
            xVelocity += 1
            break;
        case Qt.Key_D:
            xVelocity -= 1
            break;
        case Qt.Key_W:
            yVelocity += 1
            break;
        case Qt.Key_S:
            yVelocity -= 1
            break;
        }
    }

    Timer {
        interval: 5
        triggeredOnStart: true
        running: true
        repeat: true
        onTriggered: {
            x += xVelocity
            y += yVelocity
            if(flag) {
                bombX = x-250
                bombY = y-200
               bomb.visible = true
                console.log(" x is "+x)
                 console.log(" y is "+y)

            }

            if (xVelocity < 0) r.jumpTo("left")
            else if (xVelocity > 0) r.jumpTo("right")
            if (yVelocity < 0) r.jumpTo("top")
            else if (yVelocity > 0) r.jumpTo("bottom")


        }
    }

}
