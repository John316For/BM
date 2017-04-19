import QtQuick 2.0
import "Scene.js" as Scene

Item {
    width: Scene.cagesize
    height: Scene.cagesize
    SpriteSequence {
        id: stone
        width: Scene.cagesize
        height: Scene.cagesize
        interpolate: false

        Sprite{
            name: "stone"
            source: "image/stone.png"
        }
    }

}
