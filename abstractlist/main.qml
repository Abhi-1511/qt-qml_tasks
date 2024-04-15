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
    Rectangle{
        width:parent.width
        height:parent.height
        color:"black"
    }

    Crud_screen{
        id:crudscreenid
        visible:true
        onGotoviewnow: {
            viewpageid.visible=true
            viewpageid.enabled=true
            crudscreenid.visible=false
        }

    }
    View_page{
        id:viewpageid
        visible:false
    }
    Edit_page{
        id:editpageid
        visible:false
        enabled:false
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
    Popup{
        id:popupid
        visible:false
    }

    Component.onCompleted: {
        crudscreenid.gotofunctionpage.connect(functionpageid.fromcrudscreencreate)
    }
}
