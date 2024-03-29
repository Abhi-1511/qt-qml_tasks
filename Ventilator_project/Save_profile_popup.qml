import QtQuick 2.15
import QtQuick.Controls 2.15
Rectangle {
    id:itemid1
    width:mainwindowid.width
    height:mainwindowid.height
    signal gotoopenscreen()

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
        width:parent.width/2.5
        height:parent.height/2.5
        color:"lightblue"
        border.width:2
        border.color: "red"
        anchors.centerIn: parent
        Text {
            id: headingid
            anchors.top:parent.top;anchors.topMargin: 20
            anchors.horizontalCenter: parent.horizontalCenter
            text: qsTr("Select the profile you want to delete.")
        }
        Text{
            anchors.top:parent.top;anchors.topMargin: 80
            anchors.left: parent.left;anchors.leftMargin: 100
            id:deletetext
            text:"Profile Name : "
        }

    TextField {
            id: comboBox
            anchors.left:deletetext.right;anchors.leftMargin: 10
            anchors.top:parent.top;anchors.topMargin: 70
            width: 150
            height:30
            placeholderText: "Default"
        }
    Rectangle {
        id: confirmRect
        width: parent.width * 0.4
        height: parent.height * 0.2
        color: "green"
        anchors.bottom: parent.bottom;anchors.bottomMargin: 20
        anchors.left: parent.left;anchors.leftMargin: 20
        radius:15
        border.width:2
        border.color:"black"
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
                gotoopenscreen()
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
        radius:15
        border.width:2
        border.color:"black"
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
