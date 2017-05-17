import QtQuick 2.0
import "Scene.js" as Scene

Item {
    width: Scene.cagesize
    height: Scene.cagesize
    visible: false
    SpriteSequence {
        id: boom
        width: Scene.cagesize
        height: Scene.cagesize
        interpolate: false

        Sprite{
            name: "boom"
            source: "image/boom2.png"
            frameCount: 4
            frameWidth: 125
            frameX: 0
            frameY: 0
            frameSync: true
        }
    }
}
