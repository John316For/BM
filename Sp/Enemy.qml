import QtQuick 2.0
import QtMultimedia 5.0

Item {
    width: 118
    height: 118
    property int xxVelocity: 0
    property int yyVelocity: 0
    property var flag: false

    property bool dead: false


    SpriteSequence {
        id: enemy
        width: 40
        height: 50
        interpolate: false

        Sprite{
            name: "1"
            source: "en1.jpg"

        }

        Sprite{
            name: "2"
            source: "en2.jpg"

        }

        Sprite{
            name: "3"
            source: "en3.jpg"

        }
        Sprite{
            name: "4"
            source: "en4.jpg"

        }



    }




    Timer {
        interval: 5
        triggeredOnStart: true
        running: true
        repeat: true
        onTriggered: {

            x += xxVelocity
            y += yyVelocity

        }
    }




}
