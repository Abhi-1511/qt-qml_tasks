import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width:windowid.width
    height:windowid.height
    anchors.bottom:parent.bottom
    property int activitytype:0
    property bool passwordVisible: false
    signal gotocrudpage()

    function fromcrudscreencreate(activitydone){
        crudscreenid.visible=false
        crudscreenid.enabled=false
        functionpageid.visible=true
        functionpageid.enabled=true
        activitytype=activitydone
        opacityAnimationforbackground.from=0.2
        opacityAnimationforbackground.to=1
        opacityAnimationforbackground.running=true
        switch(activitydone) {
            // case 1:
            //     opacityAnimation.target=createRect
            //     opacityAnimation.from = createRect.opacity;
            //     opacityAnimation.to = 1;
            //     opacityAnimation.running = true;
            //     //createRect.enabled=true
            //     insertRect.visible=false;insertRect.enabled=false
            //     deleteRect.visible=false;deleteRect.enabled=false
            //     updateRect.visible=false;updateRect.enabled=false
            //     console.log(activitytype)
            //     break;
        case 2:
            opacityAnimation.target=insertRect
            opacityAnimation.from = insertRect.opacity;
            opacityAnimation.to = 1;
            opacityAnimation.running = true;
            insertRect.enabled=true
            //createRect.visible=false;createRect.enabled=false
            deleteRect.visible=false;deleteRect.enabled=false
            updateRect.visible=false;updateRect.enabled=false
            console.log(activitytype)
            break;
        case 3:
            opacityAnimation.target=updateRect
            opacityAnimation.from = updateRect.opacity;
            opacityAnimation.to = 1;
            opacityAnimation.running = true;
            updateRect.enabled=true
            //createRect.visible=false;createRect.enabled=false
            deleteRect.visible=false;deleteRect.enabled=false
            insertRect.visible=false;insertRect.enabled=false
            console.log(activitytype)
            break;
        case 4:
            opacityAnimation.target=deleteRect
            opacityAnimation.from = deleteRect.opacity;
            opacityAnimation.to = 1;
            opacityAnimation.running = true;
            deleteRect.enabled=true
            console.log(activitytype)
            // createRect.visible=false;createRect.enabled=false
            insertRect.visible=false;insertRect.enabled=false
            updateRect.visible=false;updateRect.enabled=false
            break;
        default:
            console.error("Invalid text field ID:", activitytype);
        }

    }

    Rectangle{
        id: mainRect
        width: parent.width * 0.8
        height: parent.height * 0.8
        color: "lightgray"
        anchors.centerIn: parent
        visible: true
        radius: 5
        opacity:0.2// Initial opacity set to 1

        Rectangle {
            id: insertRect
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            anchors.topMargin: 20
            color: "transparent"
            border.width: 2
            border.color: "black"
            radius: 5
            visible:false
            opacity: 0.2
            Column{
                width: insertRect.width
                height: insertRect.height
                spacing: parent.height * 0.04

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    x: insertRect.width * 0.15
                    Text {
                        id:pi
                        text: "INSERT VALUE"
                        font.pointSize: parent.width * 0.05
                        font.family: "Comic Sans MS"
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.02
                    x: insertRect.width * 0.1

                    Rectangle {
                        id: textid2
                        width: insertRect.width / 3
                        height: insertRect.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textname
                            text: "Name :"
                            anchors.centerIn: parent
                            font.family: "Comic Sans MS"
                            font.pointSize: insertRect.width / 42
                        }
                    }
                    TextField {
                        id: usernameid
                        x: insertRect.width * 0.35
                        width: insertRect.width / 2.5
                        height: insertRect.height * 0.1
                        placeholderText: "Enter your username"
                        font.pointSize: insertRect.width / 42

                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.02
                    x: insertRect.width * 0.1

                    Rectangle {
                        id: textid1
                        width: insertRect.width / 3
                        height: insertRect.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textpassword
                            anchors.centerIn: parent
                            text: "Password :"
                            font.family: "Comic Sans MS"
                            font.pointSize: insertRect.width / 42
                        }
                    }
                    Row {
                        TextField {
                            id: passwordField
                            width: insertRect.width / 2.5
                            height: insertRect.height * 0.1
                            font.pointSize: insertRect.width / 42
                            placeholderText: "Enter your password"

                            echoMode: passwordVisible ? TextInput.Normal : TextInput.Password

                            Item {
                                width: insertRect.width / 20
                                height: insertRect.height * 0.05
                                anchors.right: parent.right
                                anchors.topMargin: 20
                                anchors.rightMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                                Image {
                                    source: passwordVisible ? "file:///C:/Users/Abhi/Documents/DST_Projects/registration/eye.png" : "file:///C:/Users/Abhi/Documents/DST_Projects/registration/hidden.png"
                                    anchors.fill: parent
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            passwordVisible = !passwordVisible;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    x: insertRect.width * 0.1
                    spacing: parent.width * 0.02

                    Rectangle {
                        id: textid11
                        width: insertRect.width / 3
                        height: insertRect.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textconfirmpassword
                            anchors.centerIn: parent
                            text: "Confirm Password :"
                            font.family: "Comic Sans MS"
                            font.pointSize: insertRect.width / 42
                        }
                    }
                    Row {
                        spacing: 5
                        TextField {
                            id: passwordFieldc
                            width: insertRect.width / 2.5
                            height: insertRect.height * 0.1
                            placeholderText: "Enter your password "

                            font.pointSize: insertRect.width / 42
                            echoMode: passwordVisible ? TextInput.Normal : TextInput.Password

                            Item {
                                width: insertRect.width / 20
                                height: insertRect.height * 0.05
                                anchors.right: parent.right
                                anchors.topMargin: 20
                                anchors.rightMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                                Image {
                                    source: passwordVisible ? "file:///C:/Users/Abhi/Documents/DST_Projects/registration/eye.png" : "file:///C:/Users/Abhi/Documents/DST_Projects/registration/hidden.png"
                                    anchors.fill: parent
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            passwordVisible = !passwordVisible;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: insertRect.width * 0.1

                    Rectangle {
                        id: ageid
                        width: insertRect.width / 3
                        height: insertRect.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:agetextid
                            anchors.centerIn: parent
                            text: "Age :"
                            font.family: "Comic Sans MS"
                            font.pointSize: insertRect.width / 42
                        }
                    }
                    Slider {
                        id: ageSlider
                        width: parent.width * 0.4
                        height: parent.height * 0.1
                        anchors.verticalCenter: parent.verticalCenter

                        from: 10
                        to: 99


                    }
                    Text {
                        id:agess
                        text: ageSlider.value.toFixed(0)
                        font.pointSize: insertRect.width / 42
                        color: "black"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: insertRect.width * 0.1

                    Rectangle {
                        id: genid
                        width: insertRect.width / 3
                        height: insertRect.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textgender
                            anchors.centerIn: parent
                            text: "Gender :"
                            font.family: "Comic Sans MS"
                            font.pointSize: insertRect.width / 42
                        }
                    }
                    TextField {
                        id: genderid
                        x: insertRect.width * 0.35
                        width: insertRect.width / 2.5
                        height: insertRect.height * 0.1
                        placeholderText: "Gender"
                        font.pointSize: insertRect.width / 42

                    }

                }
            }
            Rectangle{
                width:parent.width/4
                height:parent.height/10
                color:"green"
                anchors.bottom:parent.bottom;anchors.bottomMargin: parent.height*0.05
                anchors.horizontalCenter: parent.horizontalCenter
                border.width:2
                border.color:"black"
                radius:5

                Text {
                    id: oktext2
                    text: qsTr("OK")
                    anchors.centerIn: parent
                    font.pointSize: parent.width * 0.1
                    color:"white"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gotocrudpage()
                        comboModeldelete.append({name:usernameid.text})
                       comboModelupdate.append({name:usernameid.text})
                        backend.insertData(usernameid.text,passwordField.text,passwordFieldc.text,agess.text,genderid.text)
                        usernameid.text=""
                        passwordField.text=""
                        passwordFieldc.text=""
                        agess.text=""
                        genderid.text=""
                        ageSlider.value=0
                    }
                }
            }
        }
        Rectangle {
            id: updateRect
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            color: "transparent"
            border.width: 2
            border.color: "black"
            radius: 5
            visible:false
            opacity: 0.2
            Column {
                width: insertRect.width
                height: insertRect.height
                spacing: parent.height * 0.04

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    x: insertRect.width * 0.15
                    Text {
                        id:piv
                        text: "UPDATE VALUE"
                        font.pointSize: parent.width * 0.05
                        font.family: "Comic Sans MS"
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.02
                    x: insertRect.width * 0.1

                    Rectangle {
                        id: textid22
                        width: insertRect.width / 3
                        height: insertRect.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textname1
                            text: "Name :"
                            anchors.centerIn: parent
                            font.family: "Comic Sans MS"
                            font.pointSize: insertRect.width / 42
                        }
                    }
                    ComboBox {
                        id: comboBoxupdate
                        width: 200
                        model: comboModelupdate
                        currentIndex: 0 // Set the initial selected index
                        ListModel {
                            id: comboModelupdate
                            ListElement { name: "default" }
                        }
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.02
                    x: insertRect.width * 0.1

                    Rectangle {
                        id: textid111
                        width: insertRect.width / 3
                        height: insertRect.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textpassword1
                            anchors.centerIn: parent
                            text: "Password :"
                            font.family: "Comic Sans MS"
                            font.pointSize: insertRect.width / 42
                        }
                    }
                    Row {
                        TextField {
                            id: passwordField1
                            width: insertRect.width / 2.5
                            height: insertRect.height * 0.1
                            font.pointSize: insertRect.width / 42
                            placeholderText: "Enter your password"

                            echoMode: passwordVisible ? TextInput.Normal : TextInput.Password

                            Item {
                                width: insertRect.width / 20
                                height: insertRect.height * 0.05
                                anchors.right: parent.right
                                anchors.topMargin: 20
                                anchors.rightMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                                Image {
                                    source: passwordVisible ? "file:///C:/Users/Abhi/Documents/DST_Projects/registration/eye.png" : "file:///C:/Users/Abhi/Documents/DST_Projects/registration/hidden.png"
                                    anchors.fill: parent
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            passwordVisible = !passwordVisible;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    x: insertRect.width * 0.1
                    spacing: parent.width * 0.02

                    Rectangle {
                        id: textid112
                        width: insertRect.width / 3
                        height: insertRect.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textconfirmpassword1
                            anchors.centerIn: parent
                            text: "Confirm Password :"
                            font.family: "Comic Sans MS"
                            font.pointSize: insertRect.width / 42
                        }
                    }
                    Row {
                        spacing: 5
                        TextField {
                            id: passwordFieldc1
                            width: insertRect.width / 2.5
                            height: insertRect.height * 0.1
                            placeholderText: "Enter your password "

                            font.pointSize: insertRect.width / 42
                            echoMode: passwordVisible ? TextInput.Normal : TextInput.Password

                            Item {
                                width: insertRect.width / 20
                                height: insertRect.height * 0.05
                                anchors.right: parent.right
                                anchors.topMargin: 20
                                anchors.rightMargin: 10
                                anchors.verticalCenter: parent.verticalCenter
                                Image {
                                    source: passwordVisible ? "file:///C:/Users/Abhi/Documents/DST_Projects/registration/eye.png" : "file:///C:/Users/Abhi/Documents/DST_Projects/registration/hidden.png"
                                    anchors.fill: parent
                                    MouseArea {
                                        anchors.fill: parent
                                        onClicked: {
                                            passwordVisible = !passwordVisible;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: insertRect.width * 0.1

                    Rectangle {
                        id: ageid1
                        width: insertRect.width / 3
                        height: insertRect.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:agetextid1
                            anchors.centerIn: parent
                            text: "Age :"
                            font.family: "Comic Sans MS"
                            font.pointSize: insertRect.width / 42
                        }
                    }
                    Slider {
                        id: ageSlider1
                        width: parent.width * 0.4
                        height: parent.height * 0.1
                        anchors.verticalCenter: parent.verticalCenter

                        from: 10
                        to: 99


                    }
                    Text {
                        id:agess1
                        text: ageSlider.value.toFixed(0)
                        font.pointSize: insertRect.width / 42
                        color: "black"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: insertRect.width * 0.1

                    Rectangle {
                        id: genid1
                        width: insertRect.width / 3
                        height: insertRect.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textgender1
                            anchors.centerIn: parent
                            text: "Gender :"
                            font.family: "Comic Sans MS"
                            font.pointSize: insertRect.width / 42
                        }
                    }
                    TextField {
                        id: genderid1
                        x: insertRect.width * 0.35
                        width: insertRect.width / 2.5
                        height: insertRect.height * 0.1
                        placeholderText: "Gender"
                        font.pointSize: insertRect.width / 42

                    }

                }
            }


            Rectangle{
                width:parent.width/4
                height:parent.height/10
                color:"green"
                anchors.bottom:parent.bottom;anchors.bottomMargin: parent.height*0.1
                anchors.horizontalCenter: parent.horizontalCenter
                border.width:2
                border.color:"black"
                radius:5

                Text {
                    id: oktext3
                    text: qsTr("OK")
                    anchors.centerIn: parent
                    font.pointSize: parent.width * 0.1
                    color:"white"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        backend.updateData(comboBoxupdate.currentText,passwordField1.text,passwordFieldc1.text,agess1.text,genderid1.text)
                        gotocrudpage()
                        console.log("cbm "+comboBoxupdate.currentText)
                    }
                }
            }
        }
        Rectangle {
            id: deleteRect
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            color: "transparent"
            border.width: 2
            border.color: "black"
            radius: 5
            visible:false
            opacity: 0.2
            Text {
                id: deletetext
                text: qsTr("Hi There..! Please select the database to delete...")
                anchors.top:parent.top;anchors.topMargin: parent.height*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: parent.width * 0.025
            }
            ComboBox {
                id: comboBoxdelete
                anchors.centerIn: parent
                width: 200
                model: comboModeldelete// Define the model for the ComboBox
                currentIndex: 0 // Set the initial selected index
                ListModel {
                    id: comboModeldelete
                    ListElement { name: "default" }
                }
                onActivated: {
                    console.log("Selected index:", currentIndex) // Log the index of the selected item
                    console.log("Selected item:", currentText) // Log the text of the selected item
                }
            }

            Rectangle{
                width:parent.width/4
                height:parent.height/10
                color:"green"
                anchors.bottom:parent.bottom;anchors.bottomMargin: parent.height*0.1
                anchors.horizontalCenter: parent.horizontalCenter
                border.width:2
                border.color:"black"
                radius:5

                Text {
                    id: oktext4
                    text: qsTr("OK")
                    anchors.centerIn: parent
                    font.pointSize: parent.width * 0.1
                    color:"white"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        gotocrudpage()
                        console.log(comboBoxupdate.currentText+" this is going for deletion")
                        backend.deleteData(comboBoxupdate.currentText)
                        comboModelupdate.remove(comboBoxupdate.currentText)
                        comboModeldelete.remove(comboBoxupdate.currentText)
                    }
                }
            }
        }
        PropertyAnimation {
            id: opacityAnimation
            property: "opacity"
            duration: 1000 // 0.5 seconds
            easing.type: Easing.InOutQuad // Easing function
            onStopped: {
                target.visible=true
            }
        }
        PropertyAnimation {
            id: opacityAnimationforbackground
            target: mainRect
            property: "opacity"
            duration: 1000 // 0.5 seconds
            easing.type: Easing.InOutQuad // Easing function
            onStopped: {
                mainRect.visible=true
            }
        }
    }
}
