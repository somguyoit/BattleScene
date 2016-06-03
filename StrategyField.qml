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

    Rectangle
    {
        id: rect_enemies
        height: parent.height
        width: parent.width *.5
        color: red
        property list<Unit> enemies:
        [
            Unit{
                id: ogre

            }

        ]
    }
    Rectangle
    {
        id: rect_player
        property list<Unit> allies:
            [
            Unit{
                id: warrior
                hitPoints.width: fight.GetPlayer(0).get
            },
            Unit{
                id: knight
            },
            Unit{
                id: ninja
            },
            Unit{
                id: healer
            },
            Unit{
                id: mage
            },
            Unit{
                id: archer
            }
        ]
    }
}
