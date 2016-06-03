#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "battle.h"
//#include <iostream>
//using std::cout;

void SetBattle(Battle &fight)__attribute__((optimize(0)));

int main(int argc, char *argv[])
{
    Battle fight;
    Unit * ogre = &(fight.getEnemy(0));
    QGuiApplication app(argc, argv);

    //SetBattle(fight);
    QCoreApplication::setApplicationName("BattleScene");
    QCoreApplication::setOrganizationName("SomGuyOit");
    QCoreApplication::setOrganizationDomain(".Git2TehHub");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("fight", &fight);
    engine.rootContext()->setContextProperty("fight_ogre", ogre);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

void SetBattle(Battle & fight)
{
    Unit * unit;
    for(int i = 0; i < 6; i++)
    {
        unit = new Unit();
        unit->setAtk(10-i);
        unit->setDef(rand()%10);
        unit->setInt(5);
        unit->setSpd(i + rand()%10);
        unit->setSolMax(400+rand()%200);
        unit->setSol(unit->getSolMax());
        fight.addPlayer(unit);
    }

    unit = new Unit();
    unit->setAtk(10);
    unit->setDef(rand()%10);
    unit->setInt(5);
    unit->setSpd(3+ rand()%10);
    unit->setSolMax(5*(400+rand()%200));
    unit->setSol(unit->getSolMax());
    fight.addEnemy(unit);
}
