import QtQuick 2.4

TextRect {
    property alias button: button

    Button{
        id: button
        mouseArea.drag.target: parent
    }

}
