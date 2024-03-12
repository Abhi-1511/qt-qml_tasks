import QtQuick 2.15
import QtQuick.Window 2.15


Window {
    id:abcd
    visible: true
    width: 640
    height: 480
    title: qsTr("TextInput Element Demo")

    Row {
        id:rowid
        x : parent.width/3; y : parent.height/2
        spacing:parent.width/64


        Rectangle {
            id : rectid
            width : textid.implicitWidth + 20
            height: textid.implicitHeight + 20
            color : "beige"
            border.color:"black"
            border.width:2
            Text {
                id : textid
                anchors.centerIn: parent
                text : "Name :"
            }
        }

        Rectangle {
            id : rectid2
            color : "beige"
            width: textid2.implicitWidth  + 20
            height: textid2.implicitHeight + 20
            border.color:"black"
            border.width:2
            TextInput {
                id : textid2
                anchors.centerIn: parent
                focus: true
                text : "Type in your name"
                maximumLength: abcd.width/12

                onTextChanged: {
                        console.log("Current input: " + text)
                    textid3.text=text
                    }
                onEditingFinished: {
                    console.log("The name changed to :"+ text)
                }

            }


        }

   }
    Rectangle{
        id:rect3
        anchors.top:rowid.bottom
        anchors.topMargin: parent.width/64
        x : parent.width/2.5
        width : textid3.implicitWidth + 20
        height: textid3.implicitHeight + 20
        color : "beige"
        border.color:"black"
        border.width:2

        Text {
            id : textid3
            anchors.centerIn: parent
            text : "display field"
        }
    }
}
