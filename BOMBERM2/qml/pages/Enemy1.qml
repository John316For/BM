import QtQuick 2.0
import "Scene.js" as Scene

 Item {
     id: en
    width: Scene.cagesize
    height: Scene.cagesize



    SpriteSequence {
        id: enem2
        width: Scene.cagesize
        height: Scene.cagesize
        interpolate: false

        Sprite{
            id: en2
            name: "enemy2"
            source: "image/en2.png"
        }
    }
 }
