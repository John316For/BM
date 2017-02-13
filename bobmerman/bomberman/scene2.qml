import QtQuick 2.0

Item {
    id: scene0
    property int field1: [[1,2],[1,2]]
    function getcageinfo() {
        return field1[1][1];
    }
}
