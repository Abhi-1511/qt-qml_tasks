import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2

Item {
    width:mainwindowid.width
    height:mainwindowid.height
    Rectangle{
        id:flashrect
        width:parent.width
        height:parent.height
        color:"black"
        Image {
            width:parent.width*0.8
            height:parent.height*0.8
            source: "file:///C:/Users/Abhi/Desktop/welcome.png"
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
        }
    }
}
