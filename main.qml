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
    property int selected;
    onSelectedChanged:
    {
        if(selected == 0)
        {
            sabre_command.opacity = 1;
            night_command.opacity = 1/1.6;
            ninja_command.opacity = 1/1.6;
            healer_command.opacity = 1/1.6;
            mage_command.opacity = 1/1.6;
            archer_command.opacity = 1/1.6;
        }
        else if(selected == 1)
        {
            sabre_command.opacity = 1/1.6;
            night_command.opacity = 1/1;
            ninja_command.opacity = 1/1.6;
            healer_command.opacity = 1/1.6;
            mage_command.opacity = 1/1.6;
            archer_command.opacity = 1/1.6;
        }
        else if(selected == 2)
        {
            sabre_command.opacity = 1/1.6;
            night_command.opacity = 1/1.6;
            ninja_command.opacity = 1/1;
            healer_command.opacity = 1/1.6;
            mage_command.opacity = 1/1.6;
            archer_command.opacity = 1/1.6;
        }
        else if(selected == 3)
        {
            sabre_command.opacity = 1/1.6;
            night_command.opacity = 1/1.6;
            ninja_command.opacity = 1/1.6;
            healer_command.opacity = 1/1;
            mage_command.opacity = 1/1.6;
            archer_command.opacity = 1/1.6;
        }
        else if(selected == 4)
        {
            sabre_command.opacity = 1/1.6;
            night_command.opacity = 1/1.6;
            ninja_command.opacity = 1/1.6;
            healer_command.opacity = 1/1.6;
            mage_command.opacity = 1/1;
            archer_command.opacity = 1/1.6;
        }
        else
        {
            sabre_command.opacity = 1/1.6;
            night_command.opacity = 1/1.6;
            ninja_command.opacity = 1/1.6;
            healer_command.opacity = 1/1.6;
            mage_command.opacity = 1/1.6;
            archer_command.opacity = 1/1;
        }
    }

    Connections
    {
        target: fight
        onAttacking:
        {
            if(player)
            {
                ogre.hitPoints = fight.getSoldiers(0, 0);
            }
            else
            {
                if(defender == 0)
                {
                    sabre_command.hitPoints = fight.getSoldiers(defender,1)
                }
                else if(defender == 1)
                {
                    night_command.hitPoints = fight.getSoldiers(defender,1)
                }
                else if (defender == 2)
                {
                    ninja_command.hitPoints = fight.getSoldiers(defender,1)
                }
                else if (defender == 3)
                {
                    healer_command.hitPoints = fight.getSoldiers(defender, 1)
                }
                else if (defender == 4)
                {
                    mage_command.hitPoints = fight.getSoldiers(defender, 1)
                }
                else if (defender == 5)
                {
                    archer_command.hitPoints = fight.getSoldiers(defender, 1)
                }
            }

            fight.pickUnit()
        }
        onPicked:
        {
            if(index == 6 && fight.getSoldiers(0, 0)> 0)
            {
                var target = fight.giveRand();

                ogre_select.start()
                if(fight.getSoldiers(target, 1) > 0)
                {
                    fight.attack(0, target, 0);
                }
                else
                {
                    while(fight.getSoldiers(target, 1) <= 0)
                    {
                        target = fight.giveRand()
                    }
                    fight.attack(0, target, 0);
                }
                ogre.border.width = 0

            }
            else if(index < 6)
            {
                while(fight.getSoldiers(index, 1) <= 0)
                {
                    index = (fight.giveRand())
                }
                selected = index;
            }

        }

        //        onReady:
        //        {
        //            if (player)
        //            {
        //                if(index == 0)
        //                {

        //                }
        //            }
        //            else
        //            {
        //                if(index == 0)
        //                {
        //                    ogre.hitPoints = unit.getSol();
        //                    ogre.maxHP = unit.getSolMax();
        //                }
        //            }
        //        }
    }

    BattleScene
    {
        id: battle
        visible: false
        anchors.fill: parent
        Rectangle
        {
            id: strategyScene
            height: battle.height
            width: battle.width
            y: parent.y + parent.height *.5
            border.color: "black"
            border.width: 3

            Rectangle
            {
                //anchors.left: parent.left
                //anchors.right: parent.right
                id: rect_enemies
                height: parent.height*.5
                width: parent.width*.5
                color: "yellow"
                Unit{
                    //                    z:parent.z +2
                    //                    color: "transparent"
                    //                    x: parent.x
                    //                    y: parent.y
                    height: parent.height
                    width: parent.width
                    id: ogre
                    portrait: "qrc:Images/Ogre.png"
                    unitName: "Ogre"
                    hitPoints: fight.getSoldiers(0, 0)
                    maxHP: fight.getSoldiers(0, 0);
                    border.width: 20
                    Timer{
                        id: ogre_select
                        interval: 500
                        repeat: false
                        onTriggered:
                        {
                            //ogre.border.color = "transparent"
                            ogre_select.stop()
                        }
                        onRunningChanged:
                        {
                            //                            if(ogre.border.color != "red")
                            //                            {
                            if(ogre.border.color == "black")
                            {
                                ogre.border.color = "red"
                            }
                            else
                            {
                                ogre.border.color = "black"
                            }

                            //                            }
                            //                            else
                            //                            {
                            //                                ogre.border.color == "transparent"
                            //                            }
                        }
                    }

                    MouseArea{
                        //color: "transparent"
                        anchors.fill: ogre
                        hoverEnabled: true
                        onHoveredChanged: {
                            if(containsMouse)
                            {
                                ogre.opacity = 1
                            }
                            else
                            {
                                ogre.opacity = 1/1.6
                            }
                        }

                        onClicked:{
                            fight.attack(selected, 0, 1);
                        }
                    }
                }
            }
            Rectangle
            {
                id: rect_player
                x: parent.x + parent.width *.5
                height: strategyScene.height*.5
                width: strategyScene.width * .5
                color: "blue"
                Row{
                    id: row_allies
                    //                    x: parent.x
                    //                    y: parent.y
                    //                    z: ogre.z
                    //                    height: parent.height
                    //                    width: parent.width
                    spacing: 20
                    Column{
                        spacing : 10
                        Unit{
                            id: sabre_command
                            x: parent.x
                            y: parent.y
                            z: 20
                            height: rect_player.height * .3
                            width: rect_player.width * .45
                            portrait: "qrc:Images/saber.png"
                            unitName: "Sabre"
                            hitPoints: fight.getSoldiers(0,1)
                            maxHP: fight.getSoldiers(0, 1);

                        }
                        Unit{
                            id:night_command
                            y: sabre_command.y + sabre_command.height
                            z:21
                            //                            anchors.top: sabre_command.bottom
                            //                            anchors.horizontalCenter: sabre_command.horizontalCenter
                            height: rect_player.height * .3
                            width: rect_player.width * .45
                            portrait: "qrc:Images/knight.png"
                            unitName: "Death Knight"
                            hitPoints: fight.getSoldiers(1, 1)
                            maxHP: fight.getSoldiers(1, 1);

                        }
                        Unit{
                            id: ninja_command
                            //                            anchors.top: night_command.bottom
                            //                            anchors.horizontalCenter: sabre_command.horizontalCenter
                            height: rect_player.height * .3
                            width: rect_player.width * .45
                            portrait: "qrc:Images/ninja.png"
                            unitName: "Anti-Love"
                            hitPoints: fight.getSoldiers(2, 1)
                            maxHP: fight.getSoldiers(2, 1);

                        }
                    }
                    Column{
                        spacing: 10
                        Unit{
                            id: healer_command
                            height: rect_player.height * .3
                            width: rect_player.width * .45
                            portrait: "qrc:Images/healer.png"
                            unitName: "Moon Sticks!"
                            hitPoints: fight.getSoldiers(3,1)
                            maxHP: fight.getSoldiers(3,1);

                        }
                        Unit{
                            id: mage_command
                            height: rect_player.height * .3
                            width: rect_player.width * .45
                            portrait: "qrc:Images/magician.png"
                            unitName: "Kurama"
                            hitPoints: fight.getSoldiers(3,1)
                            maxHP: fight.getSoldiers(3,1);

                        }
                        Unit{
                            id: archer_command
                            height: rect_player.height * .3
                            width: rect_player.width * .45
                            portrait: "qrc:Images/archer.png"
                            unitName: "Abigaile"
                            hitPoints: fight.getSoldiers(3,1)
                            maxHP: fight.getSoldiers(3,1);

                        }
                    }
                }


            }
        }

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
            //autoPlay: !globalSettings.showSplash == (true)? true: false
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
            Component.onCompleted: {
                if(globalSettings.showSplash)
                {
                    video_opening.play()
                }
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


    Rectangle
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
                fight.pickUnit();
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
