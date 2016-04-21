#include "unit.h"

Unit::Unit(QObject *parent) : QObject(parent), int_max_soldiers(0), int_soldiers(0), int_attack(0),\
    int_defense(0), int_speed(0), int_intellect(0)
{

}

void Unit::Attack(Unit *target)
{
    target->int_soldiers -= (int_attack/target->int_defense)*.25*int_soldiers;
}

int Unit::GetSol()
{
    return int_soldiers;
}

void Unit::SetSol(int soldier)
{
    int_soldiers = soldier;
}

int Unit::GetSolMax()
{
    return int_max_soldiers;
}

void Unit::SetSolMax(int soldiers)
{
    int_max_soldiers = soldiers;
}

int Unit::GetAtk()
{
    return int_attack;
}

int Unit::GetDef()
{
    return int_defense;
}

int Unit::GetSpd()
{
    return int_speed;
}

int Unit::GetInt()
{
    return int_intellect;
}

void Unit::SetAtk(int atk)
{
    int_attack = atk;
}

void Unit::SetDef(int def)
{
    int_defense = def;
}

void Unit::SetSpd(int spd)
{
    int_speed = spd;
}

void Unit::SetInt(int Int)
{
    int_intellect = Int;
}

QString Unit::getQStr_name() const
{
    return qStr_name;
}

void Unit::setQStr_name(const QString &value)
{
    qStr_name = value;
}
