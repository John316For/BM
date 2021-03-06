import QtQuick 2.0
import "Scene.js" as Scene

Item {
    id: a

    width: Scene.cagesize
    height: Scene.cagesize

    property int xVelocity: 0
    property int yVelocity: 0
    property int lifecount: 3
    SpriteSequence {
        id: r
        width: Scene.cagesize
        height: Scene.cagesize
        interpolate: false
        Sprite {
            name: "rest"
            source: "image/mpered.png"
        }

        Sprite {
            name: "left"
            // source: "image/m2.png"
            source: "image/mario1.png"
            frameCount: 5
            frameWidth: 19
            //frameHeight: 170
            frameRate: 50
            frameX: 0
            frameY: 0
            frameSync: true
        }

        Sprite {
            name: "right"
            source: "image/mario3.png"
            frameCount: 5
            frameWidth: 19
            //frameHeight: 170
            frameX: 0
            frameY: 0
            frameSync: true
        }
        Sprite {
            name: "up"
            source: "image/mario4.png"
            frameCount: 3
            frameWidth: 21
            frameX: 0
            frameY: 0
            //frameRate: 10
            frameSync: true
        }
        Sprite {
            name: "down"
            source: "image/mpered.png"
        }
    }
    // nat
    property int freeCage: 9
    function dead() {
        a.visible = false
        // устанавливаем в массиве на месте марио пустую ячейку
        Scene.setcageinfo(Scene.getMarioxpos(), Scene.getMarioypos(), freeCage)
        console.log("kill")
        enemyTimer.stop()
    }

    //Функция уменьшения жизни
    function lesslife() {
        if (lifecount > 1) {
            lifecount--
            console.log("lifepoints: " + lifecount)
            lifepoint.width = Scene.cagesize * lifecount
            lifepoint.changesost(lifecount)
        } else {
            dead()
            pageStack.push(Qt.resolvedUrl("GameOver.qml"))
        }
    }
    //Функции хода персонажа
    function gotoLeft() {

        //console.log("Вариант куда я хочу двигаться"+Scene.getcageinfo(Scene.xposper-1,Scene.yposper));
        console.log("Вариант обратный" + Scene.getcageinfo(Scene.yposper,
                                                           Scene.xposper - 1))
        r.jumpTo("left")
        switch (Scene.getcageinfo(Scene.yposper, Scene.xposper - 1)) {
        case 2:
            //console.log("Коробка")
            return
            break
        case 3:
            //console.log("Коробка и дверь")
            return
            break
        case 4:
            //console.log("Стена")
            return
            break
        default:
            //console.log("Что-то")
        }
        //Устанавливаю значение пустой клетки в той что был персонаж и новое значение
        Scene.setcageinfo(Scene.yposper, Scene.xposper - 1, 1)
        //console.log("Новая клетка:" + Scene.getcageinfo(Scene.yposper,
         //                                               Scene.xposper - 1))
        Scene.setcageinfo(Scene.yposper, Scene.xposper, 9)
        //console.log("Старая клетка:" + Scene.getcageinfo(Scene.yposper,
        //                                                 Scene.xposper))

        xVelocity--;
        Scene.xposper--;
        //air
        bomb.x1 = Scene.xposper
        bomb.y1 = Scene.yposper
    }

    function gotoRight() {
        //console.log(Scene.xposper+1,Scene.yposper);
        r.jumpTo("right")
        switch (Scene.getcageinfo(Scene.yposper, Scene.xposper + 1)) {
        case 2:
           // console.log("Коробка")
            return
            break
        case 3:
           // console.log("Коробка и дверь")
            return
            break
        case 4:
           // console.log("Стена")
            return
            break
        }
        //Устанавливаю значение пустой клетки в той что был персонаж и новое значение
        Scene.setcageinfo(Scene.yposper, Scene.xposper + 1, 1)
        //console.log("Новая клетка:"+Scene.getcageinfo(Scene.yposper,Scene.xposper+1));
        Scene.setcageinfo(Scene.yposper, Scene.xposper, 9)
        //console.log("Старая клетка:"+Scene.getcageinfo(Scene.yposper,Scene.xposper));
        xVelocity++;
        Scene.xposper++;
        //air
        bomb.x1 = Scene.xposper
        bomb.y1 = Scene.yposper
    }

    function gotoUp() {
        console.log(Scene.xposper, Scene.yposper - 1)
        r.jumpTo("up")
        switch (Scene.getcageinfo(Scene.yposper - 1, Scene.xposper)) {
        case 2:
            console.log("Коробка")
            return
            break
        case 3:
            console.log("Коробка и дверь")
            return
            break
        case 4:
            console.log("Стена")
            return
            break
        }
        Scene.setcageinfo(Scene.yposper - 1, Scene.xposper, 1)
        //console.log("Новая клетка:"+Scene.getcageinfo(Scene.yposper-1,Scene.xposper));
        Scene.setcageinfo(Scene.yposper, Scene.xposper, 9)
        //console.log("Старая клетка:"+Scene.getcageinfo(Scene.yposper,Scene.xposper));
        yVelocity--
        Scene.yposper--
        //air
        bomb.x1 = Scene.xposper
        bomb.y1 = Scene.yposper
    }

    function gotoDown() {
        console.log(Scene.xposper, Scene.yposper + 1)
        r.jumpTo("down")
        switch (Scene.getcageinfo(Scene.yposper + 1, Scene.xposper)) {
        case 2:
           // console.log("Коробка")
            return
            break
        case 3:
           // console.log("Коробка и дверь")
            return
            break
        case 4:
           // console.log("Стена")
            return
            break
        }
        //Устанавливаю значение пустой клетки в той что был персонаж и новое значение
        Scene.setcageinfo(Scene.yposper + 1, Scene.xposper, 1)
        //console.log("Новая клетка:"+Scene.getcageinfo(Scene.yposper+1,Scene.xposper));
        Scene.setcageinfo(Scene.yposper, Scene.xposper, 9)
        //console.log("Старая клетка:"+Scene.getcageinfo(Scene.yposper,Scene.xposper));
        yVelocity++;
        Scene.yposper++;
        //air
        bomb.x1 = Scene.xposper
        bomb.y1 = Scene.yposper
    }
    function rest() {
        xVelocity = 0;
        yVelocity = 0;
        r.jumpTo("rest");
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
            gotoLeft()
            break
        case Qt.Key_Right:
            gotoRight()
            break
        case Qt.Key_Down:
            gotoDown()
            break
        case Qt.Key_Up:
            gotoUp()
            break
        }
    }

    Keys.onReleased: {
        rest()
        //        xVelocity = 0;
        //        yVelocity = 0;
        //        r.jumpTo("rest")

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
        id: enemyTimer
        interval: 500 //was 1
        triggeredOnStart: true
        running: true
        repeat: true
        onTriggered: {
            fieldMeneger.enemyMove(0)
            fieldMeneger.enemyMove(1)
            fieldMeneger.enemyMove(2)
            fieldMeneger.enemyMove(3)
        }
    }

    Timer {
        id: marioTimer
        interval: 1 //was 1
        triggeredOnStart: true
        running: true
        repeat: true
        onTriggered: {
            switch (xVelocity) {
            case 1:
                a.x = Scene.xposper * Scene.cagesize - Scene.cagesize / 2
                xVelocity++
                break
            case 2:
                a.x = Scene.xposper * Scene.cagesize
                xVelocity++
                break
            case -1:
                a.x = Scene.xposper * Scene.cagesize + Scene.cagesize / 2
                xVelocity++
                break
            default:
                a.x = Scene.xposper * Scene.cagesize
                //xVelocity = 1;
            }
            switch (yVelocity) {
            case 1:
                a.y = Scene.yposper * Scene.cagesize - Scene.cagesize / 2
                yVelocity++
                break
            case 2:
                a.y = Scene.yposper * Scene.cagesize
                yVelocity++
                break
            case -1:
                a.y = Scene.yposper * Scene.cagesize + Scene.cagesize / 2
                yVelocity++
                break
            default:
                a.y = Scene.yposper * Scene.cagesize
                //yVelocity = 1;
            }
            //a.x = Scene.xposper*Scene.cagesize;
            //a.y = Scene.yposper*Scene.cagesize;
        }
    }
}
