import QtQuick 2.0
import "qrc:/Control/setZeroButton"
import "qrc:/Production"
import "qrc:/ChartXbar"
import "qrc:/Control/scrollBar"
import ControlApp 1.0
import CommonControl 1.0

Rectangle {
    id: rectRoot
    property MainProductionVer2VM objMainProductionVer2VM: prodVer2VM
    property ProductVer2Screen objProductVer2Screen: productVer2Screen
    property MainChartProd objChartProduct: chartProduct
    property int space: 10
    property int chartHeight: 100
    x: 0
    y: 0
    width: 1024
    height: 640

    Timer {
        id: timer
        interval: objMainProductionVer2VM.getInterval()
        running: true
        repeat: true
        onTriggered: {
            updateText()

            chartLine1.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine1.timerTrigger();
            chartLine2.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine2.timerTrigger();
            chartLine3.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine3.timerTrigger();
            chartLine4.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine4.timerTrigger();
            chartLine5.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine5.timerTrigger();
            chartLine6.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine6.timerTrigger();
            chartLine7.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine7.timerTrigger();
            chartLine8.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine8.timerTrigger();
            chartLine9.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine9.timerTrigger();
            chartLine10.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine10.timerTrigger();
            chartLine11.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine11.timerTrigger();
            chartLine12.valueY=objMainProductionVer2VM.setValueToDraw()
            chartLine12.timerTrigger();
        }
    }

    MainProductionVer2VM {
        id: prodVer2VM
    }
    MainChartProd{
        id: chartProduct
    }

    Rectangle {
        id: rectCom
        anchors.top:  parent.top
        anchors.left:  parent.left
        width: parent.width
        height: 130

        ProductionInfo_com1 {
            id: com1
            x: 0
            y: 0
            width: 315
            height: parent.height
        }
        ProductionInfo_com2
        {
            id:com2
            x:com1.x +com1.width
            y:com1.y
            width: 225
            height: parent.height
        }
        ProductionInfo_com3{
            id: com3
            x: com2.x+com2.width+5
            y:com1.y
            width: 160
            height: parent.height
        }
    }

    Rectangle {
        id: rectContentProd
        x: 0
        y: rectCom.height
        width: parent.width
        height: parent.height - rectCom.height - rectSwitchScr.height - 5
        clip:true
        Flickable {
            id:viewFlick
            anchors.fill: parent
            contentWidth: productVer2Screen.width
            contentHeight: productVer2Screen.height

            ProductVer2Screen {
                id: productVer2Screen
                width: 1024
                height: 1370

                Rectangle{
                    id:rectListChart
                    x: 0
                    y: 0
                    width: 720
                    height: 1370

                    visible: objProductVer2Screen.isXBar ? true : false
                    MainChartProd {
                        id:chartLine1
                        x: 40
                        y:10
                    }
                    MainChartProd{
                        id:chartLine2
                        x: 40
                        y: chartLine1.y +chartHeight +space

                    }
                    MainChartProd{
                        id:chartLine3
                        x: 40
                        y: chartLine2.y +chartHeight +space
                    }
                    MainChartProd{
                        id:chartLine4
                        x: 40
                        y: chartLine3.y +chartHeight +space
                    }
                    MainChartProd{
                        id:chartLine5
                        x: 40
                        y: chartLine4.y +chartHeight +space
                    }
                    MainChartProd{
                        id:chartLine6
                        x: 40
                        y: chartLine5.y +chartHeight +space
                    }
                    MainChartProd{
                        id:chartLine7
                        x: 40
                        y: chartLine6.y +chartHeight +space
                    }
                    MainChartProd{
                        id:chartLine8
                        x: 40
                        y: chartLine7.y +chartHeight +space
                    }
                    MainChartProd{
                        id:chartLine9
                        x: 40
                        y: chartLine8.y +chartHeight +space
                    }
                    MainChartProd{
                        id:chartLine10
                        x: 40
                        y: chartLine9.y +chartHeight +space
                    }
                    MainChartProd{
                        id:chartLine11
                        x: 40
                        y: chartLine10.y +chartHeight +space
                    }
                    MainChartProd{
                        id:chartLine12
                        x: 40
                        y: chartLine11.y +chartHeight +space
                    }
                }
            }
            states: State {
                name: "ShowBars"
                when: viewFlick.movingVertically
                PropertyChanges { target: verticalScrollBar;  duration: 2000 ;opacity: 200}

            }
        }
        ScrollBar {
            id: verticalScrollBar
            width: 12; height: viewFlick.height-50
            anchors.right: viewFlick.right
            opacity: 0
            orientation: Qt.Vertical
            position: viewFlick.visibleArea.yPosition
            pageSize: viewFlick.visibleArea.heightRatio
        }

    }

    Rectangle {
        id: rectSwitchScr
        x: 0
        y: 590
        width: parent.width
        height: 50
        TK_SwitchControl
        {
            id:switchScreen
            x: 780
            y:0
            onSwitchButton: {
                objProductVer2Screen.isXBar = !isLeft
                rectListChart.visible = !isLeft
            }
        }

    }

    Rectangle{
        id:zeroBtn
        x: 930
        y: com1.y
        width: 86
        height: 40
        radius: 5
        ZeroButtonVer2{
            id:zeroButton
        }
    }

    Component.onCompleted: {
        updateText();
    }

    function updateText() {
        objMainProductionVer2VM.onChangeLanguage()
        objMainProductionVer2VM.updateMeasureValue()

        //objSwitchControl.updateText()
        rectRoot.color = objMainProductionVer2VM.backgroundColor
        rectCom.color = objMainProductionVer2VM.backgroundColor
        rectContentProd.color = objMainProductionVer2VM.backgroundColor
        rectSwitchScr.color = objMainProductionVer2VM.backgroundColor
        zeroBtn.color = objMainProductionVer2VM.backgroundColor
        rectListChart.color="transparent" //mandatory

        com1.txtLotNoTitle = objMainProductionVer2VM.txtLotNoTitle
        com1.txtLotNoValue=objMainProductionVer2VM.txtLotNoValue
        com1.txtProductName=objMainProductionVer2VM.txtProductName
        com1.txtProductNo=objMainProductionVer2VM.txtProductNo
        com1.txtProductTitle=objMainProductionVer2VM.txtProductTitle

        com2.txtLowLmtTitle= objMainProductionVer2VM.txtLowLmtTitle
        com2.txtLowLmtUnit= objMainProductionVer2VM.txtLowLmtUnit
        com2.txtLowLmtValue= objMainProductionVer2VM.txtLowLmtValue
        com2.txtNoTitle= objMainProductionVer2VM.txtNoTitle
        com2.txtNoUnit= objMainProductionVer2VM.txtNoUnit
        com2.txtNoValue= objMainProductionVer2VM.txtNoValue
        com2.txtRefTitle= objMainProductionVer2VM.txtRefTitle
        com2.txtRefUnit= objMainProductionVer2VM.txtRefUnit
        com2.txtRefValue= objMainProductionVer2VM.txtRefValue
        com2.txtUpLmtTitle= objMainProductionVer2VM.txtUpLmtTitle
        com2.txtUpLmtUnit= objMainProductionVer2VM.txtUpLmtUnit
        com2.txtUpLmtValue= objMainProductionVer2VM.txtUpLmtValue

        com3.txtNGTitle= objMainProductionVer2VM.txtNGTitle
        com3.txtNGValue= objMainProductionVer2VM.txtNGValue
        com3.txtOKTitle= objMainProductionVer2VM.txtOKTitle
        com3.txtOKValue= objMainProductionVer2VM.txtOKValue
        com3.txtTotalTitle= objMainProductionVer2VM.txtTotalTitle
        com3.txtTotalValue= objMainProductionVer2VM.txtTotalValue

        objProductVer2Screen.measureValue = objMainProductionVer2VM.measureValue
        objProductVer2Screen.measureUnit = objMainProductionVer2VM.measureUnit
        objProductVer2Screen.arrPixmapLineNo = objMainProductionVer2VM.arrPixmapLineNo
        objProductVer2Screen.arrMassbarBargraph = objMainProductionVer2VM.arrMassbarBargraph
        objProductVer2Screen.arrStatusLineNo = objMainProductionVer2VM.arrStatusLineNo
//        objProductVer2Screen.measureValueXbar = objMainProductionVer2VM.measureValueXbar
        switchScreen.strLeft=objMainProductionVer2VM.txtProd
        switchScreen.strRight=objMainProductionVer2VM.txtXbar


        com3.update()
        productVer2Screen.update()
    }

    function setBackGroundColor(){
        return objProductVer2Screen.getBackGroundColorFromVM()
    }
}
