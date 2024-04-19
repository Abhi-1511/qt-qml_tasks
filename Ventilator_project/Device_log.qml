import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
// import com.ventilatorproject.tablemodel 1.0
// import com.ventilatorproject.tablemodel2 1.0

Item {
    id:itemid4
    width:mainwindowid.width
    height:mainwindowid.height
 signal gotomonlog()

    Rectangle{
        id:mainrect
        width:parent.width
        height:parent.height
        color:"black"
        Rectangle{
            id:toptextid
            width:parent.width/2
            height:parent.height/10
            anchors.left: parent.left;anchors.leftMargin: 50
            anchors.top: parent.top;anchors.topMargin: 10
            color:"black"
            Text {
                id: systemlogtextid
                text: qsTr("SYSTEM LOGS")
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 20
                font.bold: true
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {

                    systemlogtextid.font.bold=true
                    monitoringlogtextid.font.bold=false
                    systemline.visible=true
                    deviceline.visible=false
                    systemlogid.visible=true
                    systemlogid.enabled=true
                    monitoringlogid.visible=false
                    monitoringlogid.enabled=false
                    monitorlogid.visible=false
                    monitorlogid.enabled=false
                    systemlogids.visible=true
                    systemlogids.enabled=true
                }
            }

        }

        Rectangle{
            width:parent.width/2
            height:parent.height/10
            anchors.right: parent.right;anchors.rightMargin: 50
            anchors.top: parent.top;anchors.topMargin: 10
            color:"black"
            Text {
                id: monitoringlogtextid
                text: qsTr("MONITORING LOGS")
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 20
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    systemlogtextid.font.bold=false
                    monitoringlogtextid.font.bold=true
                    deviceline.visible=true
                    systemline.visible=false
                    systemlogid.visible=false
                    systemlogid.enabled=false
                    monitoringlogid.visible=true
                    monitoringlogid.enabled=true
                    monitorlogid.visible=true
                    monitorlogid.enabled=true
                    gotomonlog()
                    systemlogids.visible=false
                    systemlogids.enabled=false
                }
            }

        }

        Rectangle{
            id:lineid
            width: parent.width-100
            height:parent.height/80
            color:"gray"
            anchors.top:parent.top;anchors.topMargin: 60
            anchors.left: parent.left;anchors.leftMargin: 50
            anchors.right: parent.right;anchors.rightMargin: 50
            Rectangle{
                id:systemline
                width:parent.width/2
                height:parent.height
                anchors.left: parent.left
                anchors.top: parent.top;
                color:"blue"
            }
            Rectangle{
                id:deviceline
                width:parent.width/2
                height:parent.height
                anchors.right:parent.right
                anchors.top: parent.top;
                color:"blue"
                visible: false
            }

        }
        //table
        Rectangle {
            id: tablerect
            width: parent.width-100
            height: parent.height/1.4
            color: "black"
            border.width:2
            border.color: "white"
            radius:5
            anchors.top: lineid.bottom;anchors.topMargin: 10
            anchors.left: parent.left;anchors.leftMargin: 50
            anchors.right: parent.right;anchors.rightMargin: 50
            Rectangle{
                id:systemlogid
                width:parent.width
                height:parent.height
                color:"transparent"
                visible:true

            }



            Rectangle{
                id:monitoringlogid
                width:parent.width
                height:parent.height
                color:"transparent"
                visible:false

                //table


            }

        }
        // Rectangle{
        //     id:previousid
        //     width:parent.width/5
        //     height:parent.height/15
        //     color:"#0D5376"
        //     anchors.top: tablerect.bottom;anchors.topMargin: 10
        //     anchors.left:parent.left;anchors.leftMargin: 150
        //     radius: 10

        //     Text {
        //         id: previoustextid
        //         text: qsTr("Previous")
        //         anchors.centerIn: parent
        //         font.bold: true
        //         font.pointSize: 15
        //         color:"white"
        //     }
        //     MouseArea{
        //         anchors.fill:parent
        //         onClicked: {

        //         }
        //     }
        // }
        /*Rectangle{
            id:closeid
            width:parent.width/5
            height:parent.height/15
            color:"#DD735B"
            radius: 10
            anchors.top: tablerect.bottom;anchors.topMargin: 10
            anchors.horizontalCenter: parent.horizontalCenter
            Text {
                id: prevcloseid
                text: qsTr("Close")
                anchors.centerIn: parent
                font.bold: true
                font.pointSize: 15
                color:"white"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    devicelogid.visible=false
                    devicelogid.enabled=false
                    openscreenid.visible=true
                    openscreenid.enabled=true
                    monitorlogid.enabled=false
                    monitorlogid.visible=false
                    systemlogids.visible=false
                    systemlogids.enabled=false
                }
            }
        }*/

    }

}
