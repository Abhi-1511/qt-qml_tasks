import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    id: registration2pageid // Assigning ID to the Item
    width: windowid.width
    height: windowid.height
    property bool passwordVisible: false
    property real progressBarValue2: 50
    signal gotoPopuppage()
    signal backtoregistration1()
    property int checkBoxCounter: 0
    property var hobbi: []
    property string workexp: ""
    property string abouttext: ""
    property var hob: ""
    property var checkboxItems: []
    property var cc:[]
    function extractAndSendData() {
        var checkedHobbies = [];
        for (var i = 0; i < checkboxItems.length; ++i) {
            var checkboxItem = checkboxItems[i];
            if (checkboxItem.checked) {
                checkedHobbies.push(checkboxItem.text);
            }
        }
        cc=checkedHobbies
    }


    // function checkBoxCheckedChanged(checked, hobby) {
        // if (checked && progressBarValue2 % 100 === 50) {
        //     progressBarValue2 += 16;
    //         if (!hobbi.includes(hobby)) {
    //             hobbi.push(hobby); // Add the hobby if it's not already in the list
    //         }
        // } else if (!checked && progressBarValue2 % 100 === 66) {
        //     progressBarValue2 -= 16;
    //         var index = hobbi.indexOf(hobby);
    //         if (index !== -1) {
    //             hobbi.splice(index, 1); // Remove the hobby from the list
    //         }
    //     }
    // }

    function uncheckAllCheckboxes() {
        for (var i = 0; i < checkboxItems.length; ++i) {
            var checkboxItem = checkboxItems[i];
            checkboxItem.checked = false;
        }
    }


    function register2() {
        visible = true
        console.log("Registration2 completed");
    }

   signal sendData2(var checkedHobbies, string workexp, string abouttext)
    function null2() {
        abouttextfieldid.text = ""
        spinBox.value = 0
        progressBarValue2 = 50
        uncheckAllCheckboxes();
        hobbi=[]
    }

    function handleModeChange(checked) {
        if (checked) {
            // Dark Mode
            registration2.color = "black"
            registrationmid.color = "#2f2f2f"
            headingid.color = "#2f2f2f"
            hobbieid.color = "#2f2f2f"
            workexpid.color = "black"
            aboutrectid.color = "black"
            textarearect.color = "black"
            abouttextfieldid.color = "white"
            textid1.color = "white"
            textid2.color = "white"
            //textid3.color = "white"
            textid4.color = "white"
            textid5.color = "white"
            textid6.color = "white"
            textid7.color = "black"
             hobids.color="black"
            recty.color = "#2f2f2f"
            backrect.color="black"
            backtext.color="white"
        } else {
            // Light Mode
            registration2.color = "lightblue"
            registrationmid.color = "gray"
            headingid.color = "gray"
            hobbieid.color = "gray"
            hobids.color="#978cbd"
            workexpid.color = "#978cbd"
            aboutrectid.color = "#978cbd"
            textarearect.color = "#978cbd"
            abouttextfieldid.color = "black"
            textid1.color = "black"
            textid2.color = "black"
            textid4.color = "black"
            textid5.color = "black"
            textid6.color = "black"
            textid7.color = "green"
            recty.color = "gray"
            backrect.color="lightblue"
            backtext.color="black"

        }
    }

    Rectangle {
        id: registration2
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "lightblue"

        Rectangle {
            id: registrationmid
            width: parent.width * 0.5
            height: parent.height * 0.7
            color: "gray"
            anchors.centerIn: parent
            border.width: 2
            border.color: "black"
            radius: 15

            Rectangle {
                id: headingid
                width: parent.width * 0.9
                height: parent.height * 0.1
                color: "gray"
                anchors.left: parent.left; anchors.leftMargin: 7
                anchors.top: parent.top; anchors.topMargin: 3

                Text {
                    id:textid1
                    anchors.centerIn: parent
                    text: "Personal Information"
                    font.pointSize: parent.width * 0.05
                    font.family: "Comic Sans MS"
                }
            }

            Rectangle {
                id: hobbieid
                width: parent.width - parent.width * 0.2
                height: parent.height * 0.4
                anchors.left: parent.left; anchors.leftMargin: parent.width * 0.1
                anchors.top: headingid.bottom; anchors.topMargin: parent.width * 0.03
                color: "gray"

                Rectangle {
                    id:hobids
                    border.width: 2
                    border.color: "black"
                    width: registrationmid.width / 3
                    height: registrationmid.height * 0.1
                    color: "#978cbd"
                    anchors.left: parent.left

                    Text {
                        id:textid2
                        anchors.centerIn: parent
                        text: "Hobbies :"
                        font.family: "Comic Sans MS"
                        font.pointSize: registrationmid.width / 42
                    }
                }

                Column {
                    width: registrationmid.width / 3
                    height: registrationmid.height * 0.1
                    anchors.left: parent.left
                    anchors.leftMargin: parent.width * 0.1

                    /*Repeater {
                        id: repeater
                        model: ["Reading", "Gaming", "Cooking", "Sports"]

                        Row {
                            spacing: 1
                            Rectangle {
                                width: registrationmid.width / 10
                                height: registrationmid.height * 0.1
                                border.color: checkBox.hovered ? "black" : "transparent"
                                color: checkBox.hovered ? "#F0F0F0" : "transparent"

                                CheckBox {
                                    id: checkBox
                                    anchors.fill: parent
                                    text: modelData
                                    font.pointSize: registrationmid.width / 50

                                    // Connect each CheckBox to the checkBoxCheckedChanged function
                                    onCheckedChanged: checkBoxCheckedChanged(checked, modelData)
                                }
                            }
                            Text {
                                text: modelData
                                font.pointSize: registrationmid.width / 50
                                anchors.top: parent.top
                                anchors.topMargin: 10
                            }
                        }
                    }*/
                    Component {
                            id: checkboxItem


                            Rectangle {
                                width: registrationmid.width / 3
                                height: registrationmid.height * 0.1
                                color:"gray"
                                anchors.right: parent.right
                                anchors.rightMargin: parent.width * 0.15

                                property alias text: textItem.text
                                property alias checked: checkbox.checked

                                CheckBox {
                                            id: checkbox
                                            anchors.left: parent.left
                                            anchors.verticalCenter: parent.verticalCenter
                                            checked: false
                                            onCheckedChanged: {

                                                            if (checked) {
                                                                if (progressBarValue2 % 100 === 50) {
                                                                    progressBarValue2 += 16;
                                                                }
                                                                checkBoxCounter++;
                                                            } else {
                                                                if (checkBoxCounter === 1 && progressBarValue2 % 100 === 66) {
                                                                    progressBarValue2 -= 16;
                                                                }
                                                                checkBoxCounter--;
                                                            }
                                                        }
                                        }

                                Text {
                                    id: textItem
                                    anchors.left: checkbox.right
                                    anchors.leftMargin: 10
                                    anchors.verticalCenter: parent.verticalCenter
                                    text: "Hobby"
                                    font.pixelSize: 16
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        checkbox.checked = !checkbox.checked
                                    }
                                }
                            }
                        }

                    Component.onCompleted: {
                        extractAndSendData()
                                    var readingCheckbox = checkboxItem.createObject(parent)
                                    readingCheckbox.text = "Reading"
                                    checkboxItems.push(readingCheckbox);

                                    var cookingCheckbox = checkboxItem.createObject(parent)
                                    cookingCheckbox.text = "Cooking"
                                    cookingCheckbox.y = 40
                                    checkboxItems.push(cookingCheckbox);

                                    var gamingCheckbox = checkboxItem.createObject(parent)
                                    gamingCheckbox.text = "Gaming"
                                    gamingCheckbox.y = 80
                                    checkboxItems.push(gamingCheckbox);

                                    var paintingCheckbox = checkboxItem.createObject(parent)
                                    paintingCheckbox.text = "Painting"
                                    paintingCheckbox.y = 120
                                    checkboxItems.push(paintingCheckbox);
                                }

                }
            }

            Rectangle {
                id: workexpid
                width: registrationmid.width / 3
                height: registrationmid.height * 0.1
                color: "#978cbd"
                anchors.top: hobbieid.bottom
                anchors.left: parent.left; anchors.leftMargin: parent.width * 0.1
                anchors.topMargin: parent.width * 0.01
                border.width: 2
                border.color: "black"

                Text {
                    id:textid4
                    anchors.centerIn: parent
                    text: "Work Experience :"
                    font.family: "Comic Sans MS"
                    font.pointSize: registrationmid.width / 42
                }
            }

            Rectangle {
                width: parent.width / 2
                height: parent.height * 0.1
                anchors.top: hobbieid.bottom; anchors.topMargin: parent.width * 0.01
                anchors.left: workexpid.right; anchors.leftMargin: parent.width * 0.01
                color: "gray"




                    SpinBox {
                        id: spinBox
                        width: parent.width
                        height: parent.height
                        value: 0
                         enabled: progressBarValue2 >= 66
                        background: Rectangle {
                            implicitWidth: parent.width - 3
                            implicitHeight: parent.height - 4
                            border.color: "black"
                            border.width: 2
                            radius: 4
                            color: "white"
                        }
                        onValueChanged: {
                            if (spinBox.value !== 0 && progressBarValue2 % 100 === 66) {
                                progressBarValue2 += 16;
                            } else if ( spinBox.value === 0 && progressBarValue2 % 100 === 82) {
                                progressBarValue2 -= 16;
                            }
                        }
                    }




            }

            Rectangle {
                id: aboutrectid
                anchors.top: workexpid.bottom; anchors.topMargin: parent.width * 0.01
                anchors.left: parent.left; anchors.leftMargin: parent.width * 0.1
                width: registrationmid.width / 3
                height: registrationmid.height * 0.1
                color: "#978cbd"
                border.width: 2
                border.color: "black"

                Text {
                    id:textid5
                    anchors.centerIn: parent
                    text: "About :"
                    font.family: "Comic Sans MS"
                    font.pointSize: registrationmid.width / 42
                }
            }

            Rectangle {
                id: textarearect
                width: registrationmid.width * 0.5
                height: registrationmid.height * 0.2
                anchors.top: workexpid.bottom
                anchors.topMargin: parent.width * 0.01
                anchors.left: aboutrectid.right
                anchors.leftMargin: parent.width * 0.01

                ScrollView {
                    width: parent.width
                    height: parent.height

                    TextArea {
                        id: abouttextfieldid
                        width: registrationmid.width * 0.5
                        height: Math.max(registrationmid.height * 0.2, contentHeight)
                        font.pointSize: registrationmid.width / 42
                        wrapMode: TextArea.Wrap
                        placeholderText: "write about you..."
                        enabled: spinBox.value!=0

                        onTextChanged: {
                            if (text.length > 0 && progressBarValue2 % 100 === 82) {
                                progressBarValue2 += 16;
                            } else if (text.length === 0 && progressBarValue2 % 100 === 98) {
                                progressBarValue2 -= 16;
                            }
                        }
                    }
                }
            }

            Rectangle {
                id:recty
                width: parent.width*0.8
                height: parent.height * 0.1
                anchors.top: textarearect.bottom; anchors.topMargin:  parent.width * 0.01
                 //anchors.horizontalCenter: parent.horizontalCenter
                anchors.left:parent.left;anchors.leftMargin: parent.width * 0.05
                color:"gray"

                Rectangle {
                    id:textid7
                    width: registrationmid.width / 3
                    height: registrationmid.height * 0.1
                    color: "green"
                    border.width: 2
                    border.color: "black"
                    radius:20
                    anchors.right:recty.right;anchors.rightMargin: 20
                    enabled: progressBarValue2 >= 98&&abouttextfieldid.text!=""

                    Text {
                        id:textid6
                        anchors.centerIn: parent
                        text: "Submit"
                        font.pointSize: registrationmid.width / 42
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            gotoPopuppage()
                            registration2pageid.visible = false
                            hobbi = hob
                            workexp = spinBox.value
                            abouttext = abouttextfieldid.text
                                   extractAndSendData()
                                sendData2(cc,spinBox.value, abouttextfieldid.text);
                            //console.log(cc)

                        }
                    }
                }
                Rectangle{
                    id:backrect
                    width: registrationmid.width / 3.2
                    height: registrationmid.height * 0.1
                    color: "lightblue"
                    border.width: 2
                    border.color: "black"
                    radius:20
                    anchors.left:recty.left;anchors.leftMargin: 20
                    //anchors.right:textid7.left;anchors.rightMargin: 20

                    Text {
                        id:backtext
                        anchors.centerIn: parent
                        text: "Back"
                        font.pointSize: registrationmid.width / 42
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            backtoregistration1()
                            registration2pageid.visible=false
                        }
                    }
                }
            }
        }

        ProgressBar {
            anchors.top: registrationmid.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            width: registrationmid.width
            height: 20
            value: progressBarValue2
            from: 0
            to: 98
        }
    }
}
