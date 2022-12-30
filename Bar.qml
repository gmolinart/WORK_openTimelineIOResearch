import QtQuick 2.5
import QtQuick.Controls 2.5
import QtMultimedia 
import 'elements' as Elements
import QtQuick.Window 2.2

import QtMultimedia 5.12
ApplicationWindow {
    id: videoPlayer
    visible: true
    width: 375 
    height: 70
    x: Screen.desktopAvailableWidth/2 - width/2
    y: Screen.desktopAvailableHeight/2 - height/2
    title: qsTr("Hello World")
    //make transparent
    color: "transparent"
    flags:  Qt.FramelessWindowHint  

    Rectangle {
        id: play_controls 
        width: parent.width 
        height: parent.height
        color: "#444444"
        radius: 16
        //disable shadow 

    

        //anchors.centerIn: parent
            Row{
                anchors.centerIn: parent
                //center in parent
                Rectangle{
                    // anchors.centerIn: parent
                    id: play_button
                    //center in parent
                    width: 50
                    height:  70 
                    color: "transparent"

                    //create a mouse area to make the rectangle clickable
                    Image{
                        id: play_image
                        source: "icons/play.png"
                        anchors.centerIn: parent
                        width: 20
                        height: 20
                    }
                    MouseArea{
                        anchors.fill: parent
                        //change the cursor on hover
                        hoverEnabled: true
                        height: 100
                        cursorShape: Qt.PointingHandCursor
                        transform: Translate{
                            y:-20
                        }
                        
                        
                        onClicked: {
                            console.log('play')
                            player.play()
                        }
                    }
                }
                Rectangle{
                    id: pause_button
                    //center in parent
                    width: 50
                    height: 70 
                    // color: "red"
                    color: "transparent"
                    //create a mouse area to make the rectangle clickable
                    Image{
                        id: pause_image
                        source: "icons/pause.png"
                        anchors.centerIn: parent
                        width: 20
                        height: 20
                    }
                    MouseArea{
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor
                        transform: Translate{
                            y:-20
                        }
                        onClicked: {
                            console.log('pause')
                            player.pause()
                        }
                    }
                }
            }
                // Button{
                //     id: pauseButton
                //     text: 'pause'
                //     onClicked: {
                //         //if the player is currently playing 
                //             console.log('pause')
                //             player.pause()
                //         }
                // }
            
        // }
            
        onXChanged: update()
        onYChanged: update()

        MouseArea 
        {
            // anchors.fill: parent
           width: parent.width

            // } 
            height: 20 
            property point pos
            onPressed: { pos = Qt.point(mouse.x, mouse.y) }
            onPositionChanged: 
            {
                var diff = Qt.point(mouse.x - pos.x, mouse.y - pos.y)

                videoPlayer.x += diff.x
                videoPlayer.y += diff.y
            }
        }
}
}