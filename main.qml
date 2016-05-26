import QtQuick 2.5
import QtQuick.Window 2.2
import Qt.labs.settings 1.0
import QtMultimedia 5.6

Window
{
    id:mainWindow
    visible: true
    height: Screen.height*.5
    width: Screen.width*.5
    x: Screen.width*.25
    y: Screen.height*.25
    BattleScene
    {
        id: battle
        visible: false
        anchors.fill: parent
    }

    Settings
    {
        id: globalSettings
        property bool showSplash;
        property bool battleVideos;
    }
    Rectangle
    {
        z: 10
        visible: false
        id:settingsMenu
        color: "yellow"
        height: parent.height*.9
        width: parent.width*.9
        x: parent.width*.05
        y: parent.height*.05

        TextRect
        {
            color: globalSettings.showSplash ? "green": "red"
            opacity: 1
            anchors.horizontalCenter: parent.horizontalCenter
            height: qButton.height
            width: qButton.width
            y: parent.height*1/8

            text.text: globalSettings.showSplash ? "Splash is on" : "Activate Splash"
            text.z: parent.z+1
            text.opacity: 1/parent.opacity

            Button
            {
                color: "transparent"
                anchors.fill: parent
                id:splashSetting
                mouseArea.onClicked:
                {
                    story.visible = false
                    globalSettings.showSplash = !(globalSettings.showSplash)
                }
            }
        }
        Button{
            color: "white"
            height: settingsMenu.height * 0.1
            width: settingsMenu.width * 0.1
            x: settingsMenu.x + settingsMenu.width * 0.85
            y: settingsMenu.y + settingsMenu.height * 0.85
            mouseArea.onClicked:
            {
                qButton.visible = true;
                setButton.visible = true;
                playButton.visible = true;
                parent.visible = false
            }
        }

    }

    DropArea
    {
        anchors.fill: story
        Drag.dragType: Drag.Automatic
        //z: 10
    }

    Dialog
    {
        visible: globalSettings.showSplash
        //anchors.fill: parent
        height: parent.height*.9
        width: parent.width*.9
        x: parent.width*.05
        y: parent.height*.05
        id: story
        z: 10
        color: "transparent"


        text.verticalAlignment: Text.AlignVCenter
        text.horizontalAlignment: Text.AlignHCenter
        text.font.pixelSize: 36
        text.text:"In the distant futurepast in a universe tangent to\nour own many factions vie for power.\n They are all evil;\nand you must become the most evil of them all!"
        text.color: "white"


        text.z: video_opening.z +1

        Video
        {
            id: video_opening
            source: "qrc:/Videos/Souten Kouro - Sōten Kōro_xvid.avi"
            autoPlay: !globalSettings.showSplash
            fillMode: VideoOutput.PreserveAspectCrop
            anchors.fill: story
            //z: parent.z +10
            onStopped:
            {
                story.visible = false;
                qButton.visible = true;
                setButton.visible = true;
                playButton.visible = true;
            }

        }
            TextRect
            {
                radius: width
                z: video_opening.z +1
                color: "white"
                id: continueText
                x: story.width/2 - story.width/20
                y: story.height*8/9
                height: parent.height*.05
                width: parent.width*.1
                text.color: "green"
                text.text: "Continue..."
                text.horizontalAlignment: Text.AlignHCenter
                text.verticalAlignment: Text.AlignVCenter


            }
            button
            {
                color: "transparent"
                anchors.fill: story
                z: video_opening.z +1
                //mouseArea.anchors.fill: story
                mouseArea.onClicked:
                {
                    //video_opening.play()
                    video_opening.stop()
                    story.visible = false;
                    qButton.visible = true;
                    setButton.visible = true;
                    playButton.visible = true;
                }
            }
    }


    MainForm
    {
        id: mainMenu
        anchors.fill: parent
        Image
        {
            id:background
            source: "logo.jpg"
            anchors.fill: parent
        }

        Button
        {
            visible: !globalSettings.showSplash
            id: qButton
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
            visible: !globalSettings.showSplash
            id:setButton
            x: parent.width/3
            y: parent.height*3/8
            width: parent.width/3
            height: 42
            color: "blue"
            opacity: 0.5
            mouseArea.onClicked:
            {
                qButton.visible = false;
                setButton.visible = false;
                playButton.visible = false;
                settingsMenu.visible = true
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
            visible: !globalSettings.showSplash
            id:playButton
            x: parent.width/3
            y: parent.height*1/8
            width: parent.width/3
            height: 42
            color: "blue"
            opacity: 0.5
            mouseArea.onClicked:
            {
                battle.visible = true;
                mainMenu.visible = false;
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
