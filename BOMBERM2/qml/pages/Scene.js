var scenelevelone = [[4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4],
                     [4, 5, 9, 10, 9, 3, 9, 9, 2, 1, 9, 9, 9, 9, 9, 2, 9, 5, 4],
                     [4, 9, 4, 9, 4, 2, 4, 9, 4, 9, 4, 9, 4, 9, 4, 9, 4, 9, 4],
                     [4, 2, 2, 9, 9, 9, 9, 2, 9, 2, 2, 9, 9, 11, 9, 9, 2, 9, 4],
                     [4, 9, 4, 9, 4, 2, 4, 9, 4, 2, 4, 9, 4, 9, 4, 9, 4, 9, 4],
                     [4, 9, 9, 2, 9, 9, 9, 9, 9, 5, 9, 2, 9, 9, 2, 2, 9, 2, 4],
                     [4, 9, 4, 9, 4, 9, 4, 2, 4, 9, 4, 9, 4, 9, 4, 9, 4, 9, 4],
                     [4, 2, 9, 2, 9, 9, 9, 9, 9, 2, 9, 9, 12, 9, 9, 9, 2, 9, 4],
                     [4, 2, 4, 9, 4, 2, 4, 9, 4, 9, 4, 9, 4, 9, 4, 2, 4, 9, 4],
                     [4, 2, 2, 2, 9, 9, 13, 9, 9, 2, 9, 9, 9, 2, 9, 2, 9, 5, 4],
                     [4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4, 4]]

var cagesize = 55
var xposper = 9
var yposper = 1
// n
var bombX = 1
var bombY = 1
var bombZ = 1

var enposX = [3, 13, 12, 6]
var enposY = [1, 3, 7, 9]

function getMarioxpos() {
    return xposper
}
function getMarioypos() {
    return yposper
}
//nat
function getBombX() {
    return bombX
}
function getBombY() {
    return bombY
}
function getBombZ() {
    return bombZ
}
function setBombX(x) {
    bombX = x
}
function setBombY(y) {
    bombY = y
}
function setBombZ(z) {
    bombZ = z
}

//Обработка взвыва бомбы
var freeCage = 9
function killMario() {
    // задевает ли она марио
    if (bombX == xposper || bombX == xposper - 1 || bombX == xposper + 1) {
        if (bombY == yposper || bombY == yposper - 1 || bombY == yposper + 1) {
            return true
        }
    }
    return false
}

// пока только коробки
var amountCrashedBoxes = 0
function detonate() {
    //коробка сверху
    console.log(scenelevelone[bombX][bombY - 1])
    if (scenelevelone[bombX][bombY - 1] === 2) {
        scenelevelone[bombX][bombY - 1] = 9
        amountCrashedBoxes++
        console.log("crush ",bombX,bombY - 1 )
    }
    //справа
    console.log(scenelevelone[bombX+1][bombY])
    if (scenelevelone[bombX + 1][bombY] === 2) {
        scenelevelone[bombX + 1][bombY] = 9
        amountCrashedBoxes++
        console.log("crush ",bombX+1,bombY)
    }
    //снизу
    console.log(scenelevelone[bombX][bombY + 1])
    if (scenelevelone[bombX][bombY + 1] === 2) {
        scenelevelone[bombX][bombY + 1] = 9
        amountCrashedBoxes++
        console.log("crush ",bombX,bombY + 1)
    }
    //слева
    console.log(scenelevelone[bombX-1][bombY])
    if (scenelevelone[bombX - 1][bombY] === 2) {
        scenelevelone[bombX - 1][bombY] = 9
        amountCrashedBoxes++//return true
        console.log("crush ",bombX - 1,bombY)
    }
    return amountCrashedBoxes
}
//====================================
//Функция установки значения в клетку
//====================================
function setcageinfo(x, y, info) {
    if (x < 0 || x > 11) {
        return -1
    }
    if (y < 0 || y > 19) {
        return -1
    }
    scenelevelone[x][y] = info
}

function permakestep(x, y) {
    //Получаем инфу о клетке куда хоти идти
    var cageinfo = getcageinfo(xposper + x, yposper + y)
    switch (cageinfo) {
    case 1:
        console.log("Персонаж ваш там")
        return 0
        break
    case 2:
        console.log("Коробка")
        return 0
        break
    case 3:
        console.log("Коробка и дверь")
        return 0
        break
    case 4:
        console.log("Стена")
        return 0
        break
    case 5:
        console.log("Враг")
        return 0
        break
    case 6:
        console.log("Бомба")
        return 0
        break
    case 7:
        console.log("Взрывная волнаааа")
        return 0
        break
    case 8:
        console.log("Дверьь")
        return 0
        break
    case 9:
        console.log("Пустоо шагаю")
        //Обнуляем значение клетки
        scenelevelone[xposper][yposper] = 9
        //двигаем персонажа
        xposper += x
        yposper += y
        scenelevelone[xposper][yposper] = 1
        return ""
        break
    default:
        return ""
    }
}

//9 - пустая клетка;
//1 - главный герой;
//2 - коробка;
//3 - дверь, спрятанная под коробкой;
//4 - стена;
//5 - враг;
//6 - бомба;
//7 - взрывная волна;
//8 - дверь;
function getfieldinfo(index) {
    var x = Math.floor((index) / 19)
    var y = (index % 19)
    return scenelevelone[x][y]
}
function getcageinfo(x, y) {
    return scenelevelone[x][y]
}

function getpicture(index) {
    var info = getfieldinfo(index)
    switch (info) {
    case 1:
        return "im/mario.png"
        break
    case 2:
        return "im/box.png"
        break
    case 3:
        return "im/box.png"
        break
    case 4:
        return "im/wall.png"
        break
    case 5:
        return "im/ghost.png"
        break
    case 6:
        return "im/bomb.png"
        break
    case 7:
        return "im/buum.png"
        break
    case 8:
        return "im/d1.png"
        break
    case 9:
        return ""
        break
    default:
        return ""
    }
}
function getcolor(index) {
    var info = getfieldinfo(index)
    switch (info) {
    case 1:
        return "red"
        break
    case 2:
        return "chocolate"
        break
    case 3:
        return "brown"
        break
    case 4:
        return "darkgray"
        break
    case 5:
        return "blueviolet"
        break
    case 6:
        return "black"
        break
    case 7:
        return "orange"
        break
    case 8:
        return "gold"
        break
    case 9:
        return "green"
        break
    default:
        return "green"
    }
}
