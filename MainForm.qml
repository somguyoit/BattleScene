import QtQuick 2.4

Rectangle {

    
    anchors.centerIn: parent
    property alias mouseArea: mouseArea
    property alias button: gameStartRect

    Rectangle {
        id: gameStartRect
        x: parent.width/3
        y: parent.height/8
        width: parent.width/3
        height: 52
        color: "#090d3a"
        z: 1

        Text {
            id: gameStartText
            x: 0
            y: 0
            color: "#b91818"
            text: qsTr("Start Game")
            font.italic: false
            font.strikeout: false
            font.underline: true
            font.bold: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.fill: parent
            font.pixelSize: 13
        }

        MouseArea {
            id: mouseArea
            visible: true
            hoverEnabled: true
            anchors.fill: gameStartRect
        }
    }

}
