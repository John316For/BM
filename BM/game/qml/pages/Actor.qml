import QtQuick 2.0

Item {
    id: a

    width: 118
    height: 118

    property int xVelocity: 0
    property int yVelocity: 0

    SpriteSequence {
        id: r
        width: 118
        height: 118
        interpolate: false

        Sprite {
            name: "left"
            source: "sheet.png"
            frameCount: 1
            frameWidth: 118
            frameHeight: 118
            frameX: 236
            frameY: 0
        }

        Sprite {
            name: "right"
            source: "sheet.png"
            frameCount: 1
            frameWidth: 118
            frameHeight: 118
            frameX: 236
            frameY: 118
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
