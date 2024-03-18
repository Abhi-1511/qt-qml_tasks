import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width: windowid.width
    height: windowid.height
    property bool passwordVisible: false
    property string name1:""
    property string password1:""
    property string name2:""
    property string password2:""
    signal goToRegistation1Page()
    signal gotodetailspage()
    function clear(){
        usernamefield.text=""
        passwordField.text=""
    }

    function welcometologinpage() {
        visible=true
        console.log("login page");
    }
    // function welcometologinpageagain() {
    //     visible=true
    //     console.log("login page");
    // }
    function welcometologinpageagain2() {
        visible=true
        console.log("login page");
    }
    function receivelogindetails(name1,password1){
        password2=password1
        name2=name1

    }
    function handleModeChange(checked) {
            if (checked) {

                loginfull.color = "black"
                loginmid.color = "#212121"
                loggray.color = "#212121"
                gray1.color="#212121"
                rectusernameid.color="black"
                textid2.color="white"
                logintext.color="white"
                rect2.color="black"
                textid1.color="white"
                doyout.color="white"
                clickhere.color="white"
                rect123.color="black"
                submitid.color="white"
                submitrect.color="black"
            } else {

                loginfull.color = "lightblue"
                loginmid.color = "gray"
                loggray.color="gray"
                gray1.color="gray"
                rectusernameid.color="#978cbd"
                 textid2.color="black"
                logintext.color="black"
                rect2.color="#978cbd"
                textid1.color="black"
                doyout.color="black"
                clickhere.color="black"
                rect123.color="lightblue"
                submitid.color="black"
                submitrect.color="green"
            }
        }


    Rectangle {
        id: loginfull
        width: parent.width
        height: parent.height
        anchors.centerIn: parent
        color: "lightblue"

        Rectangle {
            id: loginmid
            width: parent.width * 0.5
            height: parent.height * 0.7
            color: "gray"
            anchors.centerIn: parent
            radius:15
            border.width:2
            border.color:"black"
            Rectangle{
                id:loggray
                anchors.right: parent.right;anchors.rightMargin: 33
                anchors.bottom:parent.bottom;anchors.bottomMargin: 50
                width: parent.width/3
                height: parent.height/20
                color:"gray"

                Text{
                    id:invalidid
                    anchors.centerIn: parent
                    text:""
                    color:"red"
                }
            }

            Column {
                //x:20
                width: loginmid.width
                height: loginmid.height
                spacing: parent.width * 0.1
                //anchors.centerIn: parent
                Row {
                    width: parent.width
                    height: parent.height * 0.2
                    //anchors.horizontalCenter: parent.horizontalCenter
                    x:parent.width/23
                    //y:parent.height/10
                    Rectangle{
                        id:gray1
                        y:parent.height/10
                        width: parent.width-20
                        height: parent.height-2
                        color:"gray"
                        Text {
                            id:logintext
                            anchors.centerIn: parent
                            text: "Login"
                            font.pointSize: parent.height * 0.4
                            font.family:"Comic Sans MS"
                        }

                    }


                }

                Row {

                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.02
                    //anchors.leftMargin: parent.width * 0.2
                    anchors.left: parent.left; anchors.leftMargin: parent.width * 0.1

                    anchors.horizontalCenter: parent.horizontalCenter
                    Rectangle {
                        id:rectusernameid
                        x:parent.width*0.1
                        width: loginmid.width / 3
                        height: loginmid.height * 0.1
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id: textid2
                            anchors.centerIn: parent
                            text: "User Name :"
                            font.family: "Comic Sans MS"
                            font.pointSize: loginmid.width / 42
                        }
                    }
                    TextField {
                        id:usernamefield
                        placeholderText: "Enter your username"
                         font.pointSize: loginmid.width / 42
                    }
                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    spacing: parent.width * 0.02
                    anchors.left: parent.left; anchors.leftMargin: parent.width * 0.1
                    Rectangle {
                           id:rect2
                        x:parent.width*0.1
                        width: loginmid.width / 3
                        height: loginmid.height * 0.1
                        color: "#978cbd"
                        border.width:2
                        border.color:"black"
                        Text {
                            id: textid1
                            anchors.centerIn: parent
                            text: "Password :"
                            font.family: "Comic Sans MS"
                            font.pointSize: loginmid.width / 42
                        }
                    }
                    Row {
                        spacing: 5

                        TextField {
                            id: passwordField
                            placeholderText: "Enter your password"
                            font.pointSize: loginmid.width / 42
                            echoMode: passwordVisible ? TextInput.Normal : TextInput.Password
                            onTextChanged: {

                                if (text === "")
                                    passwordVisible = false;
                            }
                            Item {
                                width: 20
                                height: 20
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
                    x:parent.width/2.5
                    Button {
                        Rectangle{
                            id:submitrect
                            width:parent.width
                            height:parent.height
                            color:"green"
                            border.width:2
                            border.color:"black"
                            Text {
                                id: submitid
                                font.pointSize: parent.height * 0.4
                                anchors.centerIn: parent
                                text: qsTr("Submit")
                            }
                        }
                        //anchors.horizontalCenter: parent.horizontalCenter



                        onClicked: {
                            if(usernamefield.text===""||passwordField.text===""){
                                console.log("invalid input")
                                invalidid.text="Invalid Input"
                                //gotodetailspage()
                            }

                            else if(name2===usernamefield.text&&password2===passwordField.text){
                            gotodetailspage()
                                usernamefield.text="";passwordField.text=""
                                invalidid.text=""
                            loginpageid.visible=false
                            }else{
                            console.log("invalid id")
                                invalidid.text="Invalid Input"
                            }

                        }
                    }

                }

                Row {
                    width: parent.width
                    height: parent.height * 0.1
                    anchors.left: parent.left;anchors.leftMargin: 10
                    spacing:4
                    Text {
                        id:doyout
                        text: "Do you want to register now?"
                        font.pointSize: parent.height * 0.3
                    }

                    Rectangle{
                        id:rect123
                        width: parent.width/3
                        height: parent.height/2
                        color:"lightblue"
                        radius:20
                        border.width:2
                        border.color:"black"
                        Text{
                            id:clickhere
                            anchors.centerIn: parent
                            text:"Click Here"
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                goToRegistation1Page()
                                loginpageid.visible=false
                            }
                        }
                    }


                }





            }
        }
    }
}
