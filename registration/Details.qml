import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    width: windowid.width
    height: windowid.height
    property bool passwordVisible: false
    property real progressBarValue: 0
    property bool wasEmpty: true
    signal gotologinpageagain()

    property string oname:""
    property string opassword:""
    property string oconfirmpassword:""
    property string oage:""
    property string ogender:""
    property var ohobii:""
    property string oworkexp:""
    property string oabout:""


    function welcometodetailspage() {
        visible = true
        console.log("details page");
    }
    function readData(dname,dpassword,dconfirmpassword,dage,dgen){
        oname=dname
        opassword=dpassword
        oconfirmpassword=dconfirmpassword
        oage=dage
        ogender=dgen
    }

    function readData2(dhobbi,dworkexp,dabout){
        ohobii=dhobbi.join(", ")
        oworkexp=dworkexp
        oabout=dabout
        console.log(ohobii)

    }
    //property string ab:""

    function handleModeChange(checked) {
            if (checked) {
                // Dark Mode
                loginfull.color = "black"
                detailedmid.color = "#212121"
                textid1.color = "black"
                textid2.color = "black"
                textid3.color="white"
                 textid4.color="black"
                 textid5.color="black"
                 textid6.color="black"
                 textid7.color="black"
                 textid8.color="black"
                 textid9.color="black"
                 textid10.color="black"
                 textid11.color="black"
                 textid12.color="black"
                 textid13.color="black"
                 textid14.color="black"
                 textid15.color="black"

                // genid.color = "lightgray"
                // hobid.color = "lightgray"
                // wei.color = "lightgray"
                // abtid.color = "lightgray"
                // textarearect.color = "lightgray"
                // abouttextfieldid.color = "white"
            } else {
                // Light Mode
                loginfull.color = "lightblue"
                detailedmid.color = "gray"
                textid1.color = "white"
                textid2.color = "white"
                textid3.color="white"
                 textid4.color="white"
                 textid5.color="white"
                 textid6.color="white"
                 textid7.color="white"
                 textid8.color="white"
                 textid9.color="white"
                 textid10.color="white"
                 textid11.color="white"
                 textid12.color="white"
                 textid13.color="white"
                 textid14.color="white"
                 textid15.color="white"


            }
        }


    Rectangle {
        id: loginfull
        width: parent.width
        height: parent.height
        color: "lightblue"

        Rectangle {
            id: detailedmid
            width: parent.width * 0.7
            height: parent.height * 0.9
            color: "gray"
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            border.width:2
            border.color:"black"
            radius:15

            Column {
                width: detailedmid.width
                height: detailedmid.height
                spacing: parent.height * 0.004

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    x: detailedmid.width / 3
                    Text {
                        id:textid3
                        text: "Personal Information"
                        font.pointSize: parent.width * 0.03
                        font.family: "Comic Sans MS"
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: detailedmid.width * 0.2
                    Rectangle {
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            id: textid2
                            text: "Name :"
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                    Rectangle {
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid4
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: oname
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                }

                // Add additional text beside the existing text for other rows
                // Adjust the text as needed

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: detailedmid.width * 0.2
                    Rectangle {
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            anchors.horizontalCenter: parent.horizontalCenter
                            id: textid1
                            text: "Password :"
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                    Rectangle {
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid5
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: opassword
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                }

                // Repeat the pattern for other rows

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: detailedmid.width * 0.2
                    Rectangle {
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid6
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "Age :"
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                    Rectangle {
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid7
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: oage
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                }

                // Repeat the pattern for other rows

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: detailedmid.width * 0.2
                    Rectangle {
                        id: genid
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid8
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "Gender :"
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                    Rectangle {
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid9
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: ogender
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                }

                // Repeat the pattern for other rows

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: detailedmid.width * 0.2
                    Rectangle {
                        id: hobid
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid10
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "Hobbies :"
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                    Rectangle {
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text{
                            id:textid11
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: ohobii
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                }

                // Repeat the pattern for other rows

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: detailedmid.width * 0.2
                    Rectangle {
                        id: wei
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid12
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "Experience :"
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                    Rectangle {
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid13
                            anchors.horizontalCenter: parent.horizontalCenter
                            text:oworkexp
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                }

                // Repeat the pattern for other rows

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: detailedmid.width * 0.2
                    Rectangle {
                        id: abtid
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid14
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "About :"
                            font.family: "Comic Sans MS"
                            font.pointSize: detailedmid.width / 42
                        }
                    }
                    Rectangle {
                        id: textarearect

                        height:  detailedmid.height * 0.18
                        color: "#978cbd"
                        width: detailedmid.width / 3.5


                        border.width:2
                        border.color:"black"
                        ScrollView {
                            width: parent.width
                            height: parent.height

                            TextArea {

                                id: abouttextfieldid
                                width:  detailedmid.width * 0.5
                                height: Math.max( detailedmid.height * 0.2, contentHeight)
                                font.pointSize:  detailedmid.width / 42
                                wrapMode: TextArea.Wrap
                                text:oabout

                            }
                        }
                    }

                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    x: detailedmid.width / 2.8

                    Rectangle {
                        y:detailedmid.height/12
                        width: detailedmid.width / 3.5
                        height: detailedmid.height * 0.05
                        color: "green"
                        border.width:2
                        border.color:"black"
                        Text {
                            id:textid15
                            anchors.horizontalCenter: parent.horizontalCenter
                            text: "OK"
                            font.pointSize: detailedmid.width / 42
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                gotologinpageagain()
                                detailsid.visible = false
                            }
                        }
                    }
                }
            }
        }
    }
}
