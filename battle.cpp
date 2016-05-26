#include "battle.h"

Battle::Battle(QObject *parent) : QObject(parent), index_enemyUnit(-1), index_playerUnit(-1)
{


}

void Battle::Attack(int attacker, int deffender, bool player)
{
    if(player)
    {
        GetPlayer(attacker).Attack(&GetEnemy(deffender));
    }
    else
    {
        GetEnemy(attacker).Attack(&GetPlayer(deffender));
    }
    emit Attacking(attacker, deffender, player);
}

Unit& Battle::GetPlayer(int index)
{
    if(index > -1 && index_playerUnit <= index)
    {
        return units_player[index];
    }
}

Unit& Battle::GetEnemy(int index)
{
    if(index > -1 && index_enemyUnit <= index)
    {
        return units_enemy[index];
    }
}

void Battle::AddPlayer(Unit * unit)
{
    if(index_playerUnit++ < 6)
    {
        units_player[index_playerUnit] = *unit;
    }
}

void Battle::AddEnemy(Unit * unit)
{
    if(index_enemyUnit++ < 6)
    {
        units_enemy[index_playerUnit] = *unit;
    }
}
