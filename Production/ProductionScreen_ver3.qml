import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0
import CommonControl 1.0
import Frame 1.0

Rectangle {
    color: "black"
    anchors.fill: parent
    property ProductionScreenVM_ver3 productionVM: prodVM

    TK_ProductionFrame {
        id: productionFrame
        anchors.fill: parent

        ProductionScreenVM_ver3 {
            id: prodVM
        }

        ProductionScreenControl_ver3 {
            id: productionVer3
            x: 0
            y: productionFrame.com3B.y + productionFrame.com3B.height + 3
            width: parent.width
            height: parent.height-productionFrame.com3B.height - 3
        }

        ImageButtonControl {
            id: zeroset_discrmark
            x: 507
            y: 392
            width: 32
            height: 16
            imgSourceBg: "image://MyProvider/zeroset_discrmark.png"
            imgSourceActive: "image://MyProvider/zeroset_discrmark.png"
        }


        ImageButtonControl {
            id: zeroset
            x: 909
            y: zeroset_discrmark.y
            width: 92
            height: 54
            imgSourceBg: "image://MyProvider/zeroset_off_92_54.png"
            imgSourceActive: "image://MyProvider/zeroset_on_92_54.png"
            textAlignH: Text.AlignHCenter
            textAlignV: Text.AlignBottom
        }
    }

    Component.onCompleted: {
        productionVM.onLoad();
        mainModel.onChangeLanguage.connect(updateText);
        productionVM.updateValue.connect(updateValue)
        updateText()
        updateValue()
    }

    Component.onDestruction: {
        mainModel.onChangeLanguage.disconnect(updateText)
        productionVM.updateValue.disconnect(updateValue)
    }

    function updateValue() {
        productionFrame.updateValue(productionVM)

        productionVer3.widtMassBar = productionVM.widtMassBar
        productionVer3.maxLine = productionVM.maxLine
        productionVer3.imgMassBarGraphBgk = productionVM.imgMassBarGraphBgk
        productionVer3.imgMassBarGraph = productionVM.imgMassBarGraph
        productionVer3.imgBarLimit = productionVM.imgBarLimit
        productionVer3.imgAverage = productionVM.imgAverage
        productionVer3.imgDetect = productionVM.imgDetect
        productionVer3.imgLineBkg = productionVM.imgLineBkg
        productionVer3.imgLineResult = productionVM.imgLineResult
        productionVer3.txtMeasureUnit = productionVM.txtMeasureUnit
        productionVer3.txtMeasureValue = productionVM.txtMeasureValue
        productionVer3.imgProductResult = productionVM.imgProductResult
        productionVer3.prodResult = productionVM.prodResult
        productionVer3.imgProductReason = productionVM.imgProductReason
        productionVer3.widtMassBarResult = productionVM.widtMassBarResult
        productionVer3.update()
    }

    function updateText() {
        productionVM.onChangeLanguage()
        productionFrame.updateText(productionVM)

        zeroset.fontText = productionVM.fontText
        zeroset.colorText = productionVM.colorTxtZero
        zeroset.txtButton = productionVM.txtZero

        productionVer3.fontText = productionVM.fontText
        productionVer3.txtLineTitle = productionVM.txtLineTitle
        productionVer3.update()
    }
}
