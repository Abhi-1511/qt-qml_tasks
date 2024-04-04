import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:mainwindowid
    width: 1000
    height: 500
    visible: true
    title: qsTr("Hello World")
     Flashscreen{
        id:flashscreenid
        visible:true
        enabled:true
    }

    Open_screen{
        id:openscreenid
        visible: false
        enabled: false
        Header{
            id:headerid
            onShownotifications: {
                alarmpopupid.visible=true
                alarmpopupid.enabled=true
                openscreenid.visible=false
                openscreenid.enabled=false
            }
            onGotograph: {
                openscreenid.visible=false
                openscreenid.enabled=false
                graphid.visible=true
                graphid.enabled=true
            }
        }
        onOpenmodepcv: {
            modepcvid.visible=true
            modepcvid.enabled=true
            openscreenid.visible=false
            openscreenid.enabled=false
        }
        onGotopopuplock: {
            //openscreenid.visible=false
            openscreenid.enabled=false
            popuplockid.visible=true
            popuplockid.enabled=true
            headerid.enabled=false
        }
        onGotopopupunlock: {
            headerid.enabled=true
            openscreenid.enabled=false
            popupunlockid.visible=true
            popupunlockid.enabled=true
        }
        onGotocalibrationpopup: {
            popUpCalibrationid.visible=true
            popUpCalibrationid.enabled=true
            openscreenid.visible=true
            openscreenid.enabled=false
        }
        onGotovaluepage: {
            valuepageid.visible=true
            valuepageid.enabled=true
            openscreenid.enabled=false
        }
        onGotosaveprofile: {
            openscreenid.visible=false
            openscreenid.enabled=false
            saveprofileid.enabled=true
            saveprofileid.visible=true

        }
        onGotoremoveprofile: {
            openscreenid.visible=false
            openscreenid.enabled=false
            deleteprofileid.enabled=true
            deleteprofileid.visible=true

        }
        onGotodevicelogpage: {
            openscreenid.visible=false
            openscreenid.enabled=false
            devicelogid.visible=true
            devicelogid.enabled=true
        }
        onGotodevicesettings:{
            openscreenid.visible=false
            openscreenid.enabled=false
            devicesettingsid.visible=true
            devicesettingsid.enabled=true
        }
        // onGotoholdpage: {
        //     openscreenid.enabled=false
        //     holdid.visible=true
        // }
    }
    Modepcv{
        id:modepcvid
        visible:false
        onGotoopenscreen:{
            modepcvid.visible=false
            modepcvid.enabled=false
            openscreenid.visible=true
            openscreenid.enabled=true
        }
    }
    PopUp_Lock{
        id:popuplockid
        visible:false
        onGotoopenscreen: {
            openscreenid.visible=true
            openscreenid.enabled=true
            popuplockid.visible=false
            popuplockid.enabled=false
            headerid.enabled=false
        }
    }
    PopUp_Unlock{
        id:popupunlockid
        visible:false
        onGotoopenscreenlock: {
            openscreenid.visible=true
            openscreenid.enabled=true
            popupunlockid.visible=false
            popupunlockid.enabled=false
            headerid.enabled=true

        }
    }
    PopUp_Calibration{
        id:popUpCalibrationid
        visible:false
        onGotoopenscreen: {
            openscreenid.visible=true
            openscreenid.enabled=true
            popUpCalibrationid.visible=false
            popUpCalibrationid.enabled=false
        }

    }
    Graph{
        id:graphid
        visible:false
        enabled:false
    }
    Value_page{
        id:valuepageid
        visible:false
        onGotoopenscreen:{
            openscreenid.visible=true
            openscreenid.enabled=true
            valuepageid.visible=false
            valuepageid.enabled=false
        }

    }
    Save_profile_popup{
        id:saveprofileid
        visible:false
        onGotoopenscreen: {
            openscreenid.visible=true
            openscreenid.enabled=true
            saveprofileid.visible=false
            saveprofileid.enabled=false
        }
        onGotoheader: {
            headerid.appendvalue(str)
            deleteprofileid.appendvalue(str)
            saveprofileid.visible=false
            saveprofileid.enabled=false
            openscreenid.visible=true
            openscreenid.enabled=true
        }
    }
    Delete_profile_popup{
        id:deleteprofileid
        visible:false
        onGotoopenscreen: {
            openscreenid.visible=true
            openscreenid.enabled=true
            deleteprofileid.visible=false
            deleteprofileid.enabled=false
        }
        onGotoheader: {
            headerid.deletevalue(removeid)
            openscreenid.visible=true
            openscreenid.enabled=true
            deleteprofileid.visible=false
            deleteprofileid.enabled=false
        }
    }
    Alarm_popup{
        visible:false
        id:alarmpopupid
        onGotoopenscreen: {
            openscreenid.visible=true
            openscreenid.enabled=true
            alarmpopupid.visible=false
            alarmpopupid.enabled=false
        }

    }
    Device_log{
        id:devicelogid
        visible:false
    }
    Device_settings{
        id:devicesettingsid
        visible:false
        onGotosuccesspage: {
            devicesettingsid.opacity=0.8
            devicesettingsid.enabled=false
            successid.visible=true
            successid.enabled=true
        }
    }
    Success{
        id:successid
        visible:false
        enabled:false
    }

    Value_change_popup{
        id:valuechangepopupid
        visible:false
        onGotoopenscreen: {
            valuechangepopupid.visible=false
            valuechangepopupid.enabled=false
            openscreenid.visible=true
            openscreenid.enabled=true
        }
    }

    Slider_valuepopup{
        id:slidepopupid
        visible:false
        enabled: false

    }

    Slider_screen{
        id:slideid
        visible:false
    }
    Graph_setting{
        id:graphsettingspage
        visible: false
        enabled:false

    }
    Component.onCompleted:{
        popuplockid.gotoopenscreenlock.connect(openscreenid.unlockscreen)
        popupunlockid.gotoopenscreen.connect(openscreenid.unlockscreenoncancel)
        openscreenid.gotovaluepage.connect(valuepageid.openvaluedrawer)
        openscreenid.openvaluechangepopup.connect(valuechangepopupid.assignedvalues)
        valuechangepopupid.gotoopenscreen.connect(openscreenid.alotedvalue)
        valuepageid.openvaluechangepopup.connect(valuechangepopupid.assignedvalues)
        valuechangepopupid.gotoopenscreen.connect(valuepageid.alotedvalue)
        slideid.gotosliderpopup.connect(slidepopupid.getvalues)
        slidepopupid.gobacktoslidescreen.connect(slideid.getingvalues)
        openscreenid.gotovaluepage.connect(valuepageid.signalfromopenscreen)
        graphid.gotovaluepagefromgraph.connect(valuepageid.signalfromgraph)
    }

    // //Hold{}
 //Device_settings{}
    //Graph{}
 }


