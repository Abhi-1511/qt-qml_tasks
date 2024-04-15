import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Item {
    id:itemid4
    width:mainwindowid.width
    height:mainwindowid.height
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
                    devicelogtextid.font.bold=false
                    systemline.visible=true
                    deviceline.visible=false
                    systemlogid.visible=true
                    systemlogid.enabled=true
                    monitoringlogid.visible=false
                    monitoringlogid.enabled=false

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
                id: devicelogtextid
                text: qsTr("DEVICE LOGS")
                anchors.centerIn: parent
                color: "white"
                font.pointSize: 20
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    systemlogtextid.font.bold=false
                    devicelogtextid.font.bold=true
                    deviceline.visible=true
                    systemline.visible=false
                    systemlogid.visible=false
                    systemlogid.enabled=false
                    monitoringlogid.visible=true
                    monitoringlogid.enabled=true
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

                TableView{
                    id: detailsTable
                    anchors.centerIn: parent
                    width:parent.width
                    height:parent.height
                    clip: true
                    y:parent.height*0.1
                    style: TableViewStyle {
                        backgroundColor: "black"
                        alternateBackgroundColor: "black"
                        headerDelegate: Rectangle {
                            color: "lightgray"
                            border.width: 2
                            border.color: "white"
                        }
                    }
                    rowDelegate: Rectangle {
                        height: 40
                        color: "black"

                    }
                    model: ListModel {
                        id: detailsModel
                        ListElement {
                            timestamp:"Time Stamp"
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                            parametervalue2: "Parameter Value2"
                            parametervalue3: "Parameter Value3"

                        }
                        ListElement {
                            timestamp:"Time Stamp "
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                            parametervalue2: "Parameter Value2"
                            parametervalue3: "Parameter Value3"

                        }
                        ListElement {
                            timestamp:"Time Stamp "
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                            parametervalue2: "Parameter Value2"
                            parametervalue3: "Parameter Value3"

                        }
                        ListElement {
                            timestamp:"Time Stamp "
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                            parametervalue2: "Parameter Value2"
                            parametervalue3: "Parameter Value3"

                        }
                        ListElement {
                            timestamp:"Time Stamp "
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                            parametervalue2: "Parameter Value2"
                            parametervalue3: "Parameter Value3"

                        }
                        ListElement {
                            timestamp:"Time Stamp "
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                            parametervalue2: "Parameter Value2"
                            parametervalue3: "Parameter Value3"

                        }
                        ListElement {
                            timestamp:"Time Stamp "
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                            parametervalue2: "Parameter Value2"
                            parametervalue3: "Parameter Value3"

                        }


                    }
                    TableViewColumn {
                        role: "timestamp"
                        //title: "Name"

                        width: detailsTable.width / 5

                        delegate: Rectangle {
                            width: parent.width
                            height: detailsTable.rowHeight
                            color: "black"
                            //radius: 10
                            border.width:1
                            border.color:"black"
                            Text {
                                anchors.centerIn: parent
                                text: "Time Stamp"
                                color:"white"
                            }
                        }
                    }
                    TableViewColumn {
                        role: "parameterid"
                        width: detailsTable.width / 5
                        delegate: Rectangle {
                            width: parent.width
                            height: detailsTable.rowHeight
                            color: "black"
                            Text {
                                anchors.centerIn: parent
                                text: "Parameter ID"
                                  color:"white"
                            }
                        }
                    }
                    TableViewColumn {
                        role: "parametervalue"
                        //title: "Pet Name"
                        width: detailsTable.width / 5
                        delegate: Rectangle {
                            width: parent.width
                            height: detailsTable.rowHeight
                            color: "black"
                            //radius: 10
                            border.width:1
                            border.color:"black"
                            Text {
                                anchors.centerIn: parent
                                text:"Parameter Value"
                                  color:"white"
                            }
                        }
                    }
                    TableViewColumn {
                        role: "parametervalue2"
                        //title: "Pet Name"
                        width: detailsTable.width / 5
                        delegate: Rectangle {
                            width: parent.width
                            height: detailsTable.rowHeight
                            color: "black"
                            //radius: 10
                            border.width:1
                            border.color:"black"
                            Text {
                                anchors.centerIn: parent
                                text:"Parameter Value"
                                  color:"white"
                            }
                        }
                    }
                    TableViewColumn {
                        role: "parametervalue3"
                        //title: "Pet Name"
                        width: detailsTable.width / 5
                        delegate: Rectangle {
                            width: parent.width
                            height: detailsTable.rowHeight
                            color: "black"
                            //radius: 10
                            border.width:1
                            border.color:"black"
                            Text {
                                anchors.centerIn: parent
                                text:"Parameter Value"
                                  color:"white"
                            }
                        }
                    }


                }

            }
            Rectangle{
                id:monitoringlogid
                width:parent.width
                height:parent.height
                color:"transparent"
                visible:false

                TableView{
                    id: detailsTable2
                    anchors.centerIn: parent
                    width:parent.width
                    height:parent.height
                    clip: true
                    y:parent.height*0.1
                    style: TableViewStyle {
                        backgroundColor: "black"
                        alternateBackgroundColor: "black"
                        headerDelegate: Rectangle {
                            color: "black"
                            border.color: "white"
                        }
                    }
                    rowDelegate: Rectangle {
                        height: 30
                        color: "black"

                    }
                    model: ListModel {
                        id: detailsModel2
                        ListElement {
                            timestamp:"Time Stamp"
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                        }
                        ListElement {
                            timestamp:"Time Stamp"
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                        }
                        ListElement {
                            timestamp:"Time Stamp"
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                        }
                        ListElement {
                            timestamp:"Time Stamp"
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                        }
                        ListElement {
                            timestamp:"Time Stamp"
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                        }
                        ListElement {
                            timestamp:"Time Stamp"
                            parameterid: "Parameter ID"
                            parametervalue: "Parameter Value"
                        }



                    }
                    TableViewColumn {
                        role: "timestamp"
                        //title: "Name"

                        width: detailsTable2.width / 3

                        delegate: Rectangle {
                            width: parent.width
                            height: detailsTable2.rowHeight
                            color: "black"
                            //radius: 10
                            border.width:1
                            border.color:"black"
                            Text {
                                anchors.centerIn: parent
                                text: "Time Stamp"
                                color:"white"
                            }
                        }
                    }
                    TableViewColumn {
                        role: "parameterid"
                        width: detailsTable2.width / 3
                        delegate: Rectangle {
                            width: parent.width
                            height: detailsTable2.rowHeight
                            color: "black"
                            //radius: 10
                            border.width:1
                            border.color:"black"
                            Text {
                                anchors.centerIn: parent
                                text: "Parameter ID"
                                  color:"white"
                            }
                        }
                    }
                    TableViewColumn {
                        role: "parametervalue"

                        width: detailsTable2.width / 3
                        delegate: Rectangle {
                            width: parent.width
                            height: detailsTable2.rowHeight
                            color: "black"
                            //radius: 10
                            border.width:1
                            border.color:"black"
                            Text {
                                anchors.centerIn: parent
                                text:"Parameter Value"
                                  color:"white"
                            }
                        }
                    }


                }

            }

        }
        Rectangle{
            id:previousid
            width:parent.width/5
            height:parent.height/15
            color:"#0D5376"
            anchors.top: tablerect.bottom;anchors.topMargin: 10
            anchors.left:parent.left;anchors.leftMargin: 150
            radius: 10

            Text {
                id: previoustextid
                text: qsTr("Previous")
                anchors.centerIn: parent
                font.bold: true
                font.pointSize: 15
                color:"white"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {

                }
            }
        }
        Rectangle{
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
                }
            }
        }
        Rectangle{
            id:nextid
            width:parent.width/5
            height:parent.height/15
            color:"green"
            anchors.top: tablerect.bottom;anchors.topMargin: 10
            anchors.right:parent.right;anchors.rightMargin: 150
            radius: 10
            Text {
                id: nexttextid
                text: qsTr("Next")
                anchors.centerIn: parent
                font.bold: true
                font.pointSize: 15
                color:"white"
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {

                }
            }
        }
    }

}
