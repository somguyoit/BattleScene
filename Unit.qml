import QtQuick 2.0

Rectangle{

    property int index;
    property alias HP :rect_current_hp
    property alias STATS: rect_stats
    property alias PORTRAIT: rect_portrait
    Rectangle
    {
        id: rect_portrait
        height: parent.height * .25
        width: parent.width * .25
        Image
        {
            id: img_portrait
            anchors.fill: parent
        }
    }
    Rectangle
    {
        anchors.left: img_portrait.left
        height: img_portrait.height
        width: parent.width * .75
        color: "red"
        Rectangle
        {
            id: rect_current_hp
            color: "green"
        }
    }
    Rectangle
    {
        id: rect_stats
        x: parent.x+parent.height*.25
        height: parent.height*.75
        width: parent.width
    }

}
