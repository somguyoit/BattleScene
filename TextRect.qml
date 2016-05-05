import QtQuick 2.4

Rectangle {
    color: "transparent"
    property alias text: text
    Text{
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        id: text
        anchors.fill: parent
    }

}
