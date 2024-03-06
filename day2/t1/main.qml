import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: abc
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")

    Item {
        id: itemmain
        //anchors.left:parent.left
        width:parent.width/2
        height:parent.height*0.15
        x:10

        Rectangle{
            width:parent.width
            height:parent.height
            color:"yellow"
        }

        Rectangle {
            id: a
            x: abc.width/64
            y: abc.height/48
            width: abc.width*0.2
            height: abc.height*0.1
            color: "red"
        }

        Rectangle {
            id: b
            x: abc.width/4
            y: abc.height/48
            width: abc.width*0.2
            height: abc.height*0.1
            color: "blue"
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {

                var newXa = itemmain.x + 20;

                if (newXa >= 0 && newXa + itemmain.x <= abc.width) {
                    itemmain.x = newXa;
                    console.log(itemmain.x)
                }


             }
        }
    }
}
//window innda acche ogbardu
//spacing alli click ,madidru work agbeku
