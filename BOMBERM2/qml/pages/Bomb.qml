import QtQuick 2.0
import "Scene.js" as Scene

Item {
    id: b
    width: Scene.cagesize
    height: Scene.cagesize
    visible: false
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
    property int x1: 0
    property int y1: 0
    function setBomb(){
        // запись позициибомбы в массив
        //Scene.setcageinfo(Scene.getMarioxpos(),Scene.getMarioypos(),bombN)
        console.log("BOMBPOS", x1, " ", y1)
        Scene.setBombX(x1)
        Scene.setBombY(y1)
        Scene.setBombZ(2)
        // отображнеие бомбы на поле
        b.x = Scene.getBombX() * Scene.cagesize
        b.y = Scene.getBombY() * Scene.cagesize
        b.z = Scene.getBombZ()
        // взрыв бомбы после таймера
        b.visible = true
        detonateTimer.start()

    }

    //property int amountCrashedBoxes: 0
    property int freeCage: 9



    /*Timer {
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

    }*/

    // таймер взрыва бомбы
    property int amountCrashedBoxesAndEnemies: 0
    //property int freeCage: 9
    Timer {
        id: detonateTimer
        // через 3 секунды
        interval: 3000
        triggeredOnStart: false
        running: false
        repeat: false
        onTriggered: {
            //bomb.visible = false
            console.log("BUUM bomb")
            boom1.visible = true;
            boom2.visible = true;
            boom3.visible = true;
            boom4.visible = true;
            boomTimer.start();
            b.visible = false
            //проверка, задело ли марио
            if(killMario()){
                mario.lesslife();
                console.log("KILLMARIONOW");
            }
            //проверка, задело ли коробки и еще что
            amountCrashedBoxesAndEnemies = detonate()
            if (amountCrashedBoxesAndEnemies > 0) {
                console.log("AmountCrushedBoxesAndEnemies:",amountCrashedBoxesAndEnemies);
                // обновлние поля вокруг бомбы
                fieldMeneger.refreshField(Scene.getBombX(),Scene.getBombY())
                console.log("REFRESH ", Scene.getBombX(), " ", Scene.getBombY());
            }

            Scene.setcageinfo(Scene.setBombX(),Scene.getBombY(),freeCage)
        }
    }

    Timer {
        id: boomTimer
        interval:500
        running:false
        triggeredOnStart: false
        repeat: false
        onTriggered: {
            console.log("BUUUM CLOSE");
            boom1.visible = false;
            boom2.visible = false;
            boom3.visible = false;
            boom4.visible = false;
            console.log("BUUUM CLOSE_END");
        }
    }


    // взаимодействие с бомбой

    //Обработка взвыва бомбы
    //property int freeCage : 9
    function killMario() {
        // задевает ли она марио
        if (Scene.getBombX() === x1 || Scene.getBombX() === x1 - 1
                || Scene.getBombX() === x1 + 1) {
            if (Scene.getBombY() === y1 || Scene.getBombY() === y1 - 1
                    || Scene.getBombY() === y1 + 1) {
                return true
            }
        }
        return false
    }
    /////
    // пока только коробки
    //property int amountCrashedBoxes: 0

    //  FIX IT HERE
    property int xD: 0
    property int yD: 0
    property int amount: 0
    function detonate() {
        //коробка сверху
        xD = Scene.getBombX()
        yD = Scene.getBombY()
        console.log(Scene.getcageinfo(xD,yD-1))
        if (Scene.getcageinfo(xD,yD-1) === 2 || Scene.getcageinfo(xD,yD-1) === 10) {
            Scene.setcageinfo(xD,yD-1,9)
            amount++
            console.log("crush ",xD,yD - 1 )
        }
        //справа
        console.log(Scene.getcageinfo(xD+1,yD))
        if (Scene.getcageinfo(xD+1,yD) === 2|| Scene.getcageinfo(xD+1,yD) === 10) {
            Scene.setcageinfo(xD+1,yD,9)
            amount++
            console.log("crush ",xD+1,yD)
        }
        //снизу
        console.log(Scene.getcageinfo(xD,yD+1))
        if (Scene.getcageinfo(xD,yD+1) === 2 || Scene.getcageinfo(xD,yD+1) === 10) {
            Scene.setcageinfo(xD,yD+1,9)
            amount++
            console.log("crush ",bombX,bombY + 1)
        }
        //слева
        console.log(Scene.getcageinfo(xD-1,yD))
        if (Scene.getcageinfo(xD-1,yD) === 2 || Scene.getcageinfo(xD-1,yD) === 10) {
            Scene.setcageinfo(xD-1,yD,9)
            amount++//return true
            console.log("crush ",xD - 1,yD)
        }
        return amount
    }

}

