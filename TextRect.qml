import QtQuick 2.4

Rectangle {
    color: "transparent"
    property alias text: text
    Text{
        id: text
        anchors.fill: parent
    }

}
