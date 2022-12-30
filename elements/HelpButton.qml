// TopButtons.qml
import QtQuick 2.14

Rectangle {
    id: helpButton
    width: 15
    height: 15
    color: "#F5D173"
    radius: 10
    anchors.left : parent.left
    anchors.top: parent.top
    anchors.topMargin: 20
    //add padding of 10 
    anchors.leftMargin: 45
    //add text with 'x'
    //Add icon with /icons/close-icon.svg
    Image{
        id: closeIcon
        anchors.centerIn: parent
        source: ""
        width: 7 
        height: 7 
        fillMode: Image.PreserveAspectFit
        opacity: 0.5
    }
    //add mouse area to close button
    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            Qt.quit()
        }
        onEntered: {
            //add text with 'x'
            closeIcon.source = "../icons/question.svg"

        }
        onExited: {
        closeIcon.source = ""
        }
    }
}