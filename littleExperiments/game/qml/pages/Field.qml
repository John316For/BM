import QtQuick 2.0
import "Scene.js" as Scene

QtObject {
    // Ссылка на объект сцены для динамического создания объектов
    property var gameBoard: null

    // Геометрия управляемого объекта
    property int actorWidth: 0
    property int actorHeight: 0

    // Геометрия неигрового объекта
    property int enemyWidth: 0
    property int enemyHeight: 0

    property int boxWidth: 0
    property int boxHeight: 0
    // Количество генерируемых неигровых объектов
    property int enemyNumber: 10
    property int boxNumber: 20
    // Список (массив) неигровых объектов
    property var enemies: []
    property var boxes: []
    // Расстояния между объектами для отслеживания коллизий,
    // заданные относительно размера управляемого объекта
    property real trampleDistance: 0.6
    property real angerDistance: 1.2
    /*создает заданное количесвто кообок,
      *располагая их в местах,указанных в массиве
      */
    function generateBoxes(){
        var component = Qt.createComponent("box.qml")
        var oldi = 0;
        var oldj = 0;
        // Отдельно генерируем каждый объект
        for (var i = 0; i < boxNumber; i++) {
            // Выбираем новые случайные координаты до тех пор,
            // пока объект изначально попадает в коллизию с управляемый персонажем
            // (который, напомним, находится в центре сцены)
                var info = Scene.getcageinfo(oldi,oldj)
                while (info != 2 || oldj < 19) {
                    oldj++;
                    info = Scene.getcageinfo(oldi,oldj)
                }

                // Генерируем случайные координаты
                var x = 50*oldi
                var y = 50*oldj
                oldj++;
            // Создаем экземпляр компонента
            var sprite = component.createObject(gameBoard, {"x": x, "y": y, "z": 0});
            // Добавляем созданный объект в список
            boxes.push(sprite)
        }
    }

//    /*!
//     * Создает заданное количество неигровых элементов,
//     * случайным образом размещая их на сцене
//     */
//    function generateEnemies() {
//        // Создаем компонент на основе QML-описания
//        var component = Qt.createComponent("Enemy.qml")

//        // Отдельно генерируем каждый объект
//        for (var i = 0; i < enemyNumber; i++) {
//            // Выбираем новые случайные координаты до тех пор,
//            // пока объект изначально попадает в коллизию с управляемый персонажем
//            // (который, напомним, находится в центре сцены)
//            do {
//                // Генерируем случайные координаты
//                var x = Math.floor(Math.random() * (gameBoard.width - enemyWidth))
//                var y = Math.floor(Math.random() * (gameBoard.height - enemyHeight))
//                // Вычисляет расстояние до центра сцены
//                var dx = Math.abs(x + enemyWidth / 2 - gameBoard.width / 2)
//                var dy = Math.abs(y + enemyHeight / 2 - gameBoard.height / 2)
//            } while (dx < actorWidth && dy < actorHeight)

//            // Создаем экземпляр компонента
//            var sprite = component.createObject(gameBoard, {"x": x, "y": y, "z": 0});
//            // Добавляем созданный объект в список
//            enemies.push(sprite)
//        }
//    }

//    /*!
//     * Отслеживает коллизии и модифицирует состояния
//     * неигровых объектов соответственно
//     * На вход функция получает координаты игрового персонажа
//     */
//    function processCollisions(x, y) {
//        // Для каждого элемента списка выполняем функцию проверки
//        enemies.forEach(function(enemy){
//            // Вычисляем расстояние между центрами игрового персонажа и объекта
//            var dx = Math.abs((x + actorWidth / 2) - (enemy.x + enemyWidth / 2))
//            var dy = Math.abs((y + actorHeight / 2) - (enemy.y + enemyHeight / 2))
//            var d = Math.sqrt(dx * dx + dy * dy)
//            // Изменяем состояние объекта в соответствии с условиями коллизии
//            if (d < actorWidth * trampleDistance) enemy.setDead()
//            else if (d < actorWidth * angerDistance) enemy.setAnxious()
//            else enemy.setCalm()
//        })
//    }
}
