import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:windowid
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    property int count: 0
    Rectangle{
        id:rect
        anchors.centerIn: parent
        width:textid.implicitWidth + parent.width/10
        height:textid.implicitHeight + parent.height/10
        color:"red"
        signal say(int message)
        onSay: {
            console.log("the number of clicks is :"+count)

        }

        Text {

            anchors.centerIn: parent
            id: textid
            text: count
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                count+=1
                textid.text=count
                if(count % 10===0){
                    //console.log("the number of clicks is :"+count)
                   rect.say(count)
                }
            }
        }


    }
}
