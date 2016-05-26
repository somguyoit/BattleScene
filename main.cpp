#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "battle.h"
#include <iostream>
using std::cout;

void SetBattle(Battle &fight);

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    Battle BattleScene;
    SetBattle(BattleScene);
    //int number = rand()%5;
    //icout << number;
    QCoreApplication::setApplicationName("BattleScene");
    QCoreApplication::setOrganizationName("SomGuyOit");
    QCoreApplication::setOrganizationDomain(".Git2TehHub");

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("fight", &BattleScene);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

void SetBattle(Battle & fight)
{
    Unit * unit;
    for(int i = 0; i < 6; i++)
    {
        unit = new Unit();
        unit->SetAtk(10-i);
        unit->SetDef(rand()%10);
        unit->SetInt(5);
        unit->SetSpd(i + rand()%10);
        unit->SetSolMax(400+rand()%200);
        unit->SetSol(unit->GetSolMax());
        fight.AddPlayer(unit);
    }

    unit = new Unit();
    unit->SetAtk(10);
    unit->SetDef(rand()%10);
    unit->SetInt(5);
    unit->SetSpd(3+ rand()%10);
    unit->SetSolMax(5*(400+rand()%200));
    unit->SetSol(unit->GetSolMax());
    fight.AddEnemy(unit);
}
