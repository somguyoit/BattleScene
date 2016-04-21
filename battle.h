#ifndef BATTLE_H
#define BATTLE_H

#include <QObject>
#include <unit.h>

class Battle : public QObject
{
    Q_OBJECT
public:
    explicit Battle(QObject *parent = 0);

signals:

public slots:

private:
    Unit units_player[6];
    Unit units_enemy[6];
    int index_playerUnit;
    int index_enemyUnit;
};

#endif // BATTLE_H
