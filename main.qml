import QtQuick 2.5
import QtQuick.Window 2.2

Window
{
    id:mainWindow
    visible: true
    height: Screen.height*.5
    width: Screen.width*.5
    x: Screen.width*.25
    y: Screen.height*.25
    //signal hoverStarted()
    DropArea
    {
        anchors.fill: story
        Drag.dragType: Drag.Automatic
        //z: 10
    }

    Dialog
    {
        //anchors.fill: parent
        height: parent.height*.9
        width: parent.width*.9
        x: parent.width*.05
        y: parent.height*.05
        id: story
        z: 10
        color: "blue"
        button.radius:width
        text.horizontalAlignment: Text.AlignHCenter
        text.verticalAlignment: Text.AlignVCenter
        text.font.pixelSize: 36
        text.text:"In the distant futurepast in a universe tangent to\nour own many factions vie for power.\n They are all evil;\nand you must become the most evil of them all!"
        button.height: parent.height*.05
        button.width: parent.width*.1

        button.x: story.width/2 - story.width/20
        button.y: story.height*8/9
            TextRect
            {
                id: continueText
                x: parent.button.x
                y: parent.button.y
                height: parent.button.height
                width: parent.button.width
                text.text: "Continue..."
                text.horizontalAlignment: Text.AlignHCenter
                text.verticalAlignment: Text.AlignVCenter


            }
            button
            {
                //mouseArea.anchors.fill:parent;
                mouseArea.onClicked:
                {
                    story.visible = false;
                    qButton.visible = true;
                    setButton.visible = true;
                    playButton.visible = true;
                }
            }

    }


    MainForm
    {
        anchors.fill: parent
        Image
        {
            id:background
            source: "logo.jpg"
            anchors.fill: parent
        }

        Button
        {
            visible: false
            id:qButton
            x: parent.width/3
            y: parent.height*5/8
            width: parent.width/3
            height: 42
            color: "blue"
            opacity: 0.5
            mouseArea.onClicked:
            {
                Qt.quit();
            }
            mouseArea.hoverEnabled: true
            mouseArea.onHoveredChanged:
            {
                if(mouseArea.containsMouse)
                {
                    qButton.opacity = 1
                }
                else
                {
                    qButton.opacity = 0.5
                }
            }
            TextRect
            {
                anchors.fill: parent
                text.text: "Quit Game"
                text.color: "Red"
                text.horizontalAlignment: Text.AlignHCenter
                text.verticalAlignment: Text.AlignVCenter

            }
        }
        Button
        {
            visible: false
            id:setButton
            x: parent.width/3
            y: parent.height*3/8
            width: parent.width/3
            height: 42
            color: "blue"
            opacity: 0.5
            mouseArea.onClicked:
            {
                Qt.quit();
            }
            mouseArea.hoverEnabled: true
            mouseArea.onHoveredChanged:
            {
                if(mouseArea.containsMouse)
                {
                    setButton.opacity = 1
                }
                else
                {
                    setButton.opacity = 0.5
                }
            }
            TextRect
            {
                anchors.fill: parent
                text.text: "Settings"
                text.color: "Red"
                text.horizontalAlignment: Text.AlignHCenter
                text.verticalAlignment: Text.AlignVCenter

            }
        }
        Button
        {
            visible: false
            id:playButton
            x: parent.width/3
            y: parent.height*1/8
            width: parent.width/3
            height: 42
            color: "blue"
            opacity: 0.5
            mouseArea.onClicked:
            {
                Qt.quit();
            }
            mouseArea.hoverEnabled: true
            mouseArea.onHoveredChanged:
            {
                if(mouseArea.containsMouse)
                {
                    playButton.opacity = 1
                }
                else
                {
                    playButton.opacity = 0.5
                }
            }
            TextRect
            {
                anchors.fill: parent
                text.text: "Play Game"
                text.color: "Red"
                text.horizontalAlignment: Text.AlignHCenter
                text.verticalAlignment: Text.AlignVCenter

            }
        }
    }
}
