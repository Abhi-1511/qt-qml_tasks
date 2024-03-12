import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Dialogs 1.3
import QtQuick.Controls.Styles 1.4
Item {
    id:abc
    width: 800
    height: 600
    visible: true
    signal readData(string fname, string lname, string ages, string mob)
    opacity: 1
    onReadData: {
        fname=""
        lname=""
        ages=""
        mob=""

    }
    function popi(){

        popid.visible=false
        swipeView.currentIndex = 0
        abc.readData(fname, lname, ages, mob)
        abc.opacity=1
    }
    function popj(){
        popid.visible=false
        swipeView.currentIndex = 0
        sendData(fname, lname, ages, mob)
        abc.opacity=1


    }


    property string fname:""
    property string lname:""
    property string ages:""
    property string mob:""
    property string emailid:""
    property string gender:""

    property bool isvisilbe: true
    signal sendData(string fnamesend, string lnamesend, string agessend, string mobsend)

    Rectangle {

        Text {
            anchors.top: parent.top
            //anchors.margins: 20
            anchors.horizontalCenter: parent.horizontalCenter
            width:parent.width/2
            id: reg
            text: "Registration Form"
            font.pointSize: 40
            font.family: "Comic Sans MS"
        }
        anchors.fill: parent
        gradient: Gradient {
            GradientStop { position: 0.0; color: "lightsteelblue" }/*
            GradientStop { position: 0.2; color: "red" }
            GradientStop { position: 0.4; color: "green" }*/
            GradientStop { position: 1.0; color: "#497fd6" }
        }

    }

    SwipeView {
        id: swipeView
        width: parent.width / 2
        height: parent.height / 2
        anchors.centerIn: parent


        Repeater {
            model: 5

            Rectangle {
                width: swipeView.width - swipeView.width / 20
                height: swipeView.height
                border.color: "#595855"
                border.width: 5
                radius: 50
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "white" }
                    GradientStop { position: 1.0; color: "#ccbff5" }
                }
                enabled: {
                    if (swipeView.currentIndex === index )
                        return true;
                    else
                        return false;

                }

                opacity: {
                    if (swipeView.currentIndex === index )
                        return 1.0;
                    else
                        return 0.6;
                }

                property string swipe1text : ""
                property string swipe2age:""
                property string swipetext3: ""
                property alias fnamesend:textid2.text
                property alias lnamesend:textid22.text
                property alias agessend:textid4.text
                property alias mobsend:textid10.text
                property alias emailidsend:textid8.text
                property alias gendersend:textid7.text
                //////////////////////////swipe1////////////////////////////////////////////////////
                Column {
                    spacing: 25
                    anchors.fill: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    // Add condition to display fields only in the first swipe
                    visible: index === 0
                    //opacity: swipeView.currentIndex !== 0 ? 0.6 : 1.0

                    Text {
                        id: t1
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "\nYour Good Name Please...!"
                        font.pixelSize: 24
                        color: "Black"
                        font.family: "Comic Sans MS"
                    }

                    Row {
                        id: row1
                        spacing: parent.width / 64
                        anchors.horizontalCenter: parent.horizontalCenter
                        Rectangle {
                            width: textid1.implicitWidth + 20
                            height: textid1.implicitHeight + 20
                            color: "#978cbd"
                            Text {
                                id: textid1
                                anchors.centerIn: parent
                                text: "First Name :"
                                font.family: "Comic Sans MS"
                            }
                        }

                        Rectangle {
                            color: "#978cbd"
                            width: textid2.implicitWidth
                            height: textid2.implicitHeight
                            TextField {
                                id: textid2
                                anchors.centerIn: parent
                                focus: true
                                placeholderText :  "Type your first name"
                                font.family: "Comic Sans MS"
                                maximumLength: 30
                                onTextChanged: {
                                    if (textid2.text.match(/^[a-zA-Z]*$/)) {
                                        textid2.color = "black";
                                    } else {
                                        textid2.color = "red";
                                    }
                                }
                                onEditingFinished: {
                                    swipe1text=text;
                                    fname=textid2.text;
                                }
                            }
                        }
                    }

                    Row {
                        id:row2
                        spacing: parent.width / 64
                        anchors.horizontalCenter: parent.horizontalCenter
                        Rectangle {
                            width: textid11.implicitWidth + 20
                            height: textid11.implicitHeight + 20
                            color: "#978cbd"
                            Text {
                                id: textid11
                                anchors.centerIn: parent
                                text: "Last Name :"
                                font.family: "Comic Sans MS"
                            }
                        }

                        Rectangle {
                            color: "#978cbd"
                            width: textid22.implicitWidth
                            height: textid22.implicitHeight
                            TextField {
                                id: textid22
                                anchors.centerIn: parent
                                focus: true
                                placeholderText : "Type in your last name"
                                maximumLength: 30
                                font.family: "Comic Sans MS"
                                onEditingFinished: {
                                    lname=textid22.text;
                                    swipetext3=textid22.text;
                                }

                            }
                        }
                    }
                    Rectangle{
                        id:rectang
                        anchors.top: row2.bottom
                        anchors.bottom:parent.bottom
                        anchors.topMargin: swipeView.width/8
                        Text {
                            id: swipetxt2
                            text:"   Hello there..! "+swipe1text+" "+swipetext3
                            font.pointSize: 15
                            font.family: "Comic Sans MS"
                        }
                    }
                    Button {
                        width:30
                        height:20
                        text: "OK"

                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            var regex = /^[a-zA-Z]*$/;
                            if (textid2.text.length === 0||textid22.text.length===0) {
                                console.log("Text input is empty!")
                                validid2.text="\t\t\tInvalid"
                            } else if (!regex.test(textid2.text)||!regex.test(textid22.text)) {
                                console.log("Text input contains non-alphabetic characters!")
                                validid2.text="\t\t\tInvalid"

                            } else {
                                swipeView.currentIndex = 1
                                validid2.text=""
                            }
                        }
                    }
                    Rectangle{

                        width:validid2.implicitWidth+20
                        height:validid2.implicitHeight+20
                        color:"transparent"
                        Text{
                            id:validid2
                            text:""
                            color: "red"

                        }
                    }


                }
                /////////////////////////////swipe1 ends here/////////////////////////////////////////////////
                Column {
                    spacing: 25
                    anchors.fill: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter



                    visible: index === 1

                    Text {
                        id: t2
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "\nWhat's your age?"
                        font.pixelSize: 24
                        color: "Black"
                        font.family: "Comic Sans MS"
                    }

                    Row {
                        id: row3
                        spacing: parent.width / 64
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            width: textid3.implicitWidth + 20
                            height: textid3.implicitHeight + 20
                            color: "#978cbd"
                            Text {
                                id: textid3
                                anchors.centerIn: parent
                                text: "Age :"
                                font.family: "Comic Sans MS"
                            }
                        }

                        Rectangle {
                            color: "#978cbd"
                            width: textid4.implicitWidth
                            height: textid4.implicitHeight
                            TextField {
                                id: textid4
                                anchors.centerIn: parent
                                focus: true
                                placeholderText: "000"
                                font.family: "Comic Sans MS"
                                maximumLength: 3
                                validator: RegExpValidator { regExp: /^[0-9]*$/ }
                                onEditingFinished: {


                                    swipe2age = text;
                                    ages = textid4.text;

                                }
                            }
                        }


                    }

                    Button {
                        width:30
                        height:20
                        text: "OK"

                        anchors.horizontalCenter: parent.horizontalCenter

                        onClicked: {
                            var regex1 = /^[0-9]*$/;
                            if (textid4.text.length === 0||textid4.text==="000") {
                                console.log("Text input is empty!")
                                validid3.text="\t\t\tInvalid"
                            } else if (!regex1.test(textid4.text)) {
                                console.log("Text input contains non-alphabetic characters!")
                                validid3.text="\t\t\tInvalid"

                            } else {

                                swipeView.currentIndex = 2
                                validid3.text=""
                            }
                        }
                    }
                    Rectangle{

                        width:validid3.implicitWidth+20
                        height:validid3.implicitHeight+20
                        color:"transparent"
                        Text{
                            id:validid3
                            text:""
                            color: "red"

                        }
                    }
                    Rectangle {
                        id: rectang2

                        anchors.top: row3.bottom
                        anchors.topMargin: swipeView.width / 4

                        Text {
                            id: swipetxt3
                            text: "\tAge is just a number...."
                            font.pointSize: 15
                            font.family: "Comic Sans MS"
                        }
                    }


                }
                ////////////////swipe2 ends here//////////////////////////////////////////
                Column {
                    spacing: 25
                    anchors.fill: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    visible: index === 2

                    Text {
                        id: t3
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "\nWhat's your gender?"
                        font.pixelSize: 24
                        color: "Black"
                        font.family: "Comic Sans MS"
                    }

                    Row {
                        id: row4
                        spacing: parent.width / 64
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            width: textid5.implicitWidth+20
                            height: textid5.implicitHeight+20
                            color: "#978cbd"
                            Text {
                                id: textid5
                                anchors.centerIn: parent
                                text: "Gender :"
                                font.family: "Comic Sans MS"
                            }
                        }

                        Rectangle {
                            //color: "#978cbd"
                            width: textid6.implicitWidth-20
                            height: textid6.implicitHeight-20

                            ComboBox {
                                id: textid6
                                width: parent.width
                                model: ["Select","Male", "Female", "Other"]
                                currentIndex: 0

                                delegate: ItemDelegate {
                                    text: modelData
                                    width: parent.width
                                    contentItem: Text {
                                        text: modelData
                                        color: "black"
                                        font.pixelSize: 16
                                        MouseArea {
                                            id: mouseArea
                                            anchors.fill: parent
                                            hoverEnabled: true
                                            onClicked: {
                                                textid6.currentIndex = index;
                                            }
                                            onEntered: {
                                                parent.font.pixelSize = 17;
                                                parent.font.bold = true;
                                            }

                                            onExited: {
                                                parent.font.pixelSize = 16;
                                                parent.font.bold = false;
                                            }
                                        }
                                    }
                                    background: Rectangle {
                                        implicitWidth: parent.width
                                        implicitHeight: textid6.implicitHeight
                                        color: {modelData === "Male" ? "red" :modelData === "Female" ? "blue" : modelData === "Other" ? "yellow" : "white"
                                        }
                                    }
                                }
                                indicator: Rectangle {
                                        width: 20
                                        height: 20
                                        //color: "green"
                                        anchors.right:parent.right
                                        anchors.bottom: parent.bottom
                                        anchors.bottomMargin: 10
                                        Image {
                                            source: "file:///C:/Users/Abhi/Documents/DST_Projects/customcombo/img.png"
                                            width: parent.width
                                            height: parent.height
                                        }
                                    }

                                onCurrentIndexChanged: {
                                    if (currentIndex !== 0) {
                                        gender = textid6.model[currentIndex]
                                    }
                                }
                            }

                        }



                    }

                    Button {
                        width:30
                        height:20
                        text: "OK"
                        anchors.horizontalCenter: parent.horizontalCenter

                        onClicked: {
                            //var regex = /^[0-9]*$/;
                            if (textid6.currentIndex === 0)  {
                                console.log("Text input is empty!")
                                validid4.text="\t\t\tInvalid"
                            }
                            else {

                                swipeView.currentIndex = 3
                                validid4.text=""
                            }
                        }
                    }
                    Rectangle{

                        width:validid4.implicitWidth+20
                        height:validid4.implicitHeight+20
                        color:"transparent"
                        Text{
                            id:validid4
                            text:""
                            color: "red"

                        }
                    }


                }
                //////swipe3 ends here////////////////////////////////////////////////////////////////////////
                Column {
                    spacing: 25
                    anchors.fill: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    // Add condition to display fields only in the fourth swipe
                    visible: index === 3

                    Text {
                        id: t4
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "\nWhat's your email?"
                        font.pixelSize: 24
                        color: "Black"
                        font.family: "Comic Sans MS"
                    }

                    Row {
                        id: row5
                        spacing: parent.width / 64
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            width: textid7.implicitWidth + 20
                            height: textid7.implicitHeight + 20
                            color: "#978cbd"
                            Text {
                                id: textid7
                                anchors.centerIn: parent
                                text: "Email :"
                                font.family: "Comic Sans MS"
                            }
                        }

                        Rectangle {
                            color: "#978cbd"
                            width: textid8.implicitWidth
                            height: textid8.implicitHeight

                            TextField {
                                id: textid8
                                anchors.centerIn: parent
                                focus: true
                                placeholderText: "Enter your email"
                                font.family: "Comic Sans MS"
                                maximumLength: 50
                                validator: RegExpValidator {
                                    regExp: /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
                                }
                                onEditingFinished: {
                                    emailid = textid8.text;
                                }
                            }
                        }
                    }
                    Button {
                        width:30
                        height:20
                        text: "OK"
                        //anchors.top: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter

                        onClicked: {
                            var regex2 = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
                            if (textid8.text.length === 0) {
                                console.log("Text input is empty!")
                                validid5.text="\t\t\tInvalid"
                            } else if (!regex2.test(textid8.text)) {
                                console.log("Text input contains non-alphabetic characters!")
                                validid5.text="\t\t\tInvalid"

                            } else {

                                swipeView.currentIndex = 4
                                validid5.text=""
                            }
                        }
                    }
                    Rectangle{

                        width:validid5.implicitWidth+20
                        height:validid5.implicitHeight+20
                        color:"transparent"
                        Text{
                            id:validid5
                            text:""
                            color: "red"

                        }
                    }


                }

                ////////////////swipe4 ends here///////////////////////////
                Column {
                    spacing: 25
                    anchors.fill: parent
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter

                    visible: index === 4

                    Text {
                        id: t5
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "\nCan i have your number?"
                        font.pixelSize: 24
                        color: "Black"
                        font.family: "Comic Sans MS"
                    }

                    Row {
                        id: row9
                        spacing: 10
                        anchors.horizontalCenter: parent.horizontalCenter

                        Rectangle {
                            width: textid9.implicitWidth + 20
                            height: textid9.implicitHeight + 20
                            color: "#978cbd"
                            Text {
                                id: textid9
                                anchors.centerIn: parent
                                text: "Mobile Number :"
                                font.family: "Comic Sans MS"
                            }
                        }

                        Rectangle {
                            color: "#978cbd"
                            width: textid10.implicitWidth
                            height: textid10.implicitHeight

                            TextField {
                                id: textid10
                                anchors.centerIn: parent
                                focus: true
                                placeholderText : "##########"
                                font.family: "Comic Sans MS"
                                maximumLength: 10
                                validator: RegExpValidator { regExp: /^[0-9]*$/ }
                                onEditingFinished: {
                                    if (text.length !== 10) {
                                        console.log("Invalid mobile number");
                                    } else {
                                        mob = textid10.text;
                                    }

                                }
                            }
                        }
                    }
                    Rectangle{
                        width:validid.implicitWidth+20
                        height:validid.implicitHeight+20
                        color:"transparent"
                        Text{
                            id:validid
                            text:""
                            color:"red"
                        }
                    }

                    Button {
                        id:button123
                        width:30
                        height:20
                        text: "OK"

                        anchors.horizontalCenter: parent.horizontalCenter

                        onClicked: {
                            var regex1 = /^[0-9]*$/;
                            if (textid10.text.length!==10){
                                validid7.text="\t\t\tinvalid"
                                popupButton.enabled=false

                            } else {

                                popupButton.enabled=true
                                validid7.text=""
                            }
                        }
                    }
                    Rectangle{

                        width:validid7.implicitWidth+20
                        height:validid7.implicitHeight+20
                        color:"transparent"
                        Text{
                            id:validid7
                            text:""
                            color: "red"

                        }
                    }

                    Button {
                        id: popupButton
                        text: "Submit"
                        enabled: true

                        anchors.horizontalCenter: parent.horizontalCenter
                        //anchors.top: button123.bottom
                        onClicked: {
                            // if (textid2.text === ""  ||textid22.text === "" || textid4.text === "" || textid8.text === "" || textid10.text === "") {
                            //     console.log("invalid input ")
                            //     validid.text="\t\tinvalid input"

                            // }
                            //else{
                            popid.visible=true
                          abc.opacity=0.7

                            //     console.log("valid input ")
                            // }
                        }
                        Rectangle{
                            anchors.fill:parent
                            color: "green"
                            border.color: "black"
                            border.width:2
                        }
                    }


                    // Popup {
                    //         id: popup
                    //         visible: false
                    //         anchors.centerIn: parent

                    //         // Connect signals from the Popup to corresponding functions in the main QML file
                    //         onSaveClicked: {
                    //             popup.close()
                    //             swipeView.currentIndex = 0
                    //             abc.readData(fname, lname, ages, mob)
                    //         }
                    //         onDeleteClicked: {
                    //             popup.close()
                    //             swipeView.currentIndex = 0
                    //             sendData(fname, lname, ages, mob)
                    //             console.log(fname)
                    //             console.log(fnamesend)
                    //         }
                    //     }

                    // Show the Popup when needed
                    // Button {
                    //     text: "Show Popup"
                    //     onClicked: popup.visible = true
                    // }
                }
            }


        }


    }
}





// edit combobox{img} fname+lname no dialog delete listview beda
