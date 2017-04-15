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

    // Количество генерируемых неигровых объектов
    property int cageNumber: 209
    // Список (массив) неигровых объектов
    property var boxes: []
    property var stones:[]
    // Расстояния между объектами для отслеживания коллизий,
    // заданные относительно размера управляемого объекта
    property real trampleDistance: 0.6
    property real angerDistance: 1.2

    function generatefield() {
        // Создаем компонент на основе QML-описания
        var stonecomponent = Qt.createComponent("Stone.qml")
        for (var i = 0; i < 11; i++) {
            for (var j = 0; j < 19; j++) {
                //var info = Scene.getcageinfo(i)
                switch (Scene.getcageinfo(i,j)) {
//                case 2:
//                    return "im/box.png"
//                    break
//                case 3:
//                    return "im/box.png"
//                    break
                case 4:
                    var x = j*50;
                    var y = i*50;
                    var st = stonecomponent.createObject(gameBoard, {"x": x, "y": y, "z": 0});
                    stones.push(st);
                    break
                }
            }
        }
    }

    /*!
     * Отслеживает коллизии и модифицирует состояния
     * неигровых объектов соответственно
     * На вход функция получает координаты игрового персонажа
     */
     function processCollisions(x, y) {

     }
}
