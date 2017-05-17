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

    // Количество генерируемых неигровых объектов
    property int cageNumber: 209
    // Список (массив) неигровых объектов
    property var boxes: []
    property var stones:[]
    property var bombs:[]
    // Расстояния между объектами для отслеживания коллизий,
    // заданные относительно размера управляемого объекта
    property real trampleDistance: 0.6
    property real angerDistance: 1.2

    // функция получает координаты бомбы в массиве и
    // ОБНОВЛЯЕТ ОБЪЕКТЫ ВОКРУГ БОМБЫ
    function refreshField(x,y) {


    }

    function generatefield() {
        // Создаем компонент на основе QML-описания
        var stonecomponent = Qt.createComponent("Stone.qml")
        var boxcomponent = Qt.createComponent("Box.qml")
        for (var i = 0; i < 11; i++) {
            for (var j = 0; j < 19; j++) {
                //var info = Scene.getcageinfo(i)
                switch (Scene.getcageinfo(i,j)) {
                case 2:
                    var x = j*Scene.cagesize;
                    var y = i*Scene.cagesize;
                    var bx = boxcomponent.createObject(gameBoard,{"x": x,"y": y,"z": 0});
                    boxes.push(bx);
                    break
                case 3:
                    var x = j*Scene.cagesize;
                    var y = i*Scene.cagesize;
                    var bx = boxcomponent.createObject(gameBoard,{"x": x,"y": y,"z": 0});
                    boxes.push(bx);
                    break
                case 4:
                    var x = j*Scene.cagesize;
                    var y = i*Scene.cagesize;
                    var st = stonecomponent.createObject(gameBoard, {"x": x, "y": y, "z": 0});
                    stones.push(st);
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
     function processCollisions(x, y) {

     }
}
