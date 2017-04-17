import QtQuick 2.0


Item {
    width: 50
    height: 50
    SpriteSequence {
        id: stone
        width: 50
        height: 50
        interpolate: false

        Sprite{
            name: "box"
            source: "image/box.png"
        }
    }
}
