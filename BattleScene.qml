import QtQuick 2.0
import QtQuick.Window 2.2
import Qt.labs.settings 1.0

Item
{
    id: battleScene
    property bool playVideos;
    //    property alias commands: command_scene

    Rectangle
    {

        id: fightScene
        height: parent.height*.5
        width: parent.width
        color: "green"
        z:parent.z+1
        x: parent.x
        y: parent.y
        border.color: "beige"
        border.width: 3
        Rectangle{
            anchors.fill: parent
            z: parent.z +3
            color: "transparent"
            border.color: "beige"
            border.width: 3
        }

        Image {
            id: img_background
            source: "qrc:Images/BattleFiled.jpg"
            anchors.fill: parent
        }
        Image{
            id: img_ogre
            source: "qrc:Images/Ogre.png"
            height: parent.height*1.3
            width: height
            fillMode: Image.PreserveAspectFit
        }

        Rectangle{
            id: rect_player
            x: parent.x + 0.5*parent.width
            y: parent.y + 0.6*parent.height
            height: parent.height*.40
            width: parent.width*.5
            color: "transparent"




            Image{
                id: img_warrior
                fillMode:  Image.PreserveAspectFit
                source: "qrc:Images/saber.png"
                height:parent.height
                width: height
                anchors.bottom: parent.top
            }
            Image{
                id: img_knight
                fillMode:  Image.PreserveAspectFit
                anchors.bottom: parent.verticalCenter
                height: img_warrior.height
                width: height
                anchors.horizontalCenter: img_warrior.horizontalCenter
                anchors.horizontalCenterOffset: width*.5
                //x:parent.x
                source: "qrc:Images/knight.png"
            }
            Image{
                id: img_ninja
                fillMode:  Image.PreserveAspectFit
                //x:parent.x
                anchors.horizontalCenter: img_warrior.horizontalCenter
                anchors.horizontalCenterOffset: width
                anchors.bottom: parent.bottom
                height: img_warrior.height
                width: height
                source: "qrc:Images/ninja.png"
                z: parent.z+1
            }
            Image{
                id: img_healer
                fillMode:  Image.PreserveAspectFit
                //y: parent.y
                anchors.verticalCenter: img_warrior.verticalCenter
                anchors.left: img_warrior.right
                height: img_warrior.height
                source: "qrc:Images/healer.png"
                anchors.verticalCenterOffset: height*.1
            }
            Image{
                id: img_magician
                fillMode:  Image.PreserveAspectFit
                height: img_warrior.height
                anchors.left: img_knight.right
                anchors.bottom: parent.verticalCenter
                source: "qrc:Images/magician.png"
            }
            Image{
                id: img_archer
                fillMode:  Image.PreserveAspectFit
                height: img_warrior.height
                anchors.left: img_ninja.right
                anchors.bottom: parent.bottom
                source: "qrc:Images/archer.png"
            }
        }
    }
}
