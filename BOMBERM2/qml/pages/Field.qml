import QtQuick 2.0
import "Scene.js" as Scene

QtObject {
    // Ссылка на объект сцены для динамического создания объектов
    property var gameBoard: null
    // Геометрия управляемого объекта
    property int actorWidth: 0
    property int actorHeight: 0
    // Геометрия неигрового объекта
    property int stoneWidth: 0
    property int stoneHeight: 0
    property int boxWidth: 0
    property int boxHeight: 0
    property int bombWidth: 0
    property int bombHeight: 0
    property int rand: 0
    // Количество генерируемых неигровых объектов
    property int cageNumber: 209
    // Список (массив) неигровых объектов
    property var boxes: []
    property var stones: []
    property var bombs: []
    property var enemies: []
    // Расстояния между объектами для отслеживания коллизий,
    // заданные относительно размера управляемого объекта
    property real trampleDistance: 0.6
    property real angerDistance: 1.2

    // функция получает координаты бомбы в массиве и
    // ОБНОВЛЯЕТ ОБЪЕКТЫ ВОКРУГ БОМБЫ
    function refreshField(x, y) {}
    /*
        function clearfield() {
                for (var i = 0; i < enemies.length;i++)
                            enemies.pop();
                                }
                                */
    function generatefield() {
        // Создаем компонент на основе QML-описания
        var stonecomponent = Qt.createComponent("Stone.qml")
        var boxcomponent = Qt.createComponent("Box.qml")
        var enemycomponent = Qt.createComponent("Enemy.qml")
        var enemy1component = Qt.createComponent("Enemy1.qml")
        var enemy2component = Qt.createComponent("Enemy2.qml")
        var enemy3component = Qt.createComponent("Enemy3.qml")
        for (var i = 0; i < 11; i++) {
            for (var j = 0; j < 19; j++) {
                //var info = Scene.getcageinfo(i)
                switch (Scene.getcageinfo(i, j)) {
                case 2:
                    var x = j * Scene.cagesize
                    var y = i * Scene.cagesize
                    var bx = boxcomponent.createObject(gameBoard, {
                                                           x: x,
                                                           y: y,
                                                           z: 0
                                                       })
                    boxes.push(bx)
                    break
                case 3:
                    var x = j * Scene.cagesize
                    var y = i * Scene.cagesize
                    var bx = boxcomponent.createObject(gameBoard, {
                                                           x: x,
                                                           y: y,
                                                           z: 0
                                                       })
                    boxes.push(bx)
                    break
                case 4:
                    var x = j * Scene.cagesize
                    var y = i * Scene.cagesize
                    var st = stonecomponent.createObject(gameBoard, {
                                                             x: x,
                                                             y: y,
                                                             z: 0
                                                         })
                    stones.push(st)
                    break
                case 10:
                    var x = j * Scene.cagesize
                    var y = i * Scene.cagesize
                    var enn = enemycomponent.createObject(gameBoard, {
                                                              x: x,
                                                              y: y,
                                                              z: 4
                                                          })
                    enemies.push(enn)
                    break
                case 11:
                    var x = j * Scene.cagesize
                    var y = i * Scene.cagesize
                    var enn = enemy1component.createObject(gameBoard, {
                                                               x: x,
                                                               y: y,
                                                               z: 4
                                                           })
                    enemies.push(enn)
                    Scene.setcageinfo(j, i, 10)
                    break
                case 12:
                    var x = j * Scene.cagesize
                    var y = i * Scene.cagesize
                    var enn = enemy2component.createObject(gameBoard, {
                                                               x: x,
                                                               y: y,
                                                               z: 4
                                                           })
                    enemies.push(enn)
                    Scene.setcageinfo(j, i, 10)
                    break
                case 13:
                    var x = j * Scene.cagesize
                    var y = i * Scene.cagesize
                    var enn = enemy3component.createObject(gameBoard, {
                                                               x: x,
                                                               y: y,
                                                               z: 4
                                                           })
                    enemies.push(enn)
                    Scene.setcageinfo(j, i, 10)
                    break
                }
            }
        }
    }

    // ----------- nat
    //dont use
    /*
        function generateBomb(i,j) {
                // Создаем компонент на основе QML-описания
                        var bombcomponent = Qt.createComponent("Bomb.qml")
                                var x = i*Scene.cagesize;
                                        var y = j*Scene.cagesize;
                                                var bo = bombcomponent.createObject(gameBoard, {"x": x, "y": y, "z": 0});
                                                        bombs.push(bo);
                                                            }*/
    //nat

    //9 - пустая клетка;
    //1 - главный герой;
    //2 - коробка;
    //3 - дверь, спрятанная под коробкой;
    //4 - стена;
    //5 - враг;
    //6 - бомба;
    //7 - взрывная волна;
    //8 - дверь;

    /*!
         * Отслеживает коллизии и модифицирует состояния
              * неигровых объектов соответственно
                   * На вход функция получает координаты игрового персонажа
                        */
    function processCollisions(x, y) {}

    function enemyMove(a) {


        //enemies.forEach(function(enemy){
        //console.log("rand is "+rand)
        // rand=0;

        /////////////////////

        ////////////////////
        rand = Math.random() % 4 * 4 //+1;
        switch (rand) {
        case 0:
            //GO RIGHT!!!!!
            ///////check if free/////////////
            switch (Scene.getcageinfo(Scene.enposY[a], Scene.enposX[a] + 1)) {
            case 2:
               // console.log("Коробка")
                return
                break
            case 3:
               // console.log("Коробка и дверь")
                return
                break
            case 4:
               // console.log("Стена")
                return
                break
            case 10:
               // console.log("enemy?")
                return
                break
            case 1:
                //console.log("HEALTH POINTS SHOUD BE LESS!!!")
                mario.lesslife()
                return
                break
            default:

                //  console.log("we not moving, x is "+Scene.enposX[a]);
                enemies[a].x += Scene.cagesize
                Scene.setcageinfo(Scene.enposY[a], Scene.enposX[a], 9)
                Scene.enposX[a]++
                Scene.setcageinfo(Scene.enposY[a], Scene.enposX[a], 10)

                console.log("we moved right and x is now " + Scene.enposX[a])
            }
            break
        case 1:
            //GO LEFT!!!!!
            ///////check if free/////////////
            switch (Scene.getcageinfo(Scene.enposY[a], Scene.enposX[a] - 1)) {
            case 2:
                //console.log("Коробка")
                return
                break
            case 3:
                //console.log("Коробка и дверь")
                return
                break
            case 4:
                //console.log("Стена")
                return
                break
            case 10:
                //console.log("enemy?")
                return
                break
            case 1:
                //console.log("HEALTH POINTS SHOUD BE LESS!!!")
                mario.lesslife()
                return
                break
            default:
                //console.log("Что-то")

                ///////////////////////////////////////

                //for(i=0; i<20; i++)
                enemies[a].x -= Scene.cagesize
                Scene.setcageinfo(Scene.enposY[a], Scene.enposX[a], 9)
                Scene.enposX[a]--
                Scene.setcageinfo(Scene.enposY[a], Scene.enposX[a], 10)
                console.log("we moved left and x is now " + Scene.enposX[a])
            }
            break
        case 2:

            //GO DOWN!!!!!
            ///////check if free/////////////
            switch (Scene.getcageinfo(Scene.enposY[a] + 1, Scene.enposX[a])) {
            case 2:
                //console.log("Коробка")
                return
                break
            case 3:
                //console.log("Коробка и дверь")
                return
                break
            case 4:
                //console.log("Стена")
                return
                break
            case 10:
               // console.log("enemy?")
                return
                break
            case 1:
               // console.log("HEALTH POINTS SHOUD BE LESS!!!")
                mario.lesslife()
                return
                break
            default:
               // console.log("Что-то")

                ///////////////////////////////////////

                // for(i=0; i<20; i++)
                enemies[a].y += Scene.cagesize //was y++
                Scene.setcageinfo(Scene.enposY[a], Scene.enposX[a], 9)
                Scene.enposY[a]++ //was++
                Scene.setcageinfo(Scene.enposY[a], Scene.enposX[a], 10)
                //console.log("we moved down and y is now " + Scene.enposY[a])
            }
            break
        case 3:
            //GO UP!!!!!
            ///////check if free/////////////
            switch (Scene.getcageinfo(Scene.enposY[a] - 1, Scene.enposX[a])) {
            case 2:
                //console.log("Коробка")
                return
                break
            case 3:
                //console.log("Коробка и дверь")
                return
                break
            case 4:
                //console.log("Стена")
                return
                break
            case 10:
                //console.log("enemy?")
                return
                break
            case 1:
                //console.log("HEALTH POINTS SHOUD BE LESS!!!")
                mario.lesslife()

                return
                break
            default:
               // console.log("Что-то")

                ///////////////////////////////////////

                //for(i=0; i<20; i++)
                enemies[a].y -= Scene.cagesize //was y--
                Scene.setcageinfo(Scene.enposY[a], Scene.enposX[a], 9)
                Scene.enposY[a]--
                Scene.setcageinfo(Scene.enposY[a], Scene.enposX[a], 10)
                console.log("we moved up and y is now " + Scene.enposY[a])
            }
            break
        }

        //console.log("rand is "+rand)
        // })
    }
}
