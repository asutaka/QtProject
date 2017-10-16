import QtQuick 2.0
import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0
import CommonControl 1.0

Item {
    id: bottomBarParameterSetting
    property string imgBackground: "image://MyProvider/contbar_btn_112.png"
    property string imgBackgroundActived: "image://MyProvider/contbar_btn_touched_112.png"
    property string icBack: "image://MyProvider/contbar_icon_back.png"
    property string textBtnBack: bottomBarVM.txtBtnBack
    property string textBtnSwitch: bottomBarVM.txtBtnSwitch
    property string textBtnInfo: bottomBarVM.txtBtnInfo
    property string textBtnInput: bottomBarVM.txtBtnInput
    property color titleColor: "#fff"

    property Item objParamSettingBottomBar: _rectBottom
    property BottomBarParamSettingVM bottomBarVM: _bottomBarVM

    BottomBarParamSettingVM {
        id: _bottomBarVM
    }

    Rectangle {
        id: _rectBottom
        width: 1024
        height: 64
        color: "#000"
        Image {
            id: imgBgr
            x: 0
            y: 0
            source: "image://MyProvider/ControlBar_bg.png"
        }

        ImageButtonControl {
            id: iBtnBack
            x: 0
            y: 0
            width: 104
            height: 64
            imgSourceBg: "image://MyProvider/contbar_btn_104.png"
            imgSourceActive: "image://MyProvider/contbar_btn_touched_104.png"
            imgSourceIcon: icBack
            wIcon: 25
            hIcon: 25
            imgIconLeftMargin: (iBtnBack.width / 2) - (iBtnBack.wIcon / 2)
            imgIconTopMargin: 8
            txtButton: textBtnBack
            colorText: titleColor
            fontText.family: "MS Gothic"
            fontText.pixelSize: 27
            textAlignV: Text.AlignBottom
            textAlignH: Text.AlignHCenter
            onClicked: {
                mainModel.GoBackScreen()
            }
        }

        ImageButtonControl {
            id: iBtnSwitch
            x: 105
            y: 0
            width: 104
            height: 64
            imgSourceBg: imgBackground
            imgSourceActive: imgBackgroundActived
            txtButton: textBtnSwitch
            colorText: titleColor
            fontText.family: "MS Gothic"
            fontText.pixelSize: 27
            textAlignV: Text.AlignBottom
            textAlignH: Text.AlignHCenter
            Image {
                id: imgDis1
                x: 35
                y: 8
                height: 16
                width: 16
                source: "image://MyProvider/dispswitchbtnno1.png"
            }
            Image {
                id: imgDis2
                x: 52
                y: 8
                width: 16
                height: 16
                source: "image://MyProvider/Icon_Screen_2_on.png"
            }
            onClicked: {
                loaderContent.item.objSettingContent.changeModeDisplay()
                if (imgDis1.source == Qt.resolvedUrl("image://MyProvider/dispswitchbtnno1.png")) {
                    imgDis1.source = "image://MyProvider/Icon_Screen_1_on.png"
                    imgDis2.source = "image://MyProvider/dispswitchbtnno2.png"
                } else {
                    imgDis1.source = "image://MyProvider/dispswitchbtnno1.png"
                    imgDis2.source = "image://MyProvider/Icon_Screen_2_on.png"
                }
            }
        }

        ImageButtonControl {
            id: iBtnInfo
            x: 610
            y: 0
            width: 168
            height: 62
            imgSourceBg: "image://MyProvider/contbar_btn_168.png"
            imgSourceActive: "image://MyProvider/contbar_btn_touched_168.png"
            imgSourceIcon: "image://MyProvider/contbar_icon_infomation.png"
            wIcon: 32
            hIcon: 32
            imgIconLeftMargin: 10
            imgIconTopMargin: (64 / 2) - (hIcon / 2)
            txtButton: textBtnInfo
            colorText: titleColor
            fontText.family: "MS Gothic"
            fontText.pixelSize: 27
            textAlignV: Text.AlignVCenter
            textLeftMargin: 50
            onClicked: {
                loaderContent.item.objSettingContent.showInfo()
            }
        }

        ImageButtonControl {
            id: iBtnInput
            x: 780
            y: 0
            width: 168
            height: 62
            imgSourceBg: "image://MyProvider/contbar_btn_168.png"
            imgSourceActive: "image://MyProvider/contbar_btn_touched_168.png"
            imgSourceIcon: "image://MyProvider/contbar_icon_select.png"
            wIcon: 32
            hIcon: 32
            imgIconLeftMargin: 10
            imgIconTopMargin: (64 / 2) - (hIcon / 2)
            txtButton: textBtnInput
            colorText: titleColor
            fontText.family: "MS Gothic"
            fontText.pixelSize: 27
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignHCenter
            onClicked: {

            }
        }
    }

    Component.onCompleted: {
        if (loaderContent.source == Qt.resolvedUrl("qrc:/ParameterSetting/ParameterSettingv2.qml")) {
            iBtnSwitch.visible = false
        }
        mainModel.onChangeLanguage.connect(updateText)
        updateText()
    }

    function updateText() {
        bottomBarVM.onUpdateLang()
        textBtnBack = bottomBarVM.txtBtnBack
        textBtnSwitch = bottomBarVM.txtBtnSwitch
        textBtnInfo = bottomBarVM.txtBtnInfo
        textBtnInput = bottomBarVM.txtBtnInput
    }
}





