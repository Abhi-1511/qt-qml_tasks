import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:mainwindowid
    width: 1000
    height: 500
    visible: true
    title: qsTr("Hello World")

    Open_screen{
        id:openscreenid
        onOpenmodepcv: {
            modepcvid.visible=true
            modepcvid.enabled=true
        }
        onGotopopuplock: {
            openscreenid.visible=false
            openscreenid.enabled=false
            popuplockid.visible=true
            popuplockid.enabled=true
        }
        onGotopopupunlock: {
            openscreenid.visible=false
            openscreenid.enabled=false
            popupunlockid.visible=true
            popupunlockid.enabled=true
        }
        onGotocalibrationpopup: {
            popUpCalibrationid.visible=true
            popUpCalibrationid.enabled=true
        }
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
        }
    }
    PopUp_Unlock{
        id:popupunlockid
        visible:false
        onGotoopenscreen: {
            openscreenid.visible=true
            openscreenid.enabled=true
            popupunlockid.visible=false
            popupunlockid.enabled=false
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
    Component.onCompleted:{
        popuplockid.gotoopenscreenlock.connect(openscreenid.unlockscreen)
        popupunlockid.gotoopenscreenlock.connect(openscreenid.unlockscreen)
    }

}
