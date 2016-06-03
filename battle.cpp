#include "battle.h"

Battle::Battle(QObject *parent) : QObject(parent), index_enemyUnit(-1), index_playerUnit(-1)
{
    Unit * unit;
    for(int i = 0; i < 6; i++)
    {
        unit = new Unit();
        unit->setAtk(rand()%10);
//        if(!i)
//        {
//            unit->setAtk(100);
//        }
        unit->setDef(0);
        unit->setInt(5);
        unit->setSpd(i + rand()%10);
        unit->setSolMax(500);
        unit->setSol(unit->getSolMax());
        addPlayer(unit);
        done(i, *unit, 1);
    }

    unit = new Unit();
    unit->setAtk(3+rand()%9);
    unit->setDef(0);
    unit->setInt(5);
    unit->setSpd(3+ rand()%10);
    unit->setSolMax(5*(400+rand()%200));
    unit->setSol(unit->getSolMax());
    addEnemy(unit);

    done(0, *unit, 0);
}

void Battle::attack(int attacker, int defender, bool player)
{
    if(player)
    {
        getPlayer(attacker).attack(getEnemy(defender));
    }
    else
    {
        getEnemy(attacker).attack(getPlayer(defender));
    }
    emit attacking(attacker, defender, player);
}

void Battle::done(int index, Unit& unit, bool player)
{
    emit ready(index, unit, player);
}

void Battle::pickUnit()
{
    emit picked(rand()%7);
}

Unit& Battle::getPlayer(int index)
{
    return units_player[index];

}

Unit& Battle::getEnemy(int index)
{

    return units_enemy[index];

}

void Battle::addPlayer(Unit * unit)
{
    if(index_playerUnit++ < 6)
    {
        units_player[index_playerUnit] = *unit;
    }
}

void Battle::addEnemy(Unit * unit)
{
    if(index_enemyUnit++ < 6)
    {
        units_enemy[index_enemyUnit] = *unit;
    }
}

int Battle::getSoldiers(int index, bool player)
{
    int soldiers;
    if(player)
    {
        soldiers = getPlayer(index).getSol();
    }
    else
    {
        soldiers = getEnemy(index).getSol();
    }
    return soldiers;
}

int Battle::giveRand()
{
    return rand()%6;
}
