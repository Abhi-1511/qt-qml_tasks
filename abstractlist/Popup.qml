import QtQuick 2.15
import QtQuick.Window 2.15


Item {
    width:300
    height:100
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
           text: qsTr("Database opened successfully")
           font.pointSize:parent.width*0.04
           font.bold:true
       }
   }
   Timer {
       id: countdownTimer
       interval: 1000
       running: popupid.visible===true?true:false
       repeat: true
       property int countdown: 3
       onTriggered: {
           countdown--;
           if (countdown <= 0) {
               countdownTimer.stop();
               crudscreenid.opacity=1
               popupid.visible=false
           }
       }
   }
}
