import QtQuick 2.0
import "Scene.js" as Scene



Item {

    property int j: 0
    property int flag: 0
    property int flag1: 0
    property int i: 0


    id: a

    width: Scene.cagesize
    height: Scene.cagesize

    property int xVelocity: 0
    property int yVelocity: 0

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
    function dead(){
        a.visible = false
        // устанавливаем в массиве на месте марио пустую ячейку
        Scene.setcageinfo(Scene.getMarioxpos(),Scene.getMarioypos(),freeCage)
        console.log("kill")
    }
    //
    Keys.onPressed: {

//     if(rand==1) console.log("1");
//      if(rand==2) console.log("2");
//      if(rand==3) console.log("3");
//       if(rand== 4) console.log("4");
//       else console.log("NOOOO");


        flag++;
        console.log(rand);

        ghost1.x++;
        ghost2.x++;
        ghost3.y++;
        ghost4.x++;
        ghost5.y++;
        //;

            if (event.isAutoRepeat) {
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
                       console.log("Что-то");
                   }
                   //Устанавливаю значение пустой клетки в той что был персонаж и новое значение
                   Scene.setcageinfo(Scene.yposper,Scene.xposper-1,1)
                   console.log("Новая клетка:"+Scene.getcageinfo(Scene.yposper,Scene.xposper-1));
                   Scene.setcageinfo(Scene.yposper,Scene.xposper,9);
                   console.log("Старая клетка:"+Scene.getcageinfo(Scene.yposper,Scene.xposper));

                   xVelocity--;
                  // ghost1.x--;
                  // ghost1.x++; //////////////////////no

                   Scene.xposper--;
                   break
               case Qt.Key_Right:
                   //console.log(Scene.xposper+1,Scene.yposper);
                 // console.log("Вариант обратный"+Scene.getcageinfo(Scene.yposper,Scene.xposper-1));
                   r.jumpTo("right")
                  // ghost1.jumpTo("up")
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
                   //Устанавливаю значение пустой клетки в той что был персонаж и новое значение
                   Scene.setcageinfo(Scene.yposper,Scene.xposper+1,1)
                   //console.log("Новая клетка:"+Scene.getcageinfo(Scene.yposper,Scene.xposper+1));
                   Scene.setcageinfo(Scene.yposper,Scene.xposper,9);
                   //console.log("Старая клетка:"+Scene.getcageinfo(Scene.yposper,Scene.xposper));
                   xVelocity++;
                   // ghost1.x++;
                   Scene.xposper++;
                   break
               case Qt.Key_Down:
                    console.log(Scene.xposper,Scene.yposper+1);
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
                   //Устанавливаю значение пустой клетки в той что был персонаж и новое значение
                   Scene.setcageinfo(Scene.yposper+1,Scene.xposper,1)
                   console.log("Новая клетка:"+Scene.getcageinfo(Scene.yposper+1,Scene.xposper));
                   Scene.setcageinfo(Scene.yposper,Scene.xposper,9);
                   console.log("Старая клетка:"+Scene.getcageinfo(Scene.yposper,Scene.xposper));
                   yVelocity++;
                   // ghost1.y++;
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
                   Scene.setcageinfo(Scene.yposper-1,Scene.xposper,1)
                   console.log("Новая клетка:"+Scene.getcageinfo(Scene.yposper-1,Scene.xposper));
                   Scene.setcageinfo(Scene.yposper,Scene.xposper,9);
                   console.log("Старая клетка:"+Scene.getcageinfo(Scene.yposper,Scene.xposper));
                   yVelocity--;
                  //  ghost1.y--;
                   Scene.yposper--;
                   break
               }
    }
    }

    Keys.onReleased: {

        flag=0;
        console.log("flag is 0 now!");
        if(flag==0){
        ghost1.x++;
        ghost2.x++;
        ghost3.y++;
        ghost4.x++;
        ghost5.y++;
}
        xVelocity = 0;
        yVelocity = 0;
        r.jumpTo("rest")
       // ghost1.x=ghost1.x+1;
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
        id: marioTimer
        interval: 1
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
                switch(xVelocity){

                case 1:
                    a.x = Scene.xposper*Scene.cagesize-Scene.cagesize/2;
                    xVelocity++;
                     //ghost1.x++;

                    break;
                case 2:
                    a.x = Scene.xposper*Scene.cagesize;
                    xVelocity ++;
                     //ghost1.x++;
                    break;
                case -1:
                    a.x = Scene.xposper*Scene.cagesize+Scene.cagesize/2;
                    xVelocity++;
                    // ghost1.x++;
                    break;
                default:
                    a.x = Scene.xposper*Scene.cagesize;
                    //xVelocity = 1;
                }
                switch(yVelocity){
                case 1:
                    a.y = Scene.yposper*Scene.cagesize-Scene.cagesize/2;
                    yVelocity++
                   //  ghost1.y++;
                    break;
                case 2:
                    a.y = Scene.yposper*Scene.cagesize;
                    yVelocity ++;
                   //  ghost1.y++;
                    break;
                case -1:
                    a.y = Scene.yposper*Scene.cagesize+Scene.cagesize/2;
                    yVelocity++;
                    // ghost1.y++;
                    break;
                default:
                    a.y = Scene.yposper*Scene.cagesize;
                    //yVelocity = 1;
                }
                //a.x = Scene.xposper*Scene.cagesize;
                //a.y = Scene.yposper*Scene.cagesize;

        }
    }
}
