#ifndef UNIT_H
#define UNIT_H

#include <QObject>
#include <QImage>

class Unit : public QObject
{
    Q_OBJECT
public:
    explicit Unit(QObject *parent = 0);
    virtual ~Unit(){}
    Unit(const Unit& copy, QObject *parent);
    Unit& operator=(const Unit& copy);
    //QString getQStr_name() const;
    //void setQStr_name(const QString &value);
    Q_INVOKABLE void attack(Unit & target);
    Q_INVOKABLE int getSol();
    Q_INVOKABLE void setSol(int soldier);
    Q_INVOKABLE int getSolMax();
    Q_INVOKABLE void setSolMax(int soldiers);
    Q_INVOKABLE int getAtk();
    Q_INVOKABLE int getDef();
    Q_INVOKABLE int getSpd();
    Q_INVOKABLE int getInt();
    //QUrl GetPortrait();
    Q_INVOKABLE void setAtk(int);
    Q_INVOKABLE void setDef(int);
    Q_INVOKABLE void setSpd(int);
    Q_INVOKABLE void setInt(int);

    //void SetQImg(QUrl picture);
signals:
    damageTaken(int soldiers);

protected:
    //QImage qImg_Portrait;
    //QString qStr_name;
    int int_max_soldiers;
    int int_soldiers;
    int int_attack;
    int int_defense;
    int int_speed;
    int int_intellect;

};

#endif // UNIT_H
