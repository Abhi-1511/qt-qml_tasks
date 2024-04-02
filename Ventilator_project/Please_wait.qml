import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

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
           text: qsTr("Please Wait...")
           font.pointSize:parent.width*0.07
           font.bold:true
       }
   }
}
