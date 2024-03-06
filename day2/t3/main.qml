import QtQuick 2.15
import QtQuick.Window 2.15
signal rightClicked()

Window {
    id:abcd
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    MouseArea{
        anchors.fill:parent
        onClicked: {
            abcd.color="white"
        }
    }

    Row{
        id:xyz
        spacing: 20
        anchors.centerIn: parent


        Batch{
           // x:50;y:100
            buttonText: "red"
            buttoncol: "red"
            onButtonClicked: {
                abcd.color="red";
            }
        }
        Batch{
            //x:100;y:100
            buttonText: "blue"
            buttoncol:"blue"
            onButtonClicked: {
                abcd.color="blue";
            }
        }
        Batch{
            //x:150;y:100
            buttonText: "green"
            buttoncol:"green"
            onButtonClicked: {
                abcd.color="green";
            }
        }
        Batch{
            //x:200;y:100
            buttonText: "yellow"
            buttoncol:"yellow"
            onButtonClicked: {
                abcd.color="yellow";
            }
        }
        Batch{
            //x:250;y:100
            buttonText: "orange"
            buttoncol:"orange"
            onButtonClicked: {
                abcd.color="orange";
            }
        }

    }
}
//backgroud white border
