import QtQuick 2.0
import "Scene.js" as Scene

Item {
    id: a

    width: 50
    height: 50

    property int xVelocity: 0
    property int yVelocity: 0

    SpriteSequence {
        id: r
        width: 50
        height: 50
        interpolate: false
        Sprite {
            name: "rest"
            source: "image/mr.png"
        }

        Sprite {
            name: "left"
            source: "image/m2.png"
            frameCount: 5
            frameWidth: 90
            frameHeight: 170
            frameX: 0
            frameY: 0
            frameSync: true
        }

        Sprite {
            name: "right"
            source: "image/m1.png"
            frameCount: 5
            frameWidth: 90
            frameHeight: 170
            frameX: 0
            frameY: 0
            frameSync: true
        }
        Sprite {
            name: "up"
            source: "image/mr.png"
        }
        Sprite {
            name: "down"
            source: "image/mr.png"
        }
    }

    Keys.onPressed: {
//        if (event.isAutoRepeat) {
//            return
//        }

//        switch (event.key) {
//        case Qt.Key_Left:
//            xVelocity -= 5
//            break
//        case Qt.Key_Right:
//            xVelocity += 5
//            break
//        case Qt.Key_Down:
//            yVelocity += 5
//            break
//        case Qt.Key_Up:
//            yVelocity -= 5
//            break
//        }
        switch (event.key) {
               case Qt.Key_Left:
                   //console.log("Вариант куда я хочу двигаться"+Scene.getcageinfo(Scene.xposper-1,Scene.yposper));
                   console.log("Вариант обратный"+Scene.getcageinfo(Scene.yposper,Scene.xposper-1));
                   r.jumpTo("left")
                   switch (Scene.getcageinfo(Scene.yposper,Scene.xposper-1)){
                   case 2 :
                       console.log("Коробка");
                       return
                        break
                   case 3 :
                       console.log("Коробка и дверь");
                       return
                        break
                   case 4 :
                       console.log("Стена");
                       return
                        break
                   default:
                       console
                   }
                   Scene.xposper--;
                   break
               case Qt.Key_Right:
                   console.log(Scene.xposper+1,Scene.yposper);
                 // console.log("Вариант обратный"+Scene.getcageinfo(Scene.yposper,Scene.xposper-1));
                   r.jumpTo("right")
                   switch (Scene.getcageinfo(Scene.yposper,Scene.xposper+1)){
                   case 2 :
                       console.log("Коробка");
                       return
                        break
                   case 3 :
                       console.log("Коробка и дверь");
                       return
                        break
                   case 4 :
                       console.log("Стена");
                       return
                        break
                   }
                   Scene.xposper++;
                   break
               case Qt.Key_Down:
                    console.log(Scene.xposper,Scene.yposper+1);
                  //console.log("Вариант обратный"+Scene.getcageinfo(Scene.yposper,Scene.xposper-1));
                   r.jumpTo("down")
                   switch (Scene.getcageinfo(Scene.yposper+1,Scene.xposper)){
                   case 2 :
                       console.log("Коробка");
                       return
                        break
                   case 3 :
                       console.log("Коробка и дверь");
                       return
                        break
                   case 4 :
                       console.log("Стена");
                       return
                        break
                   }
                   Scene.yposper++;
                   break
               case Qt.Key_Up:
                    console.log(Scene.xposper,Scene.yposper-1);
                   r.jumpTo("up")
                   switch (Scene.getcageinfo(Scene.yposper-1,Scene.xposper)){
                   case 2 :
                       console.log("Коробка");
                       return
                        break
                   case 3 :
                       console.log("Коробка и дверь");
                       return
                        break
                   case 4 :
                       console.log("Стена");
                       return
                        break
                   }
                   Scene.yposper--;
                   break
               }
    }

    Keys.onReleased: {
        r.jumpTo("rest")
//        if (event.isAutoRepeat) {
//            return
//        }
//        r.jumpTo("rest")
//        switch (event.key) {
//        case Qt.Key_Left:
//            xVelocity += 5
//            break
//        case Qt.Key_Right:
//            xVelocity -= 5
//            break
//        case Qt.Key_Down:
//            yVelocity -= 5
//            break
//        case Qt.Key_Up:
//            yVelocity += 5
//            break
//        }
    }

    Timer {
        interval: 5
        triggeredOnStart: true
        running: true
        repeat: true
        onTriggered: {
//            a.x += xVelocity
//            a.y += yVelocity
            // if (xVelocity == 0 && yVelocity == 0) r.jumpTo("rest");
//            if (xVelocity < 0)
//                r.jumpTo("left")
//            else if (xVelocity > 0)
//                r.jumpTo("right")
//            if (yVelocity < 0)
//                r.jumpTo("down")
//            else if (yVelocity > 0)
//                r.jumpTo("up")
            a.x = Scene.xposper*50
            a.y = Scene.yposper*50
        }
    }
}
