import QtQuick 2.0

Item {
    width: 118
    height: 118

    property bool blown: false

    function setBlown() {
        if(!blown) {
            box.jumpTo("blown")
            blown = true
        }
    }

    SpriteSequence {
        id: box
        width: 90
        height: 90
        interpolate: false

        Sprite{
            name: "usualy"
            source: "box.png"
            frameCount: 1
            frameWidth: 90
            frameHeight: 90
//            frameX: 0
//            frameY: 354
        }

        Sprite{
            name: "blown"
            source: ""
            frameCount: 1
            frameWidth: 90
            frameHeight: 90
//            frameX: 0
//            frameY: 236
        }

    }
}
