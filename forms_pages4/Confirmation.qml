import QtQuick 2.15

Item {
    id:abc
    width: 800
    height: 600
    property string ffnamesend: ""
    property string llnamesend: ""
    property string aagessend: ""
    property string mmobsend: ""
    //property string eemailidsend: ""
    //property string ggendersend: ""

    function g(fname, lname, ages, mob){
        ffnamesend = fname
        llnamesend = lname
        aagessend = ages
        mmobsend = mob
        visible = true
        //eemaildsend = emailid
        //ggendersend = gender
    }

    Rectangle {
        id: rectvisi
        border.color: "black"
        border.width: 15
        width:800
        height:600
        visible: true

        //property bool conformationPageVisible: true
        anchors.horizontalCenter: parent.horizontalCenter
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }
            GradientStop { position: 1.0; color: "#497fd6" }
        }



        Column {
            //anchors.fill: parent
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
                    text: "First Name:"
                    font.pointSize: 20
                }
                Text {
                    text: ffnamesend
                    font.pointSize: 20
                }
            }

            Row {
                spacing: 10
                Text {
                    text: "Last Name:"
                    font.pointSize: 20
                }
                Text {
                    text: llnamesend
                    font.pointSize: 20
                }
            }

            Row {
                spacing: 10
                Text {
                    text: "Age:"
                    font.pointSize: 20
                }
                Text {
                    text: aagessend
                    font.pointSize: 20
                }
            }

            Row {
                spacing: 10
                Text {
                    text: "Mobile:"
                    font.pointSize: 20
                }
                Text {
                    text: mmobsend
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
                      id: backb
                      text: qsTr("Back")
                      font.pointSize: 20
                  }
                  MouseArea{
                      anchors.fill:parent
                      onClicked: {
                          rectvisi.visible=false
                      }
                  }
              }
            }
        }


        }
    }




