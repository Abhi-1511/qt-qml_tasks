import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Rectangle {
        id:abc
        color:"red"
        width:displayid.implicitWidth
        height:displayid.implicitHeight
        anchors.centerIn: parent
        Text{
            id:displayid
            anchors.centerIn: parent
            text:"click me :)"
            font.pointSize: 20
        }
        MouseArea{
            anchors.fill:parent
            onClicked: {
              //abc.width=abc.width+3;
              //abc.height=abc.height+3;
              displayid.font.pointSize= displayid.font.pointSize+0.5;
            }
        }
    }
}
//implicitwidth
