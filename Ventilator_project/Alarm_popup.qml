import QtQuick 2.15

Item {
    id:itemid1
    width:mainwindowid.width
    height:mainwindowid.height
    signal gotoopenscreen()
    Open_screen{
        enabled:false
        Rectangle{
            width:parent.width
            height:parent.height
            color:"lightblue"
            opacity:0.002
        }
    }
    // function g(){
    //     itemid1.visible=true
    //     itemid1.enabled=true
    // }

    Rectangle{
        width:parent.width*0.8
        height:parent.height*0.75
        color:"#9FBADF"
        border.width:10
        border.color: "#4A67A1"
        anchors.left: parent.left;anchors.leftMargin:80
        anchors.top:parent.top;anchors.topMargin: 50

        Rectangle{
            width:parent.width*0.6
            height:parent.height*0.1
            color:"#4A67A1"
            anchors.top: parent.top;anchors.topMargin: 210
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                anchors.centerIn: parent
                text: qsTr("9:20AM Low Presure ")
                font.pointSize: 22
                color: "white"
                font.bold:true
            }
        }
        Rectangle{
            width:parent.width*0.6
            height:parent.height*0.1
            color:"#4A67A1"
            anchors.top: parent.top;anchors.topMargin: 270
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                anchors.centerIn: parent
                text: qsTr("9:20AM Low Presure ")
                font.pointSize: 22
                color: "white"
                font.bold:true
            }
        }
        Rectangle{
            width:parent.width*0.6
            height:parent.height*0.1
            color:"#4A67A1"
            anchors.top: parent.top;anchors.topMargin: 150
             anchors.horizontalCenter: parent.horizontalCenter
            Text {
                anchors.centerIn: parent
                text: qsTr("9:20AM Low Presure ")
                font.pointSize: 22
                color: "white"
                font.bold:true
            }
        }
        Rectangle{
            width:parent.width*0.6
            height:parent.height*0.1
            color:"#4A67A1"
            anchors.top: parent.top;anchors.topMargin: 30
             anchors.horizontalCenter: parent.horizontalCenter
            Text {
                anchors.centerIn: parent
                text: qsTr("9:20AM Low Presure ")
                font.pointSize: 22
                color: "white"
                font.bold:true
            }
        }
        Rectangle{
            width:parent.width*0.6
            height:parent.height*0.1
            color:"#4A67A1"
            anchors.top: parent.top;anchors.topMargin: 90
             anchors.horizontalCenter: parent.horizontalCenter
            Text {
                anchors.centerIn: parent
                text: qsTr("9:20AM Low Presure ")
                font.pointSize: 22
                color: "white"
                font.bold:true
            }
        }
        Rectangle {
            id: cancleRect
            width: parent.width * 0.3
            height: parent.height * 0.1
            color: "#4A67A1"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            anchors.right: parent.right;anchors.rightMargin: 50
            radius:25

            Text {
                anchors.centerIn: parent
                text: "Clear"
                color: "white"
                font.pointSize: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Cancle clicked")
                    gotoopenscreen()
                }
            }
        }

    }


}
