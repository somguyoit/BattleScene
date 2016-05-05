import QtQuick 2.0
import QtQuick.Window 2.2
import Qt.labs.settings 1.0

Item
{
    id: battleScene
    Rectangle
    {
     id: fightScene
     height: parent.height*.5
     width: parent.widht
     color: "green"
     z:parent.z+1
    }

    Rectangle
    {
        id: strategyScene
        height:parent.height *.5
        y: parent.y + parent.height *.5
        color: "blue"
    }

}
