import QtQuick 2.0

Rectangle{
    property int hitPoints : 1;
    property int maxHP : 1;
    property alias stats: rect_stats
    property string portrait;
    property string unitName;
    opacity: 1/1.6
    radius: height * 0.16
    border.color: "black"
    border.width: height *.01
//    border.z: z+3
    color: "dark green"
//    z:parent.z+1
//    onHitPointsChanged:
//    {
//        rect_current_hp.width = rect_max_hp *.9
//        rect_current_hp.z = rect_max_hp.z +1
//    }

    //anchors.fill: parent
    Rectangle
    {
        property alias image_portrait: img_portrait
        id: rect_portrait
        height: parent.height * .5
        width: parent.width * .25
        radius: parent.radius
        color: "transparent"
        Image
        {
            id: img_portrait
            source: portrait
            height: parent.height
            width: height
            fillMode: Image.PreserveAspectFit
        }
    }
    Rectangle
    {
        radius: parent.radius
        id: rect_max_hp
//        z: parent.z + 1
        anchors.left: rect_portrait.right
        anchors.verticalCenter: rect_portrait.verticalCenter
        height: rect_portrait.height
        width: parent.width * .75
        color: "red"
        Rectangle
        {
            id: rect_current_hp
            radius: parent.radius
            height: parent.height
            width: parent.width * .6
            border.color: "blue"
            border.width: 3
            color: "green"
            z: rect_max_hp.z +1
        }
    }
    Rectangle
    {
        id: rect_stats
        x: parent.x+parent.height*.25
        height: parent.height*.75
        width: parent.width
        color: "transparent"
        anchors.top: rect_portrait.bottom
        anchors.left: rect_portrait.left
        Column{

            Row{
                Text{
                    text: " Name:\t"
                    font.pointSize: rect_stats.height * .2
                }

                Text{
                    text: unitName
                    font.pointSize: rect_stats.height * .2
                }

            }
            Row{

                Text
                {
                    text: " Soldiers:\t"
                    font.pointSize: rect_stats.height * .2
                }
                Text
                {
                    text: hitPoints
                    font.pointSize: rect_stats.height * .2
                }
            }
        }
    }
}
