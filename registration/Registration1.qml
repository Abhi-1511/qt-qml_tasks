import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4

Item {
    id: itemidreg1
    width: windowid.width
    height: windowid.height
    property bool passwordVisible: false
    property real progressBarValue: 0
    property bool wasEmpty: true
    signal goToRegistation2Page()
    signal backbuttonsignal()

    property string name: ""
    property string password: ""
    property string confirmpassword: ""
    property string age: ""
    property string gender: ""
    property string genders: ""

    signal sendData(string name, string password, string confirmpassword, string age, string gender)
    signal logindetails(string name, string password)

    function register() {
        visible = true
        console.log("Registration completed");
    }
    function null1() {
        usernameid.text = ""
        passwordField.text = ""
        passwordFieldc.text = ""
        ageSlider.value = 0
        for (var i = 0; i < gen.count; ++i) {
            gen.itemAt(i).checked = false;
        }
        progressBarValue = 0
    }
    function handleModeChange(checked) {
        if (checked) {
            loginfull.color="black"
            registration1mid.color = "#212121"
            textid2.color = "black"
            textid1.color = "black"
            genid.color = "black"
            ageid.color="black"

            textid11.color = "black"

            agetextid.color="white"
            textname.color="white"
            textpassword.color="white"
           textconfirmpassword.color="white"
            textgender.color="white"
            pi.color="white"
            submitrect.color="black"
            submittext.color="white"
            backrect.color="black"
            backtext.color="white"
            agess.color="white"



        } else {

            loginfull.color="lightblue"
            registration1mid.color = "gray"
            textid2.color = "#978cbd"
            textid1.color = "#978cbd"
            genid.color = "#978cbd"
            ageid.color="#978cbd"

            textid11.color = "#978cbd"

            agetextid.color="black"
            loginfull.color="lightblue"
            textname.color="black"
            textpassword.color="black"
            textconfirmpassword.color="black"
            textgender.color="black"

             pi.color="black"
            submitrect.color="lightgreen"
            submittext.color="black"
            backrect.color="lightblue"
            backtext.color="black"
             agess.color="blacks"
        }
    }

    Rectangle {
        id: loginfull
        width: parent.width
        height: parent.height
        color: "lightblue"

        Rectangle {
            id: registration1mid
            width: parent.width * 0.5
            height: parent.height * 0.7
            color: "gray"
            x: (parent.width - width) / 2
            y: (parent.height - height) / 2
            border.width: 2
            border.color: "black"
            radius: 15

            Column {
                width: registration1mid.width
                height: registration1mid.height
                spacing: parent.height * 0.04

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    x: registration1mid.width * 0.15
                    Text {
                        id:pi
                        text: "Personal Information"
                        font.pointSize: parent.width * 0.05
                        font.family: "Comic Sans MS"
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.02
                    x: registration1mid.width * 0.1

                    Rectangle {
                        id: textid2
                        width: registration1mid.width / 3
                        height: registration1mid.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textname
                            text: "Name :"
                            anchors.centerIn: parent
                            font.family: "Comic Sans MS"
                            font.pointSize: registration1mid.width / 42
                        }
                    }
                    TextField {
                        id: usernameid
                        x: registration1mid.width * 0.35
                        width: registration1mid.width / 2.5
                        height: registration1mid.height * 0.1
                        placeholderText: "Enter your username"
                        font.pointSize: registration1mid.width / 42
                        onTextChanged: {
                            if (text !== "" && progressBarValue % 100 === 0) {
                                progressBarValue += 10;
                            } else if (text === "" && progressBarValue % 100 === 10) {
                                progressBarValue -= 10;
                            }
                        }
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.02
                    x: registration1mid.width * 0.1

                    Rectangle {
                        id: textid1
                        width: registration1mid.width / 3
                        height: registration1mid.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textpassword
                            anchors.centerIn: parent
                            text: "Password :"
                            font.family: "Comic Sans MS"
                            font.pointSize: registration1mid.width / 42
                        }
                    }
                    Row {
                        TextField {
                            id: passwordField
                            width: registration1mid.width / 2.5
                            height: registration1mid.height * 0.1
                            font.pointSize: registration1mid.width / 42
                            placeholderText: "Enter your password"
                            enabled: progressBarValue >= 10
                            echoMode: passwordVisible ? TextInput.Normal : TextInput.Password
                            onTextChanged: {
                                if (text === "" && !passwordField.text.isEmpty && progressBarValue % 100 === 20) {
                                    progressBarValue -= 10;
                                } else if (text !== "" && progressBarValue % 100 === 10) {
                                    progressBarValue += 10;
                                }
                                if (passwordField.text === "")
                                    passwordVisible = false;
                            }
                            Item {
                                width: registration1mid.width / 20
                                height: registration1mid.height * 0.05
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
                    x: registration1mid.width * 0.1
                    spacing: parent.width * 0.02

                    Rectangle {
                        id: textid11
                        width: registration1mid.width / 3
                        height: registration1mid.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textconfirmpassword
                            anchors.centerIn: parent
                            text: "Confirm Password :"
                            font.family: "Comic Sans MS"
                            font.pointSize: registration1mid.width / 42
                        }
                    }
                    Row {
                        spacing: 5
                        TextField {
                            id: passwordFieldc
                            width: registration1mid.width / 2.5
                            height: registration1mid.height * 0.1
                            placeholderText: "Enter your password "
                            enabled: progressBarValue >= 20
                            font.pointSize: registration1mid.width / 42
                            echoMode: passwordVisible ? TextInput.Normal : TextInput.Password
                            onTextChanged: {
                                if (text === "" && !passwordFieldc.text.isEmpty && progressBarValue % 100 === 30) {
                                    progressBarValue -= 10;
                                } else if (text !== "" && progressBarValue % 100 === 20) {
                                    progressBarValue += 10;
                                }
                                if (text === "")
                                    passwordVisible = false;
                                passwordFieldc.color = passwordFieldc.text === passwordField.text ? "black" : "red";
                            }
                            Item {
                                width: registration1mid.width / 20
                                height: registration1mid.height * 0.05
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
                    x: registration1mid.width * 0.1

                    Rectangle {
                        id: ageid
                        width: registration1mid.width / 3
                        height: registration1mid.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:agetextid
                            anchors.centerIn: parent
                            text: "Age :"
                            font.family: "Comic Sans MS"
                            font.pointSize: registration1mid.width / 42
                        }
                    }
                    Slider {
                        id: ageSlider
                        width: parent.width * 0.4
                        height: parent.height * 0.1
                        anchors.verticalCenter: parent.verticalCenter

                        from: 10
                        to: 99
                        enabled: progressBarValue >= 30
                        onValueChanged: {
                            if (value !== 0 && progressBarValue % 100 === 30) {
                                progressBarValue += 10;
                            } else if (value === 0 && progressBarValue % 100 === 40) {
                                progressBarValue -= 10;
                            }
                        }
                    }
                    Text {
                        id:agess
                        text: ageSlider.value.toFixed(0)
                        font.pointSize: registration1mid.width / 42
                        color: "black"
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.04
                    x: registration1mid.width * 0.1

                    Rectangle {
                        id: genid
                        width: registration1mid.width / 3
                        height: registration1mid.height * 0.1
                        color: "#978cbd"
                        border.width: 2
                        border.color: "black"
                        Text {
                            id:textgender
                            anchors.centerIn: parent
                            text: "Gender :"
                            font.family: "Comic Sans MS"
                            font.pointSize: registration1mid.width / 42
                        }
                    }

                    Row{
                        spacing: 2
                        width: registration1mid.width / 3
                        height: registration1mid.height * 0.1

                        Repeater {
                            id: gen
                            model: ["Male", "Female", "Others"]
                            delegate: RadioButton {
                                width: registration1mid.width / 8
                                height: registration1mid.height * 0.1
                                checked: false
                                enabled: progressBarValue >= 30

                                Column {
                                    spacing: 2
                                    anchors.top: parent.bottom
                                    x: registration1mid.width / 32
                                    Text {

                                        text: modelData
                                        font.pointSize: 10
                                    }

                                }
                                onClicked: {
                                    for (var i = 0; i < model.count; ++i) {
                                        if (i !== index) {
                                            model.itemAt(i).checked = false;
                                        }
                                    }
                                    genders = modelData
                                }

                                onCheckedChanged: {
                                    if (checked && progressBarValue % 100 === 40) {
                                        progressBarValue += 10;
                                    } else if (!checked && progressBarValue % 100 === 50) {
                                        progressBarValue -= 10;
                                    }
                                }
                            }
                        }
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    x: registration1mid.width * 0.1
                    spacing:registration1mid.width * 0.1
                    Rectangle{
                        id:backrect
                        //anchors.horizontalCenter: parent.horizontalCenter
                        width: registration1mid.width / 3
                        height: registration1mid.height * 0.1
                        color: "lightblue"
                        border.width: 2
                        radius:20
                        border.color: "black"

                        Text {
                            id:backtext
                            anchors.centerIn: parent
                            text: "Back"
                            font.pointSize: registration1mid.width / 42
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                registrationpageid.visible=false
                                backbuttonsignal()


                            }
                        }
                    }

                    Rectangle {
                        id:submitrect
                        //anchors.horizontalCenter: parent.horizontalCenter
                        width: registration1mid.width / 3
                        height: registration1mid.height * 0.1
                        color: "lightgreen"
                        radius:20
                        border.width: 2
                        border.color: "black"
                        enabled: progressBarValue === 50
                        Text {
                            id:submittext
                            anchors.centerIn: parent
                            text: "Submit"
                            font.pointSize: registration1mid.width / 42
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                name = usernameid.text
                                password = passwordField.text
                                confirmpassword = passwordFieldc.text
                                age = ageSlider.value.toFixed(0)
                                gender = genders
                                sendData(name, password, confirmpassword, age, gender)
                                console.log(name, password, confirmpassword, age, gender)
                                logindetails(name, password)
                                goToRegistation2Page()
                                registrationpageid.visible = false

                            }
                        }
                    }
                }


                ProgressBar {

                    width: registration1mid.width
                    height: 40
                    value: progressBarValue
                    from: 0
                    to: 100

                }
            }
        }
    }
}
