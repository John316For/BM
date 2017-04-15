
var scenelevelone = [[4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4],
   [4,5,9,9,9,3,9,9,2,1,2,9,9,9,9,2,9,5,4],
   [4,9,4,9,4,2,4,9,4,9,4,9,4,9,4,9,4,9,4],
   [4,2,2,9,9,9,9,2,9,9,2,9,9,9,9,9,2,9,4],
   [4,9,4,9,4,2,4,9,4,2,4,9,4,9,4,9,4,9,4],
   [4,9,9,2,9,9,9,9,9,5,9,2,9,9,2,2,9,2,4],
   [4,9,4,9,4,9,4,2,4,9,4,9,4,9,4,9,4,9,4],
   [4,2,9,2,9,9,9,9,9,2,9,9,9,9,9,9,2,9,4],
   [4,9,4,9,4,2,4,9,4,9,4,9,4,9,4,2,4,9,4],
   [4,5,9,2,9,9,9,9,9,2,9,9,9,2,9,2,9,5,4],
   [4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4]]

var xposper = 9;
var yposper = 1;
function getMarioxpos(){
    return xposper;
}
function getMarioypos(){
    return  yposper;
}

function permakestep (x,y) {
    //Получаем инфу о клетке куда хоти идти
     var cageinfo = getcageinfo(xposper+x,yposper+y);
    switch (cageinfo) {
    case 1:
        console.log("Персонаж ваш там");
        return 0
        break
    case 2 :
        console.log("Коробка");
        return 0
         break
    case 3 :
        console.log("Коробка и дверь");
        return 0
         break
    case 4 :
        console.log("Стена");
        return 0
         break
    case 5 :
        console.log("Враг");
        return 0
         break
    case 6 :
        console.log("Бомба")
        return 0
         break
    case 7 :
        console.log("Взрывная волнаааа")
        return 0
         break
    case 8 :
        console.log("Дверьь")
        return 0
         break
    case 9 :
        console.log("Пустоо шагаю");
        //Обнуляем значение клетки
        scenelevelone[xposper][yposper] = 9;
        //двигаем персонажа
        xposper += x;
        yposper += y;
         scenelevelone[xposper][yposper] = 1;
        return ""
         break
     default: return ""
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
function getfieldinfo(index){
    var x = Math.floor((index)/19);
    var y = (index%19);
    return scenelevelone[x][y];
}
function getcageinfo(x,y) {
    return scenelevelone[x][y];
}

function getpicture(index) {
     var info = getfieldinfo(index);
    switch(info) {
    case 1:
        return "im/mario.png"
        break
    case 2 :
        return "im/box.png"
         break
    case 3 :
        return "im/box.png"
         break
    case 4 :
        return "im/wall.png"
         break
    case 5 :
        return "im/ghost.png"
         break
    case 6 :
        return "im/bomb.png"
         break
    case 7 :
        return "im/buum.png"
         break
    case 8 :
        return "im/d1.png"
         break
    case 9 :
        return ""
         break
     default: return ""
    }

}
    function getcolor(index){
        var info = getfieldinfo(index);
       switch(info) {
       case 1:
           return "red"
           break
       case 2 :
           return "chocolate"
            break
       case 3 :
           return "brown"
            break
       case 4 :
           return "darkgray"
            break
       case 5 :
           return "blueviolet"
            break
       case 6 :
           return "black"
            break
       case 7 :
           return "orange"
            break
       case 8 :
           return "gold"
            break
       case 9 :
           return "green"
            break
        default: return "green"
       }
    }