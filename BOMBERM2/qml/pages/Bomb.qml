import QtQuick 2.0
import "Scene.js" as Scene

Item {
    id: b
    width: Scene.cagesize
    height: Scene.cagesize
    visible: false
    x: Scene.xposper*Scene.cagesize
    y: Scene.yposper*Scene.cagesize
    SpriteSequence {
        id: bomb
        width: Scene.cagesize
        height: Scene.cagesize
        interpolate: false

        Sprite{
            name: "bomb"
            source: "image/bomb.png"
        }
    }
    //номер бомбы в массиве
    property int bombN: 6
    function setBomb(){
        // запись позициибомбы в массив

        //Scene.setcageinfo(Scene.getMarioxpos(),Scene.getMarioypos()+1,bombN)
        //Scene.setBombX(Scene.getMarioxpos())
       // Scene.setBombY(Scene.getMarioypos())
        Scene.setBombX(Scene.xposper)
        Scene.setBombY(Scene.yposper)
        Scene.setBombZ(2)
        // отображнеие бомбы на поле
        //b.x = Scene.getBombX() * Scene.cagesize
        //b.y = Scene.getBombY() * Scene.cagesize
        //b.z = Scene.getBombZ()
        b.x = Scene.xposper*Scene.cagesize
        b.y = Scene.yposper*Scene.cagesize
        b.z = 2
        b.visible = "true";
        // взрыв бомбы после таймера
        detonateTimer.start()

    }
    property int amountCrashedBoxes: 0
    property int freeCage: 9

    Timer {
        id: boomTimer
        interval:500
        running:false
        triggeredOnStart: false
        repeat: false
        onTriggered: {
            console.log("BUUUM CLOSE");
            boom1.visible = false
            boom2.visible = false
            boom3.visible = false
            boom4.visible = false
            console.log("BUUUM CLOSE_END");
        }
    }

    Timer {
        id: detonateTimer
        // через 3 секунды
        interval: 3000
        triggeredOnStart: false
        running: false
        repeat: false
        onTriggered: {

            console.log("BUUM bomb");
            boom1.visible = "true";
            boom2.visible = "true";
            boom3.visible = "true";
            boom4.visible = "true";


            //проверка, задело ли марио
            if(Scene.killMario()) {
                mario.lesslife();
            }
            //проверка, задело ли коробки и еще что
            amountCrashedBoxes =Scene.detonate()
            if (amountCrashedBoxes > 0) {
                console.log("AmountCrushedBoxes:",amountCrashedBoxes);
                // обновлние поля вокруг бомбы
                fieldMeneger.refreshField(Scene.getBombX(),Scene.getBombY())
            }
            boomTimer.start();
            b.visible = false
            Scene.setcageinfo(Scene.setBombX(),Scene.getBombY(),freeCage)

        }

    }
}
