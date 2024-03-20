import QtQuick 2.15

Item {
    id:displayid
    width: 840
    height: 420
    property int lleft:0
    property int ileft:0
    property int rright:0
    property int iright:0

    property int lleft1:0
    property int ileft1:0
    property int rright1:0
    property int iright1:0
    // property int mid:0
    // property int midbelow:0



    function g(lleft1,ileft1,rright1,iright1){
        lleft=lleft1
        ileft=ileft1
        rright=rright1
        iright=iright1
    }

    Rectangle {
        id: rectvisi
        width:840
        height:420
        visible: true
        anchors.horizontalCenter: parent.horizontalCenter
        color:"white"



        Column {

            spacing: 10
            padding: 20
            anchors.horizontalCenter: parent.horizontalCenter


            Row {
                spacing: 10
            Text {
                text: "Received Details"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 20
            }
            }

            Row {
                spacing: 10
                Text {
                    text: "left value:"
                    font.pointSize: 20
                }
                Text {
                    text: lleft
                    font.pointSize: 20
                }
            }

            Row {
                spacing: 10
                Text {
                    text: "i_left value:"
                    font.pointSize: 20
                }
                Text {
                    text: ileft
                    font.pointSize: 20
                }
            }

            Row {
                spacing: 10
                Text {
                    text: "right value"
                    font.pointSize: 20
                }
                Text {
                    text: rright
                    font.pointSize: 20
                }
            }

            Row {
                spacing: 10
                Text {
                    text: "i_right value:"
                    font.pointSize: 20
                }
                Text {
                    text: iright
                    font.pointSize: 20
                }
            }

            Row {
              Rectangle{
                  anchors.topMargin: 20
                  width:backb.implicitWidth+20
                  height:backb.implicitHeight+20
                  color:"green"
                  Text {
                      anchors.centerIn: parent
                      id: backb
                      text: qsTr("Back")
                      font.pointSize: 20
                  }
                  MouseArea{
                      anchors.fill:parent
                      onClicked: {
                          displayid.visible=false
                          rectcomponent.visible=true
                      }
                  }
              }
            }
        }


        }
    }




