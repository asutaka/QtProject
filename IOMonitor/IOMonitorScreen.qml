import QtQuick 2.0
import ControlApp 1.0
import CommonControl 1.0

Item {
    property IOMonitorScreenVM ioMonitorVM: ioMonitorScreenVM

    IOMonitorScreenVM {
        id: ioMonitorScreenVM
    }

    IOMonitorScreenControl {
        id: ioMonitorScreenCtrl
        width: 1024
        height: 640
    }

    TK_Label {
        id: lblSampCycleTitle
        locationX: 407
        locationY: 8
        sWidth: 600
        sHeight: 40
        borderWidth: 1
        borderRadius: 5
    }

    TK_Label {
        id: lblSapCycleUnit
        locationX: lblSampCycleTitle.locationX + lblSampCycleTitle.sWidth - lblSapCycleUnit.sWidth
        locationY: lblSampCycleTitle.locationY
        sWidth: 50
        sHeight: lblSampCycleTitle.sHeight
        textAlignH: Text.AlignLeft
    }

//    TK_TextBox {
//        id: lblSapCycleValue
//        x: lblSampCycleTitle.locationX + lblSampCycleTitle.sWidth - lblSapCycleUnit.sWidth - lblSapCycleValue.sWidth
//        y: lblSampCycleTitle.locationY
//    }

    TK_Label {
        id: lblSapCycleValue
        locationX: lblSampCycleTitle.locationX + lblSampCycleTitle.sWidth - lblSapCycleUnit.sWidth - lblSapCycleValue.sWidth
        locationY: lblSampCycleTitle.locationY
        sWidth: lblSapCycleUnit.sWidth + 30
        sHeight: lblSampCycleTitle.sHeight
        textAlignH: Text.AlignRight
    }

    Component.onCompleted: {
        ioMonitorVM.onLoad()
        updateText()
        updateValue()
        ioMonitorVM.onUpdateValue.connect(updateValue)
    }

    function updateValue() {
        ioMonitorScreenCtrl.sampCycleValue = ioMonitorVM.sampCycleValue

        ioMonitorScreenCtrl.update()
    }

    function updateText() {
        ioMonitorVM.onChangeLanguage();

        ioMonitorScreenCtrl.signalNumber = ioMonitorVM.signalNumber
        ioMonitorScreenCtrl.chanelMax = ioMonitorVM.chanelMax
        ioMonitorScreenCtrl.fontText = ioMonitorVM.fontText

        lblSampCycleTitle.fontText = ioMonitorVM.fontText
        lblSapCycleUnit.fontText = ioMonitorVM.fontText
        lblSapCycleValue.fontText = ioMonitorVM.fontText
        lblSampCycleTitle.strValue = ioMonitorVM.txtSampCycleTitle
        lblSapCycleUnit.strValue = ioMonitorVM.txtSampCycleUnit
        lblSapCycleValue.strValue = ioMonitorVM.txtSampCycleValue


        ioMonitorScreenCtrl.update()
    }
}
