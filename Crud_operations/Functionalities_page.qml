import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    width:windowid.width
    height:windowid.height
    anchors.bottom:parent.bottom
    property int activitytype:0
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
        case 1:
            opacityAnimation.target=createRect
            opacityAnimation.from = createRect.opacity;
            opacityAnimation.to = 1;
            opacityAnimation.running = true;
            createRect.enabled=true
            insertRect.visible=false;insertRect.enabled=false
            deleteRect.visible=false;deleteRect.enabled=false
            updateRect.visible=false;updateRect.enabled=false
            console.log(activitytype)
            break;
        case 2:
            opacityAnimation.target=insertRect
            opacityAnimation.from = insertRect.opacity;
            opacityAnimation.to = 1;
            opacityAnimation.running = true;
            insertRect.enabled=true
            createRect.visible=false;createRect.enabled=false
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
            createRect.visible=false;createRect.enabled=false
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
            createRect.visible=false;createRect.enabled=false
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
            id: createRect
            width: parent.width
            height: parent.height
            anchors.centerIn: parent
            color:"transparent"
            border.width: 2
            border.color: "black"
            radius: 5
            visible:backend.lastUsedDatabase === ""
            opacity: 0.2
            Text {
                id: createtext
                text: qsTr("Hi There..! Do you want to create a table ")
                anchors.top:parent.top;anchors.topMargin: parent.height*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: parent.width * 0.025
            }
            TextField{
                anchors.top: createtext.bottom;anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                id:dbnameid
                placeholderText:"Type the table name here..."
                focus: true
            }
            TextField{
                anchors.top:dbnameid.bottom;anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                id:dbnameid1
                placeholderText:"Type the attribute here..."
                focus: true
            }
            TextField{

                anchors.top:dbnameid1.bottom;anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                id:dbnameid2
                placeholderText:"Type the attribute here..."
                focus: true
            }
            TextField{
                anchors.top:dbnameid2.bottom;anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                id:dbnameid3
                placeholderText:"Type the attribute here..."
                focus: true
            }
            TextField{
                anchors.top:dbnameid3.bottom;anchors.topMargin: 10
                anchors.horizontalCenter: parent.horizontalCenter
                id:dbnameid4
                placeholderText:"Type the attribute here..."
                focus: true
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
                    id: oktext1
                    text: qsTr("OK")
                    anchors.centerIn: parent
                    font.pointSize: parent.width * 0.1
                    color:"white"
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                         gotocrudpage()
                        backend.createTable(dbnameid.text,dbnameid1.text,dbnameid2.text,dbnameid3.text,dbnameid4.text)
                    }
                }
            }
        }
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
            Text {
                id: inserttext
                text: qsTr("Hi There..! Please fill the details...")
                anchors.top:parent.top;anchors.topMargin: parent.height*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: parent.width * 0.025
            }
            TextField{
                anchors.centerIn: parent
                id:dbinsertnameid
                placeholderText:"Type name here...!"
                focus: true
            }
            TextField{
                anchors.top: dbinsertnameid.bottom;anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                id:dbinsertpetnameid
                placeholderText:"Type pet name here...!"
                focus: true
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
                        comboModeldelete.append({name:dbinsertnameid.text})
                        comboModelupdate.append({name:dbinsertnameid.text})
                        onClicked: backend.insertData(dbinsertnameid.text,dbinsertpetnameid.text)
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
            Text {
                id: updatetext
                text: qsTr("Hi There..! Please update the details...")
                anchors.top:parent.top;anchors.topMargin: parent.height*0.2
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: parent.width * 0.025
            }
            ComboBox {
                id: comboBoxupdate
                anchors.centerIn: parent
                width: 200
                model: comboModelupdate
                currentIndex: 0 // Set the initial selected index
                ListModel {
                    id: comboModelupdate
                    ListElement { name: "default" }
                }
                onActivated: {
                    console.log("Selected index:", currentIndex) // Log the index of the selected item
                    console.log("Selected item:", currentText) // Log the text of the selected item
                }
            }
            TextField{
                anchors.top: comboBoxupdate.bottom;anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter
                id:dbupdatepetnameid
                placeholderText:"Type here pet name...!"
                focus: true
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
                        backend.updateData(comboBoxupdate.currentText,dbupdatepetnameid.text)
                        gotocrudpage()
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
