import QtQuick 2.0
import "Scene.js" as Scene


Item {
    width: Scene.cagesize
    height: Scene.cagesize
    SpriteSequence {
        id: box
        width: Scene.cagesize
        height: Scene.cagesize
        interpolate: false

        Sprite{
            name: "box"
            source: "image/box.png"
        }
    }
}
