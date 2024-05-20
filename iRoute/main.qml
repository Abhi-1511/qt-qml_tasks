import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 5.15

ApplicationWindow {
    id: windowid
    visible: true
    width: 840
    height: 500
    title: "Route Details"
    color: "black"
    property var routeModel: ""
    property int currentIndex: 0
    property var audioname:""

    ListView {
        id:list1
        visible:popup.visible===true?false:true
        width:parent.width*0.4
        height:parent.height*0.6
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.3
        anchors.top: parent.top
        anchors.topMargin: 110
        model: findRoute.getRouteInfo().filter(function(item) { return item.trim().length > 0; })
        delegate: Item {
            width: ListView.view.width
            height: windowid.height * 0.1
            Rectangle {
                width: parent.width
                height: parent.height
                color: "blue" // background color
                border.color: "black"
                border.width: 1
                radius: 5
                Text {
                    text: modelData
                    font.pixelSize: 18
                    padding: 10
                    color:"white"
                    font.bold: true
                    anchors.centerIn: parent
                    //anchors.fill: parent
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    routeModel = modelData
                }
            }
        }
    }

    Text {
        id: heading
        visible:popup.visible===true?false:true
        text: qsTr("SELECT BUS ROUTE")
        font.pointSize: (parent.height + parent.width) * 0.02
        color:"white"
        font.bold:true
        anchors.left: parent.left
        anchors.leftMargin: parent.width * 0.29
        anchors.top: parent.top
        anchors.topMargin: parent.height * 0.1
    }


    ListView {
        id: routeDetailsList
        width: parent.width * 0.4
        height: parent.height*0.6
        anchors.top: parent.top
        anchors.right: parent.right;anchors.rightMargin: 20
        anchors.topMargin: parent.height*0.27

        model: []
        delegate: Item {
            width: ListView.view.width
            height: windowid.height * 0.1
            Rectangle {
                width: parent.width
                height: parent.height
                color: "blue" // background color
                border.color: "black"
                border.width: 1
                radius: 5
                Text {
                    text: modelData.substring(5)
                    font.pixelSize: 18
                    padding: 10
                    color:"white"
                    font.bold: true
                    anchors.centerIn: parent
                }
            }
        }

        Connections {
            target: windowid
            function onRouteModelChanged() {
                popup.visible=true
                list1.visible=false
                heading.visible=false
                stop.visible=true
                routeDetailsList.model = findRoute.getRouteDetails(routeModel).split(", ")
            }
        }
    }
    Rectangle{
        id:stop
        visible:false
        width: parent.width * 0.32
        height: parent.height*0.1
        anchors.top: parent.top
        anchors.right: parent.right;anchors.rightMargin: 65
        anchors.topMargin:  parent.height * 0.06
        color:"black"

        Text {
            id: heading2
            text: qsTr("STOPS")
            font.pointSize: (windowid.height + windowid.width) * 0.02
            anchors.centerIn: parent
            color:"white"
            font.bold:true
        }
    }
    Image {
        id: home
        width:40
        height:40
        source: "file:///C:/Users/Abhi/Desktop/DigitalShark Technologies/vent_pics/home.png"
        MouseArea{
            anchors.fill:parent
            onClicked: {
                list1.visible=true
                heading.visible=true
                popup.visible=false
                routeDetailsList.model =""
                stop.visible=false
            }
        }
    }
    Rectangle{
        id:popup
        visible:false
        anchors.left:parent.left;anchors.leftMargin: 25
        anchors.top:parent.top;anchors.topMargin: 100
        width:parent.width*0.5
        height:parent.height*0.6
        color:"lightblue"
        border.width:4
        border.color:"#3e4bb8"
        Text {
            id: routeName
            text: routeModel
            anchors.top:parent.top;anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 25
        }
        Rectangle{
            width:100
            height:40
            anchors.bottom: parent.bottom;anchors.bottomMargin: 50
            anchors.left: parent.left;anchors.leftMargin: 50
            color:"gray"
            radius:20
            Text {
                id: prev
                text: qsTr("Previous")
                anchors.centerIn: parent
                font.pointSize: 16
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    if (currentIndex > 0) {
                        currentIndex--
                    }
                }
            }
        }
        Rectangle{
            width:100
            height:40
            anchors.bottom: parent.bottom;anchors.bottomMargin: 50
            anchors.right: parent.right;anchors.rightMargin: 50
            color:"gray"
            radius:20
            Text {
                id: next
                text: qsTr("Next")
                anchors.centerIn: parent
                font.pointSize: 16
            }
            MouseArea{
                anchors.fill:parent
                onClicked: {
                    if (currentIndex < routeRepeater.count -1) {
                        currentIndex++
                    }
                    console.log(routeModel)
                    console.log(routeRepeater.model[currentIndex])
                    var audioFiles = findRoute.getAudioFilez(routeModel,routeRepeater.model[currentIndex])
                    if (audioFiles) {
                        audioname = audioFiles
                        console.log(audioFiles)
                        console.log(audioname)
                        mediaPlayer.play()
                        //mediaPlayer.source = audioFiles[1]

                        //mediaPlayer.source = audioFiles[2]
                    } else {
                        console.log("No audio files found for the selected route")
                    }
                }
            }
        }


        Row {
            id: routeDetailsRow
            width: parent.width * 0.9
            height: parent.height * 0.2
            anchors.centerIn: parent
            spacing: 10

            Repeater {
                id: routeRepeater
                model: []

                Rectangle {
                    width: routeDetailsRow.width
                    height: routeDetailsRow.height
                    color: "blue"
                    border.color: "black"
                    border.width: 1
                    radius: 5
                    visible: index >= currentIndex && index < currentIndex + 1


                    Text {
                        id:routenametext
                        text: modelData
                        font.pixelSize: 18
                        padding: 10
                        font.bold: true
                        color: "white"
                        anchors.centerIn: parent
                    }
                }
            }
        }

        MediaPlayer {
            id: mediaPlayer
            autoPlay: true
            source: "file:///C:/Users/Abhi/Downloads/iRoute_Folder/iRoute/Audio/"+audioname

        }

        Connections {
            target: windowid
            function onRouteModelChanged() {
                popup.visible = true
                list1.visible = false
                heading.visible = false
                routeRepeater.model = findRoute.getRouteDetails(routeModel).split(", ")
                currentIndex = 0
            }
        }
    }
}
