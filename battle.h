#ifndef BATTLE_H
#define BATTLE_H

#include <QObject>
#include <unit.h>

class Battle : public QObject
{
    Q_OBJECT
public:
    explicit Battle(QObject *parent = 0);
    ~Battle(){}
    Q_INVOKABLE Unit& getPlayer(int index);
    Q_INVOKABLE Unit& getEnemy(int index);
    Q_INVOKABLE void addPlayer(Unit * unit);
    Q_INVOKABLE void addEnemy(Unit * unit);
    Q_INVOKABLE int getSoldiers(int index, bool player);
    Q_INVOKABLE int giveRand();

signals:
    attacking(int attacker, int defender, bool player);
    ready(int index, Unit& unit, bool player);
    picked(int index);
public slots:
    Q_INVOKABLE void attack(int attacker, int deffender, bool player);
    void done(int index, Unit& unit, bool player);
    void pickUnit();


private:
    Unit units_player[6];
    Unit units_enemy[6];
    int index_playerUnit;
    int index_enemyUnit;
};

#endif // BATTLE_H
