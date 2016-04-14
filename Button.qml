import QtQuick 2.4

Rectangle {
    property alias mouseArea: mooseArea
    MouseArea{
        id: mooseArea
        anchors.fill: parent
    }

}
