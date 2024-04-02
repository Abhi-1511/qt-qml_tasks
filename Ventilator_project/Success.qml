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
       interval: 1000 // 1 second
       running: successid.visible===true?true:false // Start the timer when needed
       repeat: true // Repeat the timer

       property int countdown: 5 // Initial countdown value

       onTriggered: {
           countdown--; // Decrement the countdown value
           if (countdown <= 0) {
               // Countdown reached zero, stop the timer
               countdownTimer.stop();
               successid.visible=false
               successid.enabled=false
               devicesettingsid.visible=true
               devicesettingsid.enabled=true
           }
       }
   }
}
