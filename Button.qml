import QtQuick 2.4

Rectangle {
    color: "transparent"
    property alias mouseArea: mooseArea
    MouseArea{
        id: mooseArea
        anchors.fill: parent
    }

}
