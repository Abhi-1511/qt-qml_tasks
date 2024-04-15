import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import QtQuick.Controls.Material 2.15

import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtGraphicalEffects 1.12
import QtQuick.Controls 1.4
import QtQuick 2.2


Window {
    id:windowid
    visible: true
    width: 800
    height: 600
    title: "Rectangle Container"
    Crud_screen{
        id:crudscreenid
        visible:true
    }
    Functionalities_page{
        id:functionpageid
        visible:false
        onGotocrudpage: {
            crudscreenid.visible=true
            crudscreenid.enabled=true
            functionpageid.visible=false
            functionpageid.enabled=false
            crudscreenid.opacity=1
        }
    }
    Back_button{
        visible:false
    }
    Component.onCompleted: {
        crudscreenid.gotofunctionpage.connect(functionpageid.fromcrudscreencreate)
    }
}
