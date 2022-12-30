import QtQuick 2.5
import QtQuick.Controls 2.5
import QtMultimedia 
import QtQuick.Window 2.2

import QtMultimedia 5.12
import Qt5Compat.GraphicalEffects


ApplicationWindow {
    id: timeline  
    visible: true
    width: 1050  
    height: 250  
    x: Screen.desktopAvailableWidth/2 - width/2
    y: Screen.desktopAvailableHeight/2 - height/2
    title: qsTr("Timeline")
    //make transparent
    color: "transparent"
    flags:  Qt.FramelessWindowHint  

    Rectangle {
        id: frame 
        width: parent.width 
        height: parent.height
        color: "#444444"
        radius: 16

        Rectangle {
            id: layersFrame 
            width: parent.width *0.2
            height: parent.height
            color: "#5F5F5F"
            radius: 16
            x: progressSlider.rightPadding
        }
        Rectangle {
            id: layersDivision
            width: 12 
            height: parent.height
            color: "#585757"
            x: progressSlider.rightPadding + parent.width *0.2 - width
        }
        Rectangle {
            id: layersDivisionVertical
            width: parent.width 
            height: 4 
            color: "#585757"
            x: progressSlider.leftPadding + parent.width *0.8  
            y: parent.height/2
            anchors.left: parent.left
        }

    Slider {// this is the playhead
                id:progressSlider
                width:parent.width * 0.8

                enabled: player.seekable
                value: player.duration > 0 ? player.position/player.duration: 0 
               
                background: Rectangle {
                x: progressSlider.rightPadding
                y: progressSlider.topPadding 
                //anchor to the bottom
                implicitWidth: 200
                implicitHeight: 4
                width: progressSlider.availableWidth
                height: implicitHeight
                radius: 2
                color: "transparent"
                opacity: 0.2

                }
                transform: Translate{
                    x: 200 
                    y: 0}

                // Rectangle {
                //     width: progressSlider.visualPosition * parent.width
                //     height: parent.height
                //     color: "#21be2b"
                //     radius: 2
                // }

                handle: Rectangle {
                id: playhead
                x: progressSlider.leftPadding + progressSlider.visualPosition * (progressSlider.availableWidth - width)
                y: progressSlider.topPadding + progressSlider.availableHeight / 2 - height / 2
                implicitWidth: 4
                implicitHeight: 1000
                color: "#E4B029"
                // border.color: "#E4B029"
                z: 5
                Rectangle{
                    id: playhead_indicator
                    width: 16 
                    height: 16 
                    x: 2 
                    y: -11
                    color: "#E4B029"
                    transform: Rotation{
                        //rotate 45 degrees
                        angle: 45
                    }
                }
    }
                onMoved: function(){
                    player.position = progressSlider.value * player.duration
                    // for all the objects of type video set selected to false
                    for (var i = 0; i < timeline.children.length; i++){
                        if (timeline.children[i].type == "video"){
                            timeline.children[i].selected = false
                            timeline.children[i].border.color = "transparent"
                            timeline.children[i].border.width = 0
                        }
                    }

                }

    }
    Column{
                anchors.centerIn: parent
                transform: Translate{
                    x: 0
                    y: clip.height * -1 /2 
                }
                //center in parent
                Rectangle{
                    // anchors.centerIn: parent
                    id: clip
                    //create type of clip 
                    property string type: "video"
                    //create a property name 
                    property string name: "SHOT_010"
                    property string audio_name: name + "_audio"
                    //center in parent
                    width: 300 
                    //add property boolen selected
                    property bool selected: false
                    height:  37 
                    
                    
                    color: "#6D9C57"
                    Text{
                        id: clip_text
                        text: clip.name 
                        //set font to "Inter"
                        font.family: "Inter"
                        anchors.centerIn: parent
                        color: "white"
                        font.pixelSize: 12 
                    }
                    //on mouse clicked toggle the selection property 
                    
                Rectangle{
                    // anchors.centerIn: parent
                    id: clip_audio
                    //center in parent
                    width: 300 
                    transform: Translate{
                        y:43
                    }
                    height:  37 
                    color: "#579C90"
                    Text{
                        id: clip_audio_text
                        text: clip.audio_name 
                        anchors.centerIn: parent
                        color: "white"
                        font.pixelSize: 12
                        font.family: "Inter"
                    }
                }

                    //create a mouse area to make the rectangle clickable
        MouseArea 
                {
                width: parent.width

                    // } 
                    height: 20 
                    property point pos
                    onPressed: { 
                        //if selected is false then turn selected on
                        if (clip.selected == false){
                            clip.selected = true
                            //add border red to clip
                            clip.border.color = "#E4B029"
                            clip.border.width = 2


                        }
                        else 
                        {
                            clip.selected = false
                            clip.border.color = "transparent"
                            clip.border.width = 0
                        }
                        pos = Qt.point(mouse.x, mouse.y) }
                    
                    onPositionChanged: 
                    {
                        var diff = Qt.point(mouse.x - pos.x, mouse.y - pos.y)

                        clip.x += diff.x

                    //    clip.y += (diff.y > frame.height/2) ? diff.y : 125 
                        // clip.y += diff.y
                    }
                }
                }

                
            
        onXChanged: update()
        onYChanged: update()

        }
                //change indicator to image 
        //anchors.centerIn: parent
        
        MouseArea 
        {
            // anchors.fill: parent
           width: parent.width

            // } 
            height: 20 
            anchors.top: parent.top 
            property point pos
            onPressed: { pos = Qt.point(mouse.x, mouse.y) }
            onPositionChanged: 
            {
                var diff = Qt.point(mouse.x - pos.x, mouse.y - pos.y)

                timeline.x += diff.x
                timeline.y += diff.y
            }
        }
    }
}
