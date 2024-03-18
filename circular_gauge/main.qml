import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    color: "lightblue"

    Rectangle {
        focus: true
        width: parent.width *0.8
        height: parent.height * 0.8
        anchors.centerIn: parent
        color: "black"
        Keys.onPressed: {
                if (event.key === Qt.Key_Up && gauge.value < gauge.maximumValue) {
                    gauge.value=gauge.value+5
                    //console.log("up")
                } else if (event.key === Qt.Key_Down && gauge.value > 0) {
                    gauge.value=gauge.value-5
                    //console.log("down")
                } else if(event.key===Qt.Key_Space){
                    gauge.value=0
                }
            }
        Rectangle {
            id: plusrectid
            width: parent.width / 3
            height: parent.height * 0.1
            color: "green"
            anchors.right: parent.right; anchors.rightMargin: parent.width / 8
            anchors.top: parent.top; anchors.topMargin: parent.height * 0.6
            radius: 20
            border.color: "black"
            border.width: 2
            Text {
                anchors.centerIn: parent
                id: plus
                text: qsTr("+")
                font.pointSize: parent.width / 6
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (gauge.value < gauge.maximumValue)
                        gauge.value = gauge.value + 5
                }
            }
        }
        Rectangle {
            id: minusrectid
            width: parent.width / 3
            height: parent.height * 0.1
            color: "red"
            anchors.right: parent.right; anchors.rightMargin: parent.width / 8
            anchors.bottom: plusrectid.top; anchors.bottomMargin: plusrectid.height * 0.3
            radius: 20
            border.color: "black"
            border.width: 2
            Text {
                anchors.centerIn: parent
                id: minus
                text: qsTr("-")
                font.pointSize: parent.width / 6
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    if (gauge.value > 0)
                        gauge.value = gauge.value - 5
                }
            }
        }
        Rectangle {
            id: displayrectid
            width: parent.width / 3
            height: parent.height * 0.1
            color: "lightblue"
            anchors.right: parent.right; anchors.rightMargin: parent.width / 8
            anchors.bottom: minusrectid.top; anchors.bottomMargin: minusrectid.height * 0.3
            radius: 20
            border.color: "black"
            border.width: 2
            Text {
                anchors.centerIn: parent
                id: valueid
                text: gauge.value.toFixed(0)
                font.pointSize: parent.width / 6
            }
        }
        Button {
            text: "Reset"
            width: parent.width / 3
            height: parent.height * 0.1
            anchors.bottom: displayrectid.top;anchors.bottomMargin: 5
            anchors.right: displayrectid.right
            onClicked: gauge.value = 0
        }



        CircularGauge {
            id: gauge
            anchors.left:parent.left;anchors.leftMargin: 20
            anchors.verticalCenter: parent.verticalCenter
            //anchors.margins: 50
            //stepSize: 20
            value: 0
            minimumValue: 0
            maximumValue: 120
            Behavior on value {
                NumberAnimation {
                    duration: 1000
                }
            }
        }
    }
}
