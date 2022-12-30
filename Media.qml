import QtQuick 2.5
import QtQuick.Controls 2.5
import QtMultimedia 
import 'elements' as Elements
import QtQuick.Window 2.2

ApplicationWindow {
    id: mediaWindow
    visible: true
    width: 800 
    height: 430 
    x: Screen.desktopAvailableWidth/2 - width/2
    y: Screen.desktopAvailableHeight/2 - height/2
    title: qsTr("Hello World")
    //make transparent
    color: "transparent"
    flags:  Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint

    Bar{
        id: bar
        y: 1000
    }
    Elements.Timeline{
        id: timeline
        y: 800
    }
    Rectangle {
        id: video 
        width: parent.width 
        height: parent.height 
        color: "#444444"
        radius: 16
        //disable shadow 

        function update() {
            console.log(x + " x " + y)
        }

        //anchors.centerIn: parent
        MediaPlayer{
            id: player
            source: "000_0340_anim.mp4"
            videoOutput:videoOutput
            audioOutput:audioOutput
            //loop 
             onPositionChanged: {
        if (player.position > 250 && player.duration - player.position < 250) {
            player.pause();
        }
        }
           
    }   


    Column{
        width: parent.width 
        height: parent.height 
        //center in parent
        anchors.centerIn: parent
        Text {
            id: label_2 
            text: qsTr("Indeleble")
            color: 'white'
            anchors.fill:parent
            // anchors.top: parent.top
            //center text justified center
            horizontalAlignment: Text.AlignHCenter

            anchors.horizontalCenter: parent.horizontalCenter
            transform:Translate{
                x: 0
                y: 10}
            }
            

        }
        VideoOutput{
            id: videoOutput
            anchors.fill: parent
            // anchors.centerIn: parent
            //add margin 20  top and bottom
            // anchors.margins: 20
            //fillMode: VideoOutput.PreserveAspectFit
            transform:Translate{
                x: 0
                y: 0
            }

            }
        AudioOutput{
            id:audioOutput
            volume: volumeSlider.value
            }
       
        // Slider {
        //     id:progressSlider
        //     width:parent.width
        //     enabled: player.seekable
        //     value: player.duration > 0 ? player.position/player.duration: 0 
        //     // background: {
        //     //     Rectangle: {
        //     onMoved: function(){
        //         player.position = progressSlider.value * player.duration

        //     }
        //     transform:Translate{
        //         x: 0
        //         y: 450}

        //     }

        Component.onCompleted:{
         update()
        }
            
        onXChanged: update()
        onYChanged: update()

    }
        MouseArea 
        {
            // anchors.fill: parent
            width: parent.width

            // } 
            height: 50
            property point pos
            onPressed: { pos = Qt.point(mouse.x, mouse.y) }
            onPositionChanged: 
            {
                var diff = Qt.point(mouse.x - pos.x, mouse.y - pos.y)
               mediaWindow.x += diff.x
                mediaWindow.y += diff.y
            }
        }
    }
