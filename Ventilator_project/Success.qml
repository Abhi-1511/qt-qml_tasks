import QtQuick 2.15
import QtQuick.Window 2.15


Item {
    width:mainwindowid.width/3.5
    height:mainwindowid.height/10
    anchors.centerIn: parent
   Rectangle{
       width:parent.width
       height:parent.height
       color:"#175574"
       anchors.centerIn: parent
       border.width:3
       border.color:"white"
       Text {
           anchors.centerIn: parent
           id: pleasewaittext
           text: qsTr("Authenticated")
           font.pointSize:parent.width*0.07
           font.bold:true
       }
   }
   Timer {
       id: countdownTimer
       interval: 1000
       running: successid.visible===true?true:false
       repeat: true
       property int countdown: 3
       onTriggered: {
           countdown--;
           if (countdown <= 0) {
               countdownTimer.stop();
               successid.visible=false
               successid.enabled=false
               devicesettingsid.visible=true
               devicesettingsid.enabled=true
                devicesettingsid.opacity=1
           }
       }
   }
}
