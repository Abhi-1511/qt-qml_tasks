import QtQuick 2.15

Rectangle {
    id:itemid1
    width:mainwindowid.width
    height:mainwindowid.height
    signal gotoopenscreen()
    signal gotoopenscreenlock()

    Open_screen{
    enabled:false
    Rectangle{
        width:parent.width
        height:parent.height
        color:"white"
        opacity:0.1
    }
    }

    Rectangle{
        width:parent.width/3
        height:parent.height/3
        color:"lightblue"
        border.width:2
        border.color: "red"
        anchors.centerIn: parent
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top;anchors.topMargin: 20
            text: qsTr("Do you want to lock?")
            font.pointSize: 22
        }
        Rectangle {
            id: confirmRect
            width: parent.width * 0.4
            height: parent.height * 0.2
            color: "green"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            anchors.left: parent.left;anchors.leftMargin: 20
            Text {
                anchors.centerIn: parent
                text: "Confirm"
                color: "white"
                font.pointSize: 15
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    // Add your confirm action here
                    console.log("Confirm clicked")
                    gotoopenscreenlock()
                }
            }
        }
        Rectangle {
            id: cancleRect
            width: parent.width * 0.4
            height: parent.height * 0.2
            color: "gray"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            anchors.right: parent.right;anchors.rightMargin: 20

            Text {
                anchors.centerIn: parent
                text: "Cancel"
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
