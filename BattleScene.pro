TEMPLATE = app

QT += qml quick
CONFIG += c++11

SOURCES += main.cpp \
    unit.cpp \
    battle.cpp

RESOURCES += qml.qrc \
    battle.qrc \
    videos.qrc \
    images.qrc

CONFIG += resources_big

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

DISTFILES +=

HEADERS += \
    unit.h \
    battle.h
