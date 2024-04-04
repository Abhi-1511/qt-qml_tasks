import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

Item {
    width: mainwindowid.width/3.5
    height: mainwindowid.height*0.7
    property int firstvalue:0
    property int secondvalue:0
    property int xval:0
    property int yval:0
    property int fromvalue:0
    property int tovalue:0
    property string textheading:""
    x:xval
    y:yval

    Text {
        id: toptextid
        text: textheading
        color:"white"
        font.bold:true
        anchors.horizontalCenter: parent.horizontalCenter
        font.pointSize: 15
    }
    RangeSlider {
        id: control
        first.value: firstvalue
        second.value: secondvalue
        from:fromvalue
        to:tovalue
        orientation: Qt.Vertical
        anchors.centerIn: parent
        first.onMoved: {
            firstvalue=first.value
        }
        second.onMoved: {
            secondvalue=second.value
        }
        Rectangle {
            x: control.leftPadding + control.availableWidth / 2 - width / 2
            y: control.topPadding + control.second.visualPosition * (control.availableHeight - height/8)
            implicitWidth: 20
            implicitHeight: (control.first.visualPosition - control.second.visualPosition) * control.availableHeight
            width: implicitWidth
            height: implicitHeight
            radius: 5
            color: "#21be2b"
        }
        background: Rectangle {
            x: control.leftPadding + control.availableWidth / 2 - width / 2
            y: control.topPadding
            implicitWidth: 20
            implicitHeight: 280
            width: implicitWidth
            height: control.availableHeight
            radius: 5
            color: "#bdbebf"
        }

        first.handle: Rectangle {
            x: control.leftPadding + control.availableWidth / 2 - width / 2
            y: control.topPadding + control.first.visualPosition * (control.availableHeight - height)
            implicitWidth: 26
            implicitHeight: 26
            radius: 13
            color: control.first.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"
            Text {
                id: ltext
                anchors.centerIn: parent
                text: "L"
                color:"blue"
                font.bold:true
            }

            Rectangle{
                width:30
                height:30
                anchors.left:parent.left;anchors.leftMargin:50
                color:"white"
                border.width:2
                border.color: "black"
                Text {
                    id: firstval
                    anchors.centerIn: parent
                    text:firstvalue
                    color:"black"
                }
            }
        }


        second.handle: Rectangle {
            x: control.leftPadding + control.availableWidth / 2 - width / 2
            y: control.topPadding + control.second.visualPosition * (control.availableHeight - height)
            implicitWidth: 26
            implicitHeight: 26
            radius: 13
            color: control.second.pressed ? "#f0f0f0" : "#f6f6f6"
            border.color: "#bdbebf"
            Text {
                id: htext
                anchors.centerIn: parent
                text: "H"
                color:"red"
                font.bold:true
            }
            Rectangle{
                width:30
                height:30
                anchors.right:parent.right;anchors.rightMargin:50
                color:"white"
                border.width:2
                border.color: "black"
                Text {
                    id: secondval
                    anchors.centerIn: parent
                    text: secondvalue
                    color:"black"
                }
            }
        }
    }
    Rectangle{
        id:rectfordisable
        width:parent.width
        height:parent.height
        anchors.centerIn: parent
        color:"gray"
        opacity:1
        visible:false
    }
}
