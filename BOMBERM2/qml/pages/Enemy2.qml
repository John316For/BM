import QtQuick 2.0
import "Scene.js" as Scene

 Item {
     id: en
    width: Scene.cagesize
    height: Scene.cagesize



    SpriteSequence {
        id: enem3
        width: Scene.cagesize
        height: Scene.cagesize
        interpolate: false

        Sprite{
            id: en3
            name: "enemy3"
            source: "image/en3.png"
        }
    }
 }
