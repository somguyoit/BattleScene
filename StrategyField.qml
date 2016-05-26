import QtQuick 2.0

Rectangle
{
    id: strategyScene
    height: fightScene.height
    width: fightScene.width
    y: parent.y + parent.height *.5
    color: "blue"
    border.color: "black"
    border.width: 3
    Connections
    {
        target: fight
        onAttacking:{
            if(player)
            {

            }
            else
            {

            }

        }
    }

    Rectangle
    {
        id: rect_enemies
        Unit
        {

        }
    }
    Rectangle
    {
        id: rect_player
    }
}
