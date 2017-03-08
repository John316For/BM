/*
  Copyright (C) 2013 Jolla Ltd.
  Contact: Thomas Perl <thomas.perl@jollamobile.com>
  All rights reserved.

  You may use this file under the terms of BSD license as follows:

  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions are met:
    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of the Jolla Ltd nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
  WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
  DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDERS OR CONTRIBUTORS BE LIABLE FOR
  ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
  (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
  LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
  ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

import QtQuick 2.0
import Sailfish.Silica 1.0
import "Scene.js" as Scene
Page {
    id: page

    Item {
        id: board
        anchors.fill: parent

        Image {
            source: "back.jpg"
            fillMode: Image.Tile

            anchors.fill: parent
            z: -1
        }

        EnemyManager {
            id: enemyManager

            gameBoard: board

            actorWidth: 118
            actorHeight: 118

            enemyWidth: 118
            enemyHeight: 118

            enemyNumber: 10

            Component.onCompleted: generateEnemies()
        }
        Field {
            id: fieldMeneger
            gameBoard: board


            boxWidth: 100
            boxHeight: 100
            // Количество генерируемых неигровых объектов
            enemyNumber: 10
            boxNumber: 20
            Component.onCompleted: generateBoxes()

        }

        Actor {
            id: actor

            x: parent.width / 2 - width / 2
            y: parent.height / 2 - height / 2
            z: 1

            focus: true

            onXChanged: enemyManager.processCollisions(x, y)
            onYChanged: enemyManager.processCollisions(x, y)
        }
    }
}

