import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
Window {
    id:abc
    width: 640
    height: 480
    visible: true
    title: qsTr("second_task")
    color: "blue"
    property var acol: white
    property string atext: "click and then see"
        Row{
            id: row1
            anchors.centerIn: parent
            spacing: 20

            Rectangle{
                id: orangeRect
               width: abc.width/6; height:abc.height/4
                color: "orange"; radius: 300
               Text {
                   text:"orange"
                   anchors.centerIn: parent
                   font.pointSize: orangeRect.width/6
               }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log("I am orange")
                        acol= "orange"
                        atext="orange"
                    }
                }
            }
            Rectangle{
                id: whiteRect
                width: abc.width/6; height:abc.height/4
                color: "green"; radius: 300
                Text {
                    text:"green"
                    anchors.centerIn: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log("I am green")
                        acol= "green"
                        atext="green"
                    }
                }
            }
            Rectangle{
                id: greenRect
                width: abc.width/6; height:abc.height/4
                color: "red"; radius: 300
                Text {
                    text:"red"
                    anchors.centerIn: parent
                }
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        console.log("I am red")
                        acol= "red"
                        atext="red"
                    }
                }
            }
            Rectangle{
                id: allRect
                width: abc.width/6; height:abc.height/4
                color: acol
                Text {
                    text:atext
                    anchors.centerIn: parent
                }

            }
        }

        }

//property binding
