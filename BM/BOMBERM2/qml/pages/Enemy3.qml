import QtQuick 2.0
import "Scene.js" as Scene

 Item {
     id: en
    width: Scene.cagesize
    height: Scene.cagesize



    SpriteSequence {
        id: enem4
        width: Scene.cagesize
        height: Scene.cagesize
        interpolate: false

        Sprite{
            id: en4
            name: "enemy4"
            source: "image/en4.png"
        }
    }
 }
