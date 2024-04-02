import QtQuick 2.15

Rectangle {
    id:itemid1
    width:mainwindowid.width*0.7
    height:mainwindowid.height/2
    anchors.centerIn: parent
    color:"transparent"
    signal gotoopenscreen()

    Rectangle{
        width:parent.width
        height:parent.height
        color:"black"
        border.width:5
        border.color: "red"

        radius:15

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top;anchors.topMargin: 20
            text: qsTr("FiO2 Sensor Calibration")
            font.pointSize: 22
            color: "#2FD622"
            font.bold:true
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top:parent.top;anchors.topMargin: 100
            text: qsTr("FiO2 Value : 3.6")
            font.pointSize: 18
            color: "white"
            font.bold:true
        }
        Rectangle {
            id: confirmRect
            width: parent.width * 0.2
            height: parent.height * 0.2
            color: "#2FD622"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            anchors.left: parent.left;anchors.leftMargin: 150
            radius:25
            Text {
                anchors.centerIn: parent
                text: "Continue"
                color: "white"
                font.pointSize: 15
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    console.log("Confirm clicked")
                    gotoopenscreen()
                }
            }
        }
        Rectangle {
            id: cancleRect
            width: parent.width * 0.2
            height: parent.height * 0.2
            color: "#B2D5F6"
            anchors.bottom: parent.bottom;anchors.bottomMargin: 20
            anchors.right: parent.right;anchors.rightMargin: 150
            radius:25

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
