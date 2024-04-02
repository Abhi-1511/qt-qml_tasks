import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2


Item {
    id:itemid
    width: mainwindowid.width
    height: mainwindowid.height


    Header{}
    Rectangle{
        width:parent.width/5
        height:parent.height*0.89
        color:"black"
        anchors.right:parent.right
        anchors.bottom: parent.bottom
        Rectangle{
            id:peakRect
            width:parent.width
            height:parent.height/5
            anchors.top:parent.top;anchors.topMargin: 10

            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: peekpmtext
                text: qsTr("Peek P.")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.05
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: peekpmvalue
                text: "0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: peekpmtype
                text: qsTr("cmH2O")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.03
            }
        }
        Rectangle{
            id:breathRect
            width:parent.width
            height:parent.height/5
            anchors.top:peakRect.bottom;anchors.topMargin: 5

            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: breathmtext
                text: qsTr("Breath Rate")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.05
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: breathmvalue
                text: "0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: breathmtype
                text: qsTr("per min")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.03
            }
        }
        Rectangle{
            id:tvieRect
            width:parent.width
            height:parent.height/5
            anchors.top:breathRect.bottom ;anchors.topMargin: 2

            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: tviepmtext
                text: qsTr("TV(i/e)")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.05
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: tviepmvalue
                text: "0/0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.08
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: tviepmtype
                text: qsTr("mL")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.03
            }
        }
        Rectangle{
            id:pmRect
            width:parent.width/2
            height:parent.height/6
            anchors.top:tvieRect.bottom ;anchors.topMargin: 10

            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: pmtext
                text: qsTr("MV")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: pmvalue
                text: "0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.2
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: pmtype
                text: qsTr("L")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.06
            }
        }
        Rectangle{
            id:insptRect
            width:parent.width/2
            height:parent.height/6
            anchors.top:tvieRect.bottom ;anchors.topMargin: 10
            anchors.right: parent.right

            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: inspttext
                text: qsTr("Insp.T")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: insptvalue
                text: "0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.2
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: inspttype
                text: qsTr("sec")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.06
            }
        }
        Rectangle{
                    id:ieRect
                    width:parent.width/2
                    height:parent.height/5
                    anchors.bottom: parent.bottom

                    RadialGradient {
                        anchors.fill: parent
                        gradient: Gradient {
                            GradientStop { position: 0.0; color: "#89AAD3" }
                            GradientStop { position: 0.4; color: "black" }
                        }
                    }
                    Text {
                        anchors.top: parent.top;anchors.topMargin: -6
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: ietext
                        text: qsTr("I:E")
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.1
                    }
                    Text {
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        id: ievalue
                        text: "1:1"
                        color:"white"
                        font.bold: true
                        font.pointSize: parent.width*0.2
                    }

                }
        Rectangle{
            id:spontbrRect
            width:parent.width/2
            height:parent.height/5
            anchors.bottom: parent.bottom
            anchors.right:parent.right
            RadialGradient {
                anchors.fill: parent
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#89AAD3" }
                    GradientStop { position: 0.4; color: "black" }
                }
            }
            Text {
                anchors.top: parent.top;anchors.topMargin: -6
                anchors.horizontalCenter: parent.horizontalCenter
                id: spontbrtext
                text: qsTr("Spont BR")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.1
            }
            Text {
                anchors.verticalCenter: parent.verticalCenter
                anchors.horizontalCenter: parent.horizontalCenter
                id: spontbrvalue
                text: "0"
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.2
            }
            Text {
                anchors.bottom: parent.bottom;anchors.bottomMargin: 5
                anchors.horizontalCenter: parent.horizontalCenter
                id: spontbrtype
                text: qsTr("%")
                color:"white"
                font.bold: true
                font.pointSize: parent.width*0.06
            }
        }
    }
}
