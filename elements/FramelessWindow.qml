import QtQuick 
import QtQuick.Controls 
import QtQuick.Controls.Material
// import "closeButton.qml" as CloseButton 

ApplicationWindow {
    visible: true
    //force dark theme
    width: 800
    height: 700
    flags: Qt.FramelessWindowHint
    color: 'transparent'
    //add a stroke  of 2px 


    //set minimum window size
    minimumWidth: 640
    minimumHeight: 680

    Rectangle
    {
        id: rootWindow
        opacity:1
        color: "#555555"
        radius: 25
        anchors.fill:parent
        border.color: "grey" 
        border.width: 1 
 
    MouseArea 
    {
        anchors.fill: parent
        property point pos
        onPressed: { pos = Qt.point(mouse.x, mouse.y) }
        onPositionChanged: 
        {
            var diff = Qt.point(mouse.x - pos.x, mouse.y - pos.y)
            ApplicationWindow.window.x += diff.x
            ApplicationWindow.window.y += diff.y
        }
    }
   
    }
}