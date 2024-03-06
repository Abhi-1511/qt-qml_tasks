import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:abc
    width: 640
    height: 480
    visible: true
    title: qsTr("thirdtask")
    color: "blue"
    property int dclick: 0

        MouseArea{
            anchors.fill: parent
            onClicked: {
                dclick++;


        if(dclick==2){
            mainrect.width=parent.width/8;
            dclick=0;
        }
        }
    }
    Rectangle{
        id: mainrect
        width: parent.width/8
        height: width*1.5
        color: "white"
    }
    Rectangle{
        id: increase
        width: abc.width/6
        height: abc.height/4
        color: "green"
        anchors.bottom: parent.bottom
        Text {
            anchors.centerIn: parent
            text: qsTr("increase")
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(mainrect.width+10<=200){
                    mainrect.width=mainrect.width+10
                }
            }
        }
    }
    Rectangle{
        id: decrese
        width: abc.width/6
        height: abc.height/4
        color: "red"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        Text {
            anchors.centerIn: parent
            text: qsTr("decrease")
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(mainrect.width-10>=50){
                    mainrect.width=mainrect.width-10
                }
            }
        }
    }
    }

//size
