#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "unit.h"
#include <iostream>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QCoreApplication::setApplicationName("BattleScene");
    QCoreApplication::setOrganizationName("SomGuyOit");
    QCoreApplication::setOrganizationDomain(".Git2TehHub");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    //app.exec();
    //std::cout << "Leaving the game." << std::endl;
    //qobject signals and slots -- c++ and qml integration
    return app.exec();
}
