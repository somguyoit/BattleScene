#ifndef UNIT_H
#define UNIT_H

#include <QObject>

class Unit : public QObject
{
    Q_OBJECT
public:
    explicit Unit(QObject *parent = 0);
    virtual ~Unit(){}
    QString getQStr_name() const;
    void setQStr_name(const QString &value);

signals:

public slots:
    virtual void Attack(Unit * target);
    int GetSol();
    void SetSol(int soldier);
    int GetSolMax();
    void SetSolMax(int soldiers);
    int GetAtk();
    int GetDef();
    int GetSpd();
    int GetInt();
    void SetAtk(int);
    void SetDef(int);
    void SetSpd(int);
    void SetInt(int);

protected:
    QString qStr_name;
    int int_max_soldiers;
    int int_soldiers;
    int int_attack;
    int int_defense;
    int int_speed;
    int int_intellect;

};

#endif // UNIT_H
