import QtQuick 2.0
import QtMultimedia 5.0
import "Scene.js" as Scene

Item {
    id: enemy
    width: Scene.cagesize
    height: Scene.cagesize

    property int xVelocity: 0
    property int yVelocity: 0

    property bool dead: false

/////////////////////////////////////

//    Rectangle {
//        id: ghost1
//        width: 40
//        height: 50
//        x: 840
//        y: 160
//        z:1
//        Image {

//            width: 40
//            height: 50

//            source: "image/en4.jpg"  //en4
//        }
//    }

//    /////////////////////ENEMY2//////////////////////////////////////

//    Rectangle {
//        id: ghost2
//        width: 40
//        height: 50
//        x: 150
//        y: 50
//        z:1
//        Image {

//            width: 40
//            height: 50

//            source: "image/en1.jpg"
//        }
//    }


//    //////////////////ENEMY3////////////////

//    Rectangle {
//        id: ghost3
//        width: 40
//        height: 50
//        x: 50
//        y: 250
//        z:1
//        Image {

//            width: 40
//            height: 50

//            source: "image/en2.jpg"
//        }
//    }

//    /////////////

//    /////////////////ENEMY4///////////////////////////////
//    Rectangle {
//        id: ghost4
//        width: 40
//        height: 50
//        x: 600
//        y: 340
//        z:1
//        Image {

//            width: 40
//            height: 50

//            source: "image/en3.jpg"
//        }
//    }

//    /////////////////////////////////////////
//    //////////////////ENEMY5///////////////////
//    Rectangle {
//        id: ghost5
//        width: 40
//        height: 50
//        x: 400
//        y: 50
//        z:1
//        Image {

//            width: 40
//            height: 50

//            source: "image/en1.jpg"
//        }
//    }

  // Keys.onPressed:  {

  // }

//   Keys.onReleased: {
//       ghost1.x--;
//       ghost2.x--;
//       ghost3.y--;
//       ghost4.x--;
//       ghost5.y--;
//   }

    /////////////////////////////////////



    //    function setCalm() {
//        if(!dead) {
//            enemy.jumpTo("calm")
//        }
//    }

//    function setAnxious() {
//        if(!dead)
//            enemy.jumpTo("anxious")
//    }

//    function setDead() {
//        if(!dead) {
//            enemy.jumpTo("dead")
//            glass.play()
//            dead = true
//        }
//    }


//    SpriteSequence {
//        id: en
//        width: Scene.cagesize
//        height: Scene.cagesize
//        interpolate: false

//        Sprite{
//            name: "calm"
//            source: "image/en1.png"
//            frameCount: 1
//           frameWidth: Scene.cagesize
//            frameHeight: Scene.cagesize
//            frameX: 0
//            frameY: Scene.cagesize
//        }


//        Sprite{
//            name: "anxious"
//            source: "image/en2.png"
//            frameCount: 1
//           frameWidth: 19
//            frameHeight: 25
//            frameX: 0
//            frameY: 236
//        }

//        Sprite{
//            name: "dead"
//            source: "image/en3.png"
//            frameCount: 1
//            frameWidth: 19
//            frameHeight: 25
//            frameX: 118
//            frameY: 354
//        }
//    }

    property int freeCage: 9
    function dead(){
        enemy.visible = false
        // устанавливаем в массиве на месте марио пустую ячейку
        Scene.setcageinfo(Scene.getMarioxpos(),Scene.getMarioypos(),freeCage)
        console.log("kill")
    }
/* ПОКА ЧТО
    PropertyAnimation {
        target: enemy
        properties: "x"
        from: -5
        to: 5
        duration: 100
        running: en.x = en.x+y
        loops: Animation.Infinite
    }*/

//    SoundEffect {
//        id: glass
//        source: "glass.wav"
//    }
}
