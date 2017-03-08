import QtQuick 2.0

Item {
    id: a

    width: 50
    height: 50

    property int xVelocity: 0
    property int yVelocity: 0

    SpriteSequence {
        id: r
        width: 50
        height: 82
        interpolate: false

        Sprite {
            name: "left"
            source: "mario.png"
            frameCount: 1
            frameWidth: 17
            frameHeight: 28
            frameX: 0
            frameY: 0
        }

        Sprite {
            name: "right"
            source: "mario.png"
            frameCount: 1
            frameWidth: 17
            frameHeight: 28
            frameX: 187
            frameY: 0
        }
    }

    Keys.onPressed: {
        if (event.isAutoRepeat) {
            return;
        }

        switch (event.key) {
        case Qt.Key_Left:
            xVelocity -= 5
            break;
        case Qt.Key_Right:
            xVelocity += 5
            break;
        }
    }

    Keys.onReleased: {
        if (event.isAutoRepeat) {
            return;
        }
        switch (event.key) {
        case Qt.Key_Left:
            xVelocity += 5
            break;
        case Qt.Key_Right:
            xVelocity -= 5
            break;
        }
    }

    Timer {
        interval: 5
        triggeredOnStart: true
        running: true
        repeat: true
        onTriggered: {
            a.x += xVelocity
            a.y += yVelocity

            if (xVelocity < 0) r.jumpTo("left");
            else if (xVelocity > 0) r.jumpTo("right")
        }
    }
}
