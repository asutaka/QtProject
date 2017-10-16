import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0
import CommonControl 1.0

Item {
    property ProductionScreenVM_ver3 productionVM: prodVM
    ProductionScreenControl_ver3 {
        id: productionVer3
        width: 1024
        height: 640
    }

    ProductionScreenVM_ver3 {
        id: prodVM
    }

    ProductionInfo_com1 {
        id: com1
        x: 0
        y: 0
        width: 340
        height: 130
    }

    ProductionInfo_com2 {
        id: com2
        x: com1.x + com1.width
        y: com1.y
        width: 225
        height: com1.height
    }

    ProductionInfo_com3 {
        id: com3A
        x: com2.x + com2.width
        y: com2.y
        width: 228
        height: com1.height
    }

    ProductionInfo_com3 {
        id: com3B
        x: com3A.x + com3A.width
        y: com3A.y
        width: com3A.width
        height: com1.height
    }

    ImageButtonControl {
        id: zeroset_discrmark
        x: 507
        y: 390
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

    Component.onCompleted: {
        productionVM.onLoad();
        mainModel.onChangeLanguage.connect(updateText);
        productionVM.updateValue.connect(updateValue)
        updateText()
        updateValue()
    }

    function updateValue() {
        com1.txtLotNoValue = productionVM.txtLotNoValue
        com1.txtProductName = productionVM.txtProductName
        com1.txtProductNo = productionVM.txtProductNo

        com2.txtRefValue = productionVM.txtRefValue
        com2.txtLowLmtValue = productionVM.txtLowLmtValue
        com2.txtUpLmtValue = productionVM.txtUpLmtValue
        com2.txtNoValue = productionVM.txtNoValue

        com3A.txtTotalValue = productionVM.txtTotalAValue
        com3A.txtOKValue = productionVM.txtFeValue
        com3A.txtNGValue = productionVM.txtSUSValue
        com3A.txtOKValue = productionVM.txtFeValue
        com3A.txtNGValue = productionVM.txtSUSValue

        com3B.txtTotalValue = productionVM.txtTotalValue
        com3B.txtOKValue = productionVM.txtOKValue
        com3B.txtNGValue = productionVM.txtNGValue
        com3B.txtTotalValue = productionVM.txtTotalValue
        com3B.txtOKValue = productionVM.txtOKValue
        com3B.txtNGValue = productionVM.txtNGValue

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

        com1.update()
        com2.update()
        com3A.update()
        com3B.update()
        productionVer3.update()
    }

    function updateText() {
        productionVM.onChangeLanguage()

        zeroset.fontText = productionVM.fontText
        zeroset.colorText = productionVM.colorTxtZero
        productionVer3.fontText = productionVM.fontText

        zeroset.txtButton = productionVM.txtZero

        com1.txtLotNoTitle = productionVM.txtLotNoTitle
        com1.txtProductTitle = productionVM.txtProductTitle

        com2.txtRefTitle = productionVM.txtRefTitle
        com2.txtLowLmtTitle = productionVM.txtLowLmtTitle
        com2.txtUpLmtTitle = productionVM.txtUpLmtTitle
        com2.txtNoTitle = productionVM.txtNoTitle
        com2.txtRefUnit = productionVM.txtRefUnit
        com2.txtLowLmtUnit = productionVM.txtLowLmtUnit
        com2.txtUpLmtUnit = productionVM.txtUpLmtUnit
        com2.txtNoUnit = productionVM.txtNoUnit

        com3A.txtTotalTitle = productionVM.txtTotalATitle
        com3A.txtOKTitle = productionVM.txtFeTitle
        com3A.txtNGTitle = productionVM.txtSUSTitle

        com3B.txtTotalTitle = productionVM.txtTotalTitle
        com3B.txtOKTitle = productionVM.txtOKTitle
        com3B.txtNGTitle = productionVM.txtNGTitle

        productionVer3.txtLineTitle = productionVM.txtLineTitle

        com1.update()
        com2.update()
        com3A.update()
        com3B.update()
        productionVer3.update()
    }
}
