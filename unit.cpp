#include "unit.h"
#include <QDebug>

Unit::Unit(QObject *parent) : QObject(parent), int_max_soldiers(0), int_soldiers(0), int_attack(0),\
    int_defense(0), int_speed(0), int_intellect(0)/*, qImg_Portrait(), qStr_name("Warrior")*/
{

}

Unit::Unit(const Unit &copy, QObject * parent =0) :QObject(parent)
{
    *this = copy;
}

Unit& Unit::operator=(const Unit& copy)
{
    if(this != &copy)
    {
        //qImg_Portrait = copy.qImg_Portrait;
        //qStr_name = copy.qStr_name;
        int_max_soldiers = copy.int_max_soldiers;
        int_soldiers = copy.int_soldiers;
        int_attack = copy.int_attack;
        int_defense = copy.int_defense;
        int_speed = copy.int_speed;
        int_intellect = copy.int_intellect;
    }
    return *this;
}

void Unit::attack(Unit & target)
{
    target.int_soldiers -= (int_attack-target.int_defense)*.01*int_soldiers;
    //int_soldiers -= .3*((target.int_attack - int_defense)* .01 * target.int_soldiers);
}

int Unit::getSol()
{
//    qDebug() << int_soldiers << "current soldiers";
    return int_soldiers;
}

void Unit::setSol(int soldier)
{
    int_soldiers = soldier;
}

int Unit::getSolMax()
{
//    qDebug() << int_max_soldiers << " max soldiers";
    return int_max_soldiers;
}

void Unit::setSolMax(int soldiers)
{
    int_max_soldiers = soldiers;
}

int Unit::getAtk()
{
    return int_attack;
}

int Unit::getDef()
{
    return int_defense;
}

int Unit::getSpd()
{
    return int_speed;
}

int Unit::getInt()
{
    return int_intellect;
}

void Unit::setAtk(int atk)
{
    int_attack = atk;
}

void Unit::setDef(int def)
{
    int_defense = def;
}

void Unit::setSpd(int spd)
{
    int_speed = spd;
}

void Unit::setInt(int Int)
{
    int_intellect = Int;
}

//QString Unit::getQStr_name() const
//{
//    return qStr_name;
//}

//void Unit::setQStr_name(const QString &value)
//{
//    qStr_name = value;
//}
