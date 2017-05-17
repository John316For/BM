import QtQuick 2.0
import "Scene.js" as Scene

 Item {
     id: en
    width: Scene.cagesize
    height: Scene.cagesize



    SpriteSequence {
        id: enem
        width: Scene.cagesize
        height: Scene.cagesize
        interpolate: false

        Sprite{
            id: en1
            name: "enemy1"
            source: "image/en1.png"
        }
/*
        Sprite{
            id: en2
            name: "enemy2"
            source: "image/en2.png"
        }

        Sprite{
            id: en3
            name: "enemy3"
            source: "image/en3.jpg"
        }
        Sprite{
            id: en4
            name: "enemy4"
            source: "image/en4.jpg"
      }*/
    }




//    Keys.onPressed: {
//        rand = Math.random() % 4;
//        switch (rand) {
//               case 0:
//                   enem.x++;
//                   break
//               case 1:
//                   enem.x--;
//                   break
//               case 2:
//                   enem.y++;
//                   break
//               case 3:
//                   enem.y--;
//                   break
//    }
//        console.log("rand is"+rand);
//    }



//    Timer {
//        id: marioTimer
//        interval: 0.5
//        triggeredOnStart: true
//        running: true
//        repeat: true
//        onTriggered: {

//                en1.x++;
//                 en1.y++;
//        }
//    }
}
