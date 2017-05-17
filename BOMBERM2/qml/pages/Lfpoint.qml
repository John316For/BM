import QtQuick 2.0
import "Scene.js" as Scene

Item {
    id: lp
    width: Scene.cagesize*mario.lifecount
    height: Scene.cagesize*2/3
    SpriteSequence {
        id: r
        width: Scene.cagesize*mario.lifecount
        height: Scene.cagesize*2/3
        interpolate: false
        Sprite {
            name: "3life"
            source: "image/l3.png"
        }

        Sprite {
            name: "2life"
            source: "image/l2.png"
        }

        Sprite {
            name: "1life"
            source: "image/l1.png"
        }
    }
    function changesost(l){
        switch(l){
        case 3:
            r.jumpTo("3life");
            break;
        case 2:
            r.jumpTo("2life");
            break;
        case 1:
            r.jumpTo("1life");
            break;
        }
    }
}
