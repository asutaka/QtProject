import QtQuick 2.5
import ControlApp 1.0
import CommonControl 1.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls 1.2 as Controls
import QtCharts 2.1
import "../AdjustTiming"
import "../Dialog"
import "../Control/VirtualKey.js" as Ops
import "../Control/switchLineUC"

Item {
    id:adjustTimingScreen

    property alias objAdjustTimingVM: adjTimeVer4VM
    property AdjustTimingVer4 timAdjObj: adjTimeVer4
    property CateListDialog objSettingTime: settingTime
    property string sourceImage: ""
    property real widthGraph: 0
    property int  optionTime : 1
    property int  indexlineActive : 0
    property int heightPanelItem: 45
    property int spaceItem: 10
    property bool isTextInputChange: true
    property int xMax: 695
    property int xMin: 105
    property int originY: 570
    property int localT1
    property int localT2
    property int localT3
    property int localT4
    property int localT7
    property int localT9
    property string titleColor: objAdjustTimingVM.getTextColor()
    property string lineColor: objAdjustTimingVM.getLineColor()
    property string valueColor: objAdjustTimingVM.getValueColor()
    property string backGColor: objAdjustTimingVM.getBackGColor()
    property string weightValueColor: objAdjustTimingVM.getWeightValueColor()
    property string needTransparent: "transparent"
    property rect rectWeightGraph : Qt.rect(0, 0, 720, 450)
    property rect rectSignalGraph : Qt.rect(0, 450, 720, 150 )

    property int settingSelected: 1

    AdjustTimingVer4_VM {
        id: adjTimeVer4VM
    }

    AdjustTimingVer4 {
        width: 1024
        height: 640
        id: adjTimeVer4

        // ProductInfo Area
        Rectangle {
            id: productionInfo
            x:4
            y: 10
            width:280
            height: 125
            color: backGColor
            border.width: 1
            border.color: lineColor
            radius: 5

            // ProdName Label
            TK_Label {
                id: txtProd
                x: 6
                y: 5
                width: 50
                height: 30
                mText: objAdjustTimingVM.txtProdName
                mBackColor: backGColor
                mForeColor:titleColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // Sample Label
            TK_Label {
                id: txtSample
                x: 6
                y: 40
                width: 100
                height: 30
                mText: objAdjustTimingVM.txtSample
                mBackColor: backGColor
                mForeColor: titleColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // ProductNo Label
            TK_Label {
                id: txtProductNo
                x: 104
                y: 15
                width: 150
                height: 50
                mText: objAdjustTimingVM.valueProdNo
                mBackColor: backGColor
                mForeColor:titleColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }
        }

        // RefVal Setting Area
        AdjustTimingSubControl {
            id: refVal
            x: 4
            y: 185
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtRefValue
            txtUnit: objAdjustTimingVM.txtUnitG
            txtTextField: objAdjustTimingVM.valueRefVal

            onPressTitle: {
                adjTimeVer4.highlightTn(1)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
                Ops.showCalculator(refVal.txtBox, "1", "1000")
            }

            onPressTextInput: {
                adjTimeVer4.highlightTn(1)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
                Ops.showCalculator(refVal.txtBox, "1", "1000")
            }

            onInputComplete: {
                refVal.txtBox.mText = Math.round(refVal.txtBox.mText).toString()
            }
        }

        // ProdLen Setting Area
        AdjustTimingSubControl {
            id: prodLen
            x: 4
            y: refVal.y + heightPanelItem + spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtProdLen
            txtUnit: objAdjustTimingVM.txtUnitMM
            txtTextField: objAdjustTimingVM.valueProdLen

            onPressTitle: {
                adjTimeVer4.highlightTn(2)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
                Ops.showCalculator(prodLen.txtBox, "1", "1000")
            }

            onPressTextInput: {
                adjTimeVer4.highlightTn(2)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
                Ops.showCalculator(prodLen.txtBox, "1", "1000")
            }

            onInputComplete: {
                prodLen.txtBox.mText = Math.round(prodLen.txtBox.mText).toString()
            }
        }

        // T7 Setting Area
        AdjustTimingSubControl {
            id: settingT7
            x: 4
            y: prodLen.y + heightPanelItem + spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtT7
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueT7

            onPressTitle: {
                selectT7.visible = true
                adjTimeVer4.highlightTn(3)
                bottomBarItem.bottomBarAdjustTimingV4.visibleSelectSignalBtn()
            }

            onPressTextInput: {
                Ops.showCalculator(settingT7.txtBox, "1", "1495")
                adjTimeVer4.highlightTn(3)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
            }

            onInputComplete: {
                settingT7.txtBox.mText = Math.round(settingT7.txtBox.mText).toString()
                getLocationTn()
            }
        }

        // T1 Setting Area
        AdjustTimingSubControl {
            id: settingT1
            x: 4
            y: settingT7.y + heightPanelItem + spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtT1
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueT1

            onPressTitle: {
                selectT1.visible = true
                adjTimeVer4.highlightTn(4)
                bottomBarItem.bottomBarAdjustTimingV4.visibleSelectSignalBtn()
            }

            onPressTextInput: {
                Ops.showCalculator(settingT1.txtBox, "1", "1000")
                adjTimeVer4.highlightTn(4)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
            }

            onInputComplete: {
                if (optionTime === 1) {
                    valueAxisX.max = (parseInt(settingT1.txtTextField) + parseInt(settingT2.txtTextField)) * 2
                    signalAxisX.max = (parseInt(settingT1.txtTextField) + parseInt(settingT2.txtTextField)) * 2
                }
                settingT1.txtBox.mText = Math.round(settingT1.txtBox.mText).toString()
                getLocationTn()
            }
        }

        // T2 Setting Area
        AdjustTimingSubControl {
            id: settingT2
            x: 4
            y: settingT1.y + heightPanelItem + spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtT2
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueT2

            onPressTitle: {
                selectT2.visible = true
                adjTimeVer4.highlightTn(5)
                bottomBarItem.bottomBarAdjustTimingV4.visibleSelectSignalBtn()
            }

            onPressTextInput: {
                Ops.showCalculator(settingT2.txtBox ,"1","1000")
                adjTimeVer4.highlightTn(5)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
            }

            onInputComplete: {
                if (optionTime === 1) {
                    valueAxisX.max = (parseInt(settingT1.txtTextField) + parseInt(settingT2.txtTextField)) * 2
                    signalAxisX.max = (parseInt(settingT1.txtTextField) + parseInt(settingT2.txtTextField)) * 2
                }
                settingT2.txtBox.mText = Math.round(settingT2.txtBox.mText).toString()
                getLocationTn()
            }
        }

        // T3 Setting Area
        AdjustTimingSubControl {
            id: settingT3
            x: 4
            y: settingT2.y + heightPanelItem + spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtT3
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueT3

            onPressTitle: {
                selectT3.visible = true
                adjTimeVer4.highlightTn(6)
                bottomBarItem.bottomBarAdjustTimingV4.visibleSelectSignalBtn()
            }

            onPressTextInput: {
                Ops.showCalculator(settingT3.txtBox ,"1","1000");
                adjTimeVer4.highlightTn(6)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
            }

            onInputComplete: {
                settingT3.txtBox.mText = Math.round(settingT3.txtBox.mText).toString()
                getLocationTn()
            }
        }

        // T4 Setting Area
        AdjustTimingSubControl {
            id: settingT4
            x: 4
            y: settingT3.y + heightPanelItem + spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtT4
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueT4

            onPressTitle: {
                selectT4.visible = true
                adjTimeVer4.highlightTn(7)
                bottomBarItem.bottomBarAdjustTimingV4.visibleSelectSignalBtn()
            }

            onPressTextInput: {
                Ops.showCalculator(settingT4.txtBox ,"1","1000")
                adjTimeVer4.highlightTn(7)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
            }

            onInputComplete: {
                settingT4.txtBox.mText = Math.round(settingT4.txtBox.mText).toString()
                getLocationTn()
            }
        }

        // Filter Time Setting Area
        AdjustTimingSubControl {
            id: filterTime
            x: 4
            y: settingT4.y + heightPanelItem + spaceItem
            widthItem: 280
            heightItem: heightPanelItem
            txtTitle: objAdjustTimingVM.txtFilterTime
            txtUnit: objAdjustTimingVM.txtUnitMS
            txtTextField: objAdjustTimingVM.valueFilterTime

            onPressTitle: {
                adjTimeVer4.highlightTn(8)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
                Ops.showCalculator(filterTime.txtBox, "1", "1000")
            }

            onPressTextInput: {
                adjTimeVer4.highlightTn(8)
                bottomBarItem.bottomBarAdjustTimingV4.invisiableSelectSignalBtn()
                Ops.showCalculator(filterTime.txtBox, "1", "1000")
            }

            onInputComplete: {
                filterTime.txtBox.mText = Math.round(filterTime.txtBox.mText).toString()
            }
        }

        // ChartView Area
        Rectangle {
            id: chartArea
            x: 300
            y: 4
            width: 720
            height: 632
            color: "transparent"
            border.width: 1
            border.color: lineColor
            radius: 5

            // Weight Label
            TK_Label {
                id: rectWeight
                x: 25
                y:10
                width: 120
                height: 30
                mBackColor: backGColor
                mText: objAdjustTimingVM.txtWeight
                mForeColor: titleColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // Weight Value Label
            TK_Label {
                id: weight
                x: rectWeight.x + rectWeight.width
                y: 10
                width: 80
                height: 30
                mForeColor: weightValueColor //valueColor
                mBackColor: backGColor
                mText: objAdjustTimingVM.valueWeight
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // Weight Unit Label
            TK_Label {
                id: rectGram
                x: rectWeight.x+ rectWeight.width +80
                y:10
                width: 40
                height: 30
                mText: objAdjustTimingVM.txtUnitG
                mBackColor: backGColor
                mForeColor:titleColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // UnitY Label
            TK_Label {
                id: rectUnitY
                x: 410
                y:10
                width: 40
                height: 30
                mText: objAdjustTimingVM.txtUnitY
                mBackColor: backGColor
                mForeColor:titleColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // UnitG/UnitDIV Label
            TK_Label {
                id: rectUnitYY
                x: rectUnitY.x + rectUnitY.width + 80
                y: 10
                width: 80
                height: 30
                mText: objAdjustTimingVM.txtUnitG + "/" + objAdjustTimingVM.txtUnitDIV
                mBackColor: backGColor
                mForeColor:titleColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // Y Value Label
            TK_Label {
                id: rectValueY
                x: rectUnitY.x+ rectUnitY.width
                y:10
                width: 80
                height: 30
                mText: objAdjustTimingVM.valueY
                mBackColor: backGColor
                mForeColor: weightValueColor //valueColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // T Label
            TK_Label {
                id: rectUnitT
                x: 410
                y:50
                width: 40
                height: 30
                mText: objAdjustTimingVM.txtUnitT
                mBackColor: backGColor
                mForeColor:titleColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // T Unit Label
            TK_Label {
                id: rectUnitTT
                x: rectUnitY.x + rectUnitY.width + 80
                y: 50
                width: 80
                height: 30
                mText: objAdjustTimingVM.txtUnitMS + "/" + objAdjustTimingVM.txtUnitDIV
                mBackColor: backGColor
                mForeColor:titleColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // T Value Label
            TK_Label {
                id: rectValueT
                x: rectUnitT.x + rectUnitT.width
                y: 50
                width: 80
                height: 30
                mForeColor: weightValueColor //valueColor
                mBackColor: backGColor
                mFont.pixelSize: 20
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
                mText: objAdjustTimingVM.valueT
            }

            // Weight Chart
            ChartView {
                id: weightChart
                legend.visible: false
                x: 85
                y: 100
                width: parent.width - x
                height: 350

                margins.top: 0 //110
                margins.bottom: 0
                margins.right: 0
                margins.left: 0 //70

                antialiasing: true
                backgroundColor: "transparent"
                backgroundRoundness: 0

                ValueAxis {
                    id: valueAxisX
                    min: 0
                    max: (parseInt(settingT1.txtTextField) + parseInt(settingT2.txtTextField)) * 2
                    gridVisible: false
                    labelsVisible: false
                    tickCount: 2
                    labelsFont.pixelSize: 1
                }

                ValueAxis {
                    id: valueAxisY
                    min: -(parseInt(refVal.txtTextField) * 3) / 9
                    max: (parseInt(refVal.txtTextField) * 3) / 2
                    tickCount: 2
                    gridLineColor: "#585858"
                    minorTickCount: 10
                    minorGridVisible: true
                    labelsVisible: false
                    labelsFont.pixelSize: 1
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    propagateComposedEvents: true
                }
            }

            // Signal Chart
            ChartView {
                id: signalChart
                x: 85 //0
                y: 450
                height: 120
                width: parent.width - signalChart.x //720

                margins.top: 0
                margins.bottom: 0
                margins.right: 0
                margins.left: 0 //70

                antialiasing: true
                backgroundColor:"transparent"

                backgroundRoundness: 0
                legend.visible : false

                ValueAxis {
                    id: signalAxisX
                    labelFormat: "%.0f"
                    min: 0
                    max: (parseInt(settingT1.txtTextField) + parseInt(settingT2.txtTextField)) * 2
                    gridVisible: false
                    labelsColor: "white"
                    minorGridVisible: false
                    tickCount: (parseInt(valueAxisX.max)- parseInt(valueAxisX.min)) +1
                    labelsVisible: false
                    labelsFont.pixelSize: 1
                }
                ValueAxis {
                    id:signalAxisY
                    minorGridVisible: false
                    min: -0.5
                    max: 2
                    gridLineColor:"#2E2E2E"
                    labelsColor: "white"
                    labelsVisible: false
                    gridVisible: false
                    tickCount: 2
                    labelsFont.pixelSize: 1
                }
                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    propagateComposedEvents: true
                }
            }

            Rectangle {
                id: btnManualT1
                x: 230
                y: 570
                width: 25
                height: 25
                color: "transparent"
                visible: false
                Image {
                    anchors.fill: parent
                    id: redIcon
                    source: "image://MyProvider/red_triangle.png"
                }
                MouseArea{
                    anchors.fill: parent
                    drag.target: parent
                    drag.minimumX: 100
                    drag.maximumX: 680
                    drag.minimumY: 570
                    drag.maximumY: 570
                    onPressed: {
                        isTextInputChange = false
                    }
                }

                onXChanged: {
                    getLocationTn()
                }
            }

            Rectangle {
                id: btnManualT2
                x:365
                y:570
                width: 25
                height: 25
                color: "transparent"
                visible: false
                Image {
                    anchors.fill: parent
                    id: grayIcon
                    source: "qrc:/Images/green_triangle.png"
                }
                MouseArea {
                    anchors.fill: parent
                    drag.target: parent
                    drag.minimumX: 200
                    drag.maximumX: 680
                    drag.minimumY: 570
                    drag.maximumY: 570
                }
                onXChanged: {
                    isTextInputChange = false
                    getLocationTn()
                }
            }

            // Y Axis Name Label
            TK_Label {
                id: nameAxisY
                x: 80
                y: 100
                mForeColor:titleColor
                horizontalAlignment: Text.Center
                width: 80
                mBackColor: needTransparent
                mRightToLeft:false
                mText: objAdjustTimingVM.txtUnitY
                mFont.pixelSize: 18
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // Y Min Value
            TK_TextBox {
                id: txtAsisY_min
                x: 20
                y: 376
                width: 70
                height: 35
                mText: Number(0).toFixed(2)
                mBackColor: backGColor
                mForeColor: valueColor
                mFont.family: "MS Gothic"
                mFont.pixelSize: 18
                mBorderStyle: 2
                mBorderColor: lineColor
                mTextAlignH: Qt.AlignHCenter
                mTextAlignV: Qt.AlignVCenter
                mCausesValidation: RegExpValidator { regExp: /[0-9]+/ }

                onTextInputChanged: {
                    valueAxisY.min = parseInt(txtAsisY_min.mText) - ((valueAxisY.max - parseInt(txtAsisY_min.mText)) / 9) * 2;
                    getLocationTn();
                    mText = Number(mText).toFixed(2)
                }

                Component.onCompleted: {
                    valueAxisY.min = parseInt(txtAsisY_min.mText) - ((valueAxisY.max - parseInt(txtAsisY_min.mText)) / 9) * 2
                    getLocationTn()
                    mText = Number(0).toFixed(2)
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        var limitYmin = Number(txtAsisY_max.mText) - 0.1
                        Ops.showCalculator(txtAsisY_min, "0", limitYmin.toFixed(2).toString())
                    }
                }
            }

            // Y Max Value
            TK_TextBox {
                id: txtAsisY_max
                x: 20
                y: 146
                width:70
                height: 35
                mText: Number(9).toFixed(2)
                mFont.family: "MS Gothic"
                mFont.pixelSize: 18
                mBackColor: backGColor
                mForeColor: valueColor
                mBorderStyle: 2
                mBorderColor: lineColor
                mTextAlignH: Qt.AlignHCenter
                mTextAlignV: Qt.AlignVCenter
                mCausesValidation: RegExpValidator { regExp: /[0-9]+/ }

                onTextInputChanged: {
                    valueAxisY.max = parseInt(txtAsisY_max.mText);
                    valueAxisY.min =parseInt(txtAsisY_min.mText)-((valueAxisY.max - parseInt(txtAsisY_min.mText))/9)*2;
                    getLocationTn();
                    mText = Number(mText).toFixed(2)
                }

                Component.onCompleted: {
                    valueAxisY.max = parseInt(txtAsisY_max.mText);
                    valueAxisY.min =parseInt(txtAsisY_min.mText)-((valueAxisY.max - parseInt(txtAsisY_min.mText))/9)*2;
                    getLocationTn();
                    mText = Number(9).toFixed(2)
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        var limitYmax = Number(txtAsisY_min.mText)+1
                        Ops.showCalculator(txtAsisY_max, Number(limitYmax).toFixed(2).toString(), "9")
                    }
                }
            }

            // Min X Value
            TK_TextBox {
                id: txtAsisX_min
                x: 90
                y: 570
                width: 70
                height: 35
                mText: Math.round(0).toString()
                mFont.family:"MS Gothic"
                mFont.pixelSize: 18
                mBackColor: backGColor
                mForeColor: valueColor
                mBorderStyle: 2
                mBorderColor: lineColor
                mTextAlignH: Qt.AlignHCenter
                mTextAlignV: Qt.AlignVCenter
                mCausesValidation: RegExpValidator { regExp: /[0-9]+/ }

                onTextInputChanged: {
                    valueAxisX.min = parseInt(txtAsisX_min.mText)
                    signalAxisX.min = parseInt(txtAsisX_min.mText)
                    getLocationTn()
                    mText = Math.round(mText).toString()
                }

                Component.onCompleted: {
                    valueAxisX.min = parseInt(txtAsisX_min.mText)
                    signalAxisX.min = parseInt(txtAsisX_min.mText)
                    getLocationTn()
                    mText = Math.round(0).toString()
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        var limitXmin = Number(txtAsisX_max.mText) - 3
                        Ops.showCalculator(txtAsisX_min, "0", Math.round(limitXmin).toString())
                    }
                }
            }

            // Max X Value
            TK_TextBox {
                id: txtAsisX_max
                x: 640
                y: 570
                width: 60
                height: 35
                mText: Math.floor(8)
                mFont.family: "MS Gothic"
                mFont.pixelSize: 18
                mBackColor: backGColor
                mForeColor: valueColor
                mBorderStyle: 2
                mBorderColor: lineColor
                mTextAlignH: Qt.AlignHCenter
                mTextAlignV: Qt.AlignVCenter
                mCausesValidation: RegExpValidator { regExp: /[0-9]+/ }

                onTextInputChanged: {
                    valueAxisX.max = parseInt(txtAsisX_max.mText);
                    signalAxisX.max = parseInt(txtAsisX_max.mText);
                    getLocationTn();
                    mText = Math.floor(mText)
                }

                Component.onCompleted: {
                    valueAxisX.max = parseInt(txtAsisX_max.mText);
                    signalAxisX.max = parseInt(txtAsisX_max.mText);
                    getLocationTn();
                    mText = Math.floor(8)
                }

                MouseArea {
                    anchors.fill: parent
                    onPressed: {
                        var limitXmax = Number(txtAsisX_min.mText) + 3
                        Ops.showCalculator(txtAsisX_max, Math.floor(limitXmax).toString(), "100")
                    }
                }
            }

            // Y Value 1
            TK_Label {
                id: valueAsisY1
                x: 50
                y: 216
                horizontalAlignment: Text.Center
                width: 50
                mBackColor: backGColor
                mForeColor: titleColor
                mText: Number((parseInt(txtAsisY_max.mText) - parseInt(txtAsisY_min.mText)) * 2 / 3 + parseInt(txtAsisY_min.mText)).toFixed(2)
                mFont.pixelSize: 18
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // Y Value 2
            TK_Label {
                id: valueAsisY2
                x: 50
                y: 293
                mForeColor:titleColor
                horizontalAlignment: Text.Center
                width: 50
                mBackColor: backGColor
                mText: Number((parseInt(txtAsisY_max.mText) - parseInt(txtAsisY_min.mText)) / 3 + parseInt(txtAsisY_min.mText)).toFixed(2)
                mFont.pixelSize: 18
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // X Value 1
            TK_Label {
                id: valueAsisX1
                x: (xMax - xMin) * 2 / 3.0 + xMin
                y: 570
                horizontalAlignment: Text.Center
                width: 60
                mBackColor: backGColor
                mForeColor:titleColor
                mRightToLeft: true
                mText: Math.round((parseInt(txtAsisX_max.mText) - parseInt(txtAsisX_min.mText)) * 2 / 3.0 + parseInt(txtAsisX_min.mText))
                mFont.pixelSize: 18
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            // X Value 2
            TK_Label {
                id: valueAsisX2
                x: (xMax - xMin)/3.0  +xMin
                y: 570
                horizontalAlignment: Text.Center
                width: 60
                mBackColor: backGColor
                mForeColor:titleColor
                mText: Math.round((parseInt(txtAsisX_max.mText) - parseInt(txtAsisX_min.mText)) / 3.0 + parseInt(txtAsisX_min.mText))
                mFont.pixelSize: 18
                mFont.family: "MS Gothic"
            }

            // X Axis Name Label
            TK_Label {
                id: nameAxisX
                x: 705
                y: 570
                mForeColor:titleColor
                horizontalAlignment: Text.Center
                width: 80
                mRightToLeft:false
                mBackColor: needTransparent
                mText: objAdjustTimingVM.txtUnitT
                mFont.pixelSize: 18
                mFont.family: "MS Gothic"
                mFont.italic: false
                mFont.bold: false
            }

            SwitchSelection {
                id: showSignalSelection
                x: 10
                y: 450
                width: 80
                height: 100
                textColor: "#fff" //objAdjustTimingVM.getValueColor()
                textSelection: tmpPhoto

                onCurrentIndexChanged: {
                    clearLineNoLegend();
                    drawCharts();
                }
            }
        }

        Component.onCompleted: {
            console.log("scale_factor"+scale_factor)
            console.log("plot area"+signalChart.plotArea.x)
            drawCharts()
            updateText()
        }

        // Show dialog SettingTime when click button in StatusBar
        function showDialogSettingTime() {
            settingTime.source = listTime;
            settingTime.visible = true;
        }

        // Show dialog VerticalRange when click button in StatusBar
        function showDialogVerticalRange() {
            settingRange.source = listVerticalRange;
            settingRange.visible = true;
        }

        // Show dialog MeasTiming when click button in BottomBar
        function showDialogMeasTiming() {
            settingMeasTiming.source = listMeasTiming;
            settingMeasTiming.visible = true;
        }

        // Show dialog SignalAdjust when click button in BottomBar
        function showDialogSignalAdjust() {
            signalAdjust.source = listSignalInput
            signalAdjust.visible = true
        }

        // Show dialog SignalSelect when click button in BottomBar
        function showDialogSignalSelect() {
            displaySignal.visible = true
        }

        // Show dialog SignalPhoto when click button in BottomBar
        function showDialogSignalPhoto() {
            displaySignal.visible = true;
        }

        // Show dialog SelectTn when click button in Screen
        function showDialogSelectTn(){
            selectTn.visible=true
        }

        // Clear data in ChartView
        function clearCharts() {
            clearLineNoLegend()
        }

        function autoScale() {
            clearScale()
        }

        function updateTextInput(sInput) {
            txtProdLen.text = sInput;
        }

        // Select item highlight
        function isSettingSelected(isRef, isProdLen, isSettingT7, isSettingT1, isSettingT2, isSettingT3, isSettingT4, isFilterTime) {
            refVal.isSelected = isRef
            prodLen.isSelected = isProdLen
            settingT7.isSelected = isSettingT7
            settingT1.isSelected = isSettingT1
            settingT2.isSelected = isSettingT2
            settingT3.isSelected = isSettingT3
            settingT4.isSelected = isSettingT4
            filterTime.isSelected = isFilterTime
        }

        // Set item highlight
        function setHighlight() {
            switch (settingSelected) {
                case 1:
                    isSettingSelected(true, false, false, false, false, false, false, false)
                    break
                case 2:
                    isSettingSelected(false, true, false, false, false, false, false, false)
                    break
                case 3:
                    isSettingSelected(false, false, true, false, false, false, false, false)
                    break
                case 4:
                    isSettingSelected(false, false, false, true, false, false, false, false)
                    break
                case 5:
                    isSettingSelected(false, false, false, false, true, false, false, false)
                    break
                case 6:
                    isSettingSelected(false, false, false, false, false, true, false, false)
                    break
                case 7:
                    isSettingSelected(false, false, false, false, false, false, true, false)
                    break
                case 8:
                    isSettingSelected(false, false, false, false, false, false, false, true)
                    break
                default:
                    break
            }
        }

        // Highlight Item
        function highlightTn(_tn) {
            settingSelected = _tn
            setHighlight()
        }
    }

    // Model for SettingTime Dialog
    ListModel {
        id: listTime
        ListElement {
            title: "(T1+T2)*2"
        }
        ListElement {
            title: "標準"
        }
        ListElement {
            title: "100 ms"
        }
        ListElement {
            title: "200 ms"
        }
    }

    // Model for MeasTiming
    ListModel {
        id: listMeasTiming
        ListElement {
            title: "自動"
        }
        ListElement {
            title: "手動"
        }
    }

    // Model for SelectSignal Dialog
    ListModel {
        id:listSignalType
        ListElement {
            title: "装置内信号"
        }
        ListElement {
            title: "入力信号"
        }
        ListElement {
            title: "出力信号"
        }
    }

    // Model for Select Tx Dialog
    ListModel {
        id: listTn
        ListElement {
            title: "T1"
        }
        ListElement {
            title: "T2"
        }
        ListElement {
            title: "T3"
        }
        ListElement {
            title: "T4"
        }
        ListElement {
            title: "T7"
        }
        ListElement {
            title: "T9"
        }

    }

    // Model for SelectPhoto Dialog
    ListModel {
        id: listSignalPhoto
        ListElement {
            title: "Photo(W1)"
        }
        ListElement {
            title: "Photo(RJ3)"
        }
        ListElement {
            title: "Photo(RJ1)"
        }
    }

    // Model for SelectPhoto Dialog
    ListModel {
        id: listSignalInput
        ListElement {
            title: "INA1"
        }
        ListElement {
            title: "INA2"
        }
        ListElement {
            title: "INM1"
        }
        ListElement {
            title: "INM2"
        }
    }

    // Model for SelectPhoto CateListDialog
    ListModel {
        id: listSignalOutput
        ListElement {
            title: "OUTA1"
        }
        ListElement {
            title: "OUTA2"
        }
        ListElement {
            title: "OUTM1"
        }
        ListElement {
            title: "OUTN1"
        }
        ListElement {
            title: "OUTN2"
        }
        ListElement {
            title: "OUTN3"
        }
    }

    // Model for SettingRange Dialog
    ListModel {
        id: listVerticalRange
        ListElement {
            title: "オートレンジ基準"
        }
        ListElement {
            title: "オートレンジ全体"
        }
        ListElement {
            title: "レンジ固定"
        }
        ListElement {
            title: "レンジ2倍"
        }
        ListElement {
            title: "レンジ4倍"
        }
        ListElement {
            title: "レンジ8倍"
        }
    }

    MouseArea {
        id: screenArea
        anchors.fill: parent
        propagateComposedEvents: screenArea.enabled
        enabled: false
    }

    // SettingTime Dialog
    CateListDialog {
        id: settingTime
        x: 397
        y: 100
        title: "Time"
        visible: false
        source: listTime
        indexSelect: tmpSettingTime

        onSend: {
            statusBarItem.normalStatusBarAdjust4.settingValueTime(value)
            var curentIndexTime = settingTime.settingDialog.getCurrentIndex()

            // Data temp when change screen
            tmpSettingTime = indexSelect - 1

            console.log("curentIndexTime: " + curentIndexTime)
            switch (curentIndexTime) {
                case 1:
                    optionTime = 1
                    clearScale()
                    break
                case 2:
                    optionTime = 1
                    clearScale()
                    break
                case 3:
                    optionTime = 3
                    clearScale()
                    break
                case 4:
                    optionTime = 4
                    clearScale()
                    break
                default:
                    break
            }
        }

        onVisibleChanged: {
            screenArea.enabled = settingTime.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(settingTime.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(settingTime.visible)
        }

        Component.onCompleted: {
            statusBarItem.normalStatusBarAdjust4.settingValueTime(listTime.get(tmpSettingTime).title)
            optionTime = tmpSettingTime
            clearScale()
        }
    }

    // SettingRange Dialog
    CateListDialog {
        id: settingRange
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listVerticalRange
        indexSelect: tmpSettingRange

        onSend: {
            statusBarItem.normalStatusBarAdjust4.updateVerticalRange(value)

            // Data temp when change screen
            tmpSettingRange = indexSelect - 1
        }

        onVisibleChanged: {
            screenArea.enabled = settingRange.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(settingRange.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(settingRange.visible)
        }

        Component.onCompleted: {
            statusBarItem.normalStatusBarAdjust4.updateVerticalRange(listVerticalRange.get(tmpSettingRange).title)
        }
    }

    // SelectT7 Dialog
    CateListDialog {
        id: selectT7
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listTn
        indexSelect: tmpSettingT7

        onSend: {
            settingT7.updateTitle(value)
            getLocationTn()

            // Data temp when change screen
            tmpSettingT7 = indexSelect - 1
        }

        onVisibleChanged: {
            screenArea.enabled = selectT7.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(selectT7.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(selectT7.visible)
        }

        Component.onCompleted: {
            settingT7.updateTitle(listTn.get(tmpSettingT7).title)
        }
    }

    // SelectT1 Dialog
    CateListDialog {
        id: selectT1
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listTn
        indexSelect: tmpSettingT1

        onSend: {
            settingT1.updateTitle(value)
            getLocationTn()

            // Data temp when change screen
            tmpSettingT1 = indexSelect - 1
        }

        onVisibleChanged: {
            screenArea.enabled = selectT1.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(selectT1.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(selectT1.visible)
        }

        Component.onCompleted: {
            settingT1.updateTitle(listTn.get(tmpSettingT1).title)
        }
    }

    // SelectT2 Dialog
    CateListDialog {
        id: selectT2
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listTn
        indexSelect: tmpSettingT2

        onSend: {
            settingT2.updateTitle(value)
            getLocationTn()

            // Data temp when change screen
            tmpSettingT2 = indexSelect - 1
        }

        onVisibleChanged: {
            screenArea.enabled = selectT2.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(selectT2.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(selectT2.visible)
        }

        Component.onCompleted: {
            settingT2.updateTitle(listTn.get(tmpSettingT2).title)
        }
    }

    // SelectT3 Dialog
    CateListDialog {
        id: selectT3
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listTn
        indexSelect: tmpSettingT3

        onSend: {
            settingT3.updateTitle(value)
            getLocationTn()

            // Data temp when change screen
            tmpSettingT3 = indexSelect - 1
        }

        onVisibleChanged: {
            screenArea.enabled = selectT3.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(selectT3.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(selectT3.visible)
        }

        Component.onCompleted: {
            settingT3.updateTitle(listTn.get(tmpSettingT3).title)
        }
    }

    // SelectT4 Dialog
    CateListDialog {
        id: selectT4
        x: 397
        y: 100
        title: "縦レンジ"
        visible: false
        source: listTn
        indexSelect: tmpSettingT4

        onSend: {
            settingT4.updateTitle(value)
            getLocationTn()

            // Data temp when change screen
            tmpSettingT4 = indexSelect - 1
        }

        onVisibleChanged: {
            screenArea.enabled = selectT4.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(selectT4.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(selectT4.visible)
        }

        Component.onCompleted: {
            settingT4.updateTitle(listTn.get(tmpSettingT4).title)
        }
    }

    // SettingMeasTiming Dialog
    CateListDialog {
        id: settingMeasTiming
        x: 397
        y: 100
        visible: false
        source: listMeasTiming
        title: "MeasTiming"
        indexSelect: tmpMeasTiming

        onSend: {
            bottomBarItem.bottomBarAdjustTimingV4.settingValueMeasTime(value)
            var curIndexMeas = settingMeasTiming.settingDialog.getCurrentIndex()
            console.log("curIndexMeas: " + curIndexMeas)
            if(curIndexMeas === 1) {
                btnManualT1.visible = false
                btnManualT2.visible = false
                optionTime=1
                clearScale()
            } else if (curIndexMeas === 2) {
                btnManualT1.visible = true
                btnManualT2.visible = true
            }

            // Data temp when change screen
            tmpMeasTiming = indexSelect - 1
        }

        onVisibleChanged: {
            screenArea.enabled = settingMeasTiming.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(settingMeasTiming.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(settingMeasTiming.visible)
        }

        Component.onCompleted: {
            bottomBarItem.bottomBarAdjustTimingV4.settingValueMeasTime(listMeasTiming.get(tmpMeasTiming).title)
        }
    }

    // SignalAdjust Dialog
    CateListDialog {
        id: signalAdjust
        x: 397
        y: 100
        visible: false
        indexSelect: 0

        onVisibleChanged: {
            screenArea.enabled = signalAdjust.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(signalAdjust.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(signalAdjust.visible)
        }
    }

    // SignalSelect Dialog
    CateListDialog {
        id: signalSelect
        x: 397
        y: 100
        visible: false
        indexSelect: 0

        onVisibleChanged: {
            screenArea.enabled = signalSelect.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(signalSelect.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(signalSelect.visible)
        }
    }

    Rectangle {
        id: displaySignal
        x: 397
        y: 100
        visible: false
        color: "transparent"
        width: 626
        height: 480

        CateListDialogVer2 {
            id: selectSignal
            x:0
            y:0
            sizeWidth: 313
            sizeHeight: 400
//            indexSelect: 0
            title: "種別"
            source: listSignalType

            onIndexSelectChanged: {
                var curIndex = selectSignal.settingDialog.getCurrentIndex()
                if (curIndex === 1) {
                    selectPhoto.source = listSignalPhoto
                    selectPhoto.indexSelect = 0
                    selectPhoto.setCurrentIndex(0)
                } else if (curIndex === 2) {
                    selectPhoto.source = listSignalInput
                    selectPhoto.indexSelect = 0
                    selectPhoto.setCurrentIndex(0)
                } else if (curIndex === 3) {
                    selectPhoto.source = listSignalOutput
                    selectPhoto.indexSelect = 0
                    selectPhoto.setCurrentIndex(0)
                }
            }
        }

        CateListDialogVer2 {
            id: selectPhoto
            x:313
            y:0
            sizeWidth: 313
            sizeHeight: 400
            title: "信号名"
            source: listSignalPhoto
//            indexSelect: 0
        }

        // Ok-Cancel Button
        Rectangle {
            x: 0
            y: 400
            width: 626
            height: 80
            color: "#696969"
            visible: true

            Rectangle {
                x: 50
                y:10
                width: 100
                height: 60
                color: "transparent"
                radius: 6

                Image {
                    id: imgOK
                    source: "../Images/keyboard_btn_okcancel.png"
                    anchors.fill: parent
                    Text {
                        text: "OK"
                        font.pixelSize:20
                        font.family: "MS Gothic"
                        color: titleColor
                        anchors.centerIn: parent
                        anchors.horizontalCenter: Text.horizontalCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            imgOK.source = "../Images/keyboard_btn_touched_okcancel.png"
                            clearLineNoLegend()
                        }
                        onReleased: {
                            imgOK.source = "../Images/keyboard_btn_okcancel.png";
                            selectPhoto.settingDialog.pressBtnOK()
                            statusBarItem.normalStatusBarAdjust4.updateSignal(selectPhoto.value)
                            showSignalSelection.textSelection = selectPhoto.value
                            tmpPhoto = selectPhoto.value
                            displaySignal.visible=false
                            drawCharts()
                        }
                        onCanceled: {
                            imgOK.source = "../Images/keyboard_btn_okcancel.png";
                        }
                    }
                }
            }

            Rectangle {
                x:476
                y:10
                width: 100
                height: 60
                color: "transparent"
                radius: 6
                Image {
                    id:imgCancel
                    source: "../Images/keyboard_btn_okcancel.png"
                    anchors.fill: parent
                    Text {
                        text: "CANCEL"
                        font.pixelSize:20
                        font.family: "MS Gothic"
                        color: "white"
                        anchors.centerIn: parent
                        anchors.horizontalCenter: Text.horizontalCenter
                    }
                    MouseArea {
                        anchors.fill: parent
                        onPressed: {
                            imgCancel.source = "../Images/keyboard_btn_touched_okcancel.png"
                        }
                        onReleased:{
                            displaySignal.visible=false
                        }
                        onCanceled:
                        {
                            imgCancel.source = "../Images/keyboard_btn_okcancel.png";
                        }
                    }
                }
            }
        }

        onVisibleChanged: {
            screenArea.enabled = displaySignal.visible
            bottomBarItem.bottomBarAdjustTimingV4.enableMouseArea(displaySignal.visible)
            statusBarItem.normalStatusBarAdjust4.enableMouseArea(displaySignal.visible)
        }

        Component.onCompleted: {
            var patt = /^P/
            var patt2 = /^I/
            var patt3 = /^O/
            if (patt.test(showSignalSelection.textSelection)) {
                signalSetCurrentIndex(0);
                photoSetSource(0);
            } else if (patt2.test(showSignalSelection.textSelection)) {
                signalSetCurrentIndex(1);
                photoSetSource(1);
            } else if (patt3.test(showSignalSelection.textSelection)) {
                signalSetCurrentIndex(2);
                photoSetSource(2);
            }
        }

        function photoSetSource(input){
            if (input === 0) {
                selectPhoto.source = listSignalPhoto
                for(var i = 0; i < listSignalPhoto.count; i++) {
                    if(showSignalSelection.textSelection === listSignalPhoto.get(i).title)
                        selectPhoto.setCurrentIndex(i)
                }
            } else if(input === 1){
                selectPhoto.source = listSignalInput;
                for(i = 0; i < listSignalInput.count; i++) {
                    if(showSignalSelection.textSelection === listSignalInput.get(i).title)
                        selectPhoto.setCurrentIndex(i);
                }
            } else if (input === 2) {
                selectPhoto.source = listSignalOutput;
                for (i=0; i < listSignalOutput.count; i++) {
                    if (showSignalSelection.textSelection === listSignalOutput.get(i).title)
                        selectPhoto.setCurrentIndex(i)
                }
            }
        }

        function refreshList(){
            selectSignal.refreshList();
            selectPhoto.refreshList();
        }

        function signalSetCurrentIndex(input) {
            selectSignal.refreshList()
            selectSignal.setCurrentIndex(input)
        }
    }

    Rectangle {
        id:showSignal
        x: 305
        y: 510
        color: "transparent"
        width: 95
        height: 35
        visible: false

        Text {
            anchors.centerIn: parent
            id: txtSignalName
            font.pixelSize: 20
            font.family: "MS Gothic"
            color: titleColor
            text: "Photo(W1)"
        }
    }

    Component.onCompleted: {
        objAdjustTimingVM.OnLoad()
        mainModel.onChangeLanguage.connect(updateText)
        updateText()
    }

    function setAsisX(value) {
        switch(value.toString()){
            case "(T1+T2)*2":
                txtAsisX_max.mText = ((parseInt(settingT1.txtTextField) + parseInt(settingT2.txtTextField))*2).toString();
                optionTime = 1;
                break;
            case "標準" :
                txtAsisX_max.mText = 50;
                optionTime = 2;
                break;
            case "100 ms" :
                txtAsisX_max.mText = 100;
                optionTime= 3;
                break;
            case "200 ms" :
                txtAsisX_max.mText = 200;
                optionTime = 4;
                break;
            default: break;
        }
        signalAxisX.max =txtAsisX_max.mText;
        valueAxisX.max = txtAsisX_max.mText;
        getLocationTn();
        statusBarItem.normalStatusBarAdjust4.updateSettingTime(value.toString());
    }

    function getLocationTn() {
        var maxWidthGraph = (parseInt(valueAxisX.max) - parseInt(valueAxisX.min)) // = 8
        var scale = parseFloat(xMax - xMin) / maxWidthGraph // (695-105)/8
        console.log("maxWidthGraph: " + maxWidthGraph) // =8
        console.log("scale: " + scale) // = 73,75
        var localTn = [];
        var stringTn = [];

        var stringT1 = settingT1.txtTitle; //T1
        var stringT2 = settingT2.txtTitle; //T2
        var stringT3 = settingT3.txtTitle; //T3
        var stringT4 = settingT4.txtTitle; //T4
        var stringT7 = settingT7.txtTitle; //T7

        stringTn.push(stringT1);
        stringTn.push(stringT2);
        stringTn.push(stringT3);
        stringTn.push(stringT4);
        stringTn.push(stringT7);

        if (isTextInputChange) {
            localT1 = xMin + parseInt(scale * (parseInt(settingT1.txtTextField)));
            console.log("localT1: " + localT1)
            localT2 = localT1 + parseInt(scale * (parseInt(settingT2.txtTextField)));
            localT3 = localT2 + parseInt(scale * (parseInt(settingT3.txtTextField)));
            localT4 = localT3 + parseInt(scale * (parseInt(settingT4.txtTextField)));
            localT7 = localT4 + parseInt(scale * (parseInt(settingT7.txtTextField))); //T7
//            localT9 = localT7 + parseInt(scale * (parseInt(inputT9.text)));
        }
        else {
            localT1 = xMin + (btnManualT1.x - 100)
            localT2 = localT1 + (btnManualT2.x - 200)
            localT3 = localT2 + parseInt(scale * (parseInt(settingT3.txtTextField)));
            localT4 = localT3 + parseInt(scale * (parseInt(settingT4.txtTextField)));
            localT7 = localT4 + parseInt(scale * (parseInt(settingT7.txtTextField)));
//            localT9 = localT7 + parseInt(scale * (parseInt(inputT9.text)));
        }

        localTn.push(originY);          // local[0]
        localTn.push(localT1 + 300);    // local[1]
        localTn.push(localT2 + 300);    // local[2]
        localTn.push(localT3 + 300);    // local[3]
        localTn.push(localT4 + 300);    // local[4]
        localTn.push(localT7 + 300);    // local[5]
        localTn.push(localT9 + 300);    // local[6]
        localTn.push(xMax + 300);       // local[7]
        localTn.push(xMin + 300);       // local[8]
        timAdjObj.setDrawTn(localTn, stringTn);
    }

    function drawCharts() {
        getLocationTn()
        var lineImport = []
        var countLineImport = Math.floor((Math.random() * 7) + 5)
        var valueWeight = []
        valueWeight = objAdjustTimingVM.genDataWeight();
        for (var i = 0 ; i < countLineImport; i++) {
            lineImport.push((Math.random() * 11) + 1);
            var series = weightChart.createSeries(ChartView.SeriesTypeSpline, "", valueAxisX, valueAxisY);
            var seriesSignal = signalChart.createSeries(ChartView.SeriesTypeLine, "", signalAxisX, signalAxisY);
            for (var j = 0; j <= 12; j++) {
                series.append(j, Math.floor((Math.random() * 3) + 3));
                //series.append(j, valueWeight[j]);
            }
            if (i % 2 === 0) {
                seriesSignal.append(0,0);
                seriesSignal.append(1,0);
                seriesSignal.append(1,1);
                seriesSignal.append(2,1);
                seriesSignal.append(2,0);
                seriesSignal.append(3,0);
                seriesSignal.append(3,1);
                seriesSignal.append(4,1);
                seriesSignal.append(5,1);
                seriesSignal.append(5,0);
                seriesSignal.append(6,0);
                seriesSignal.append(6,1);
                seriesSignal.append(7,1);
                seriesSignal.append(8,1);
                seriesSignal.append(8,0);
                seriesSignal.append(9,0);
                seriesSignal.append(9,1);
                seriesSignal.append(10,1);
                seriesSignal.append(11,1);
                seriesSignal.append(11,0);
                seriesSignal.append(12,0);
            }
            else {
                seriesSignal.append(0,0);
                seriesSignal.append(1,0);
                seriesSignal.append(2,0);
                seriesSignal.append(2,1);
                seriesSignal.append(3,1);
                seriesSignal.append(3,1);
                seriesSignal.append(3,0);
                seriesSignal.append(4,0);
                seriesSignal.append(5,0);
                seriesSignal.append(6,0);
                seriesSignal.append(6,1);
                seriesSignal.append(7,1);
                seriesSignal.append(7,0);
                seriesSignal.append(8,0);
                seriesSignal.append(9,0);
                seriesSignal.append(10,0);
                seriesSignal.append(10,1);
                seriesSignal.append(11,1);
                seriesSignal.append(12,1);
                seriesSignal.append(12,0);
            }

            if (i != (countLineImport -1)) {
                series.width = 0.7;
                seriesSignal.width = 0.5;
            }
            else {
                indexlineActive = i;
                series.width = 4;
                seriesSignal.width = 2;
            }
            var color = getColor(i);
            series.color = color;
            seriesSignal.color = color;
        }
    }

    function clearLineNoLegend() {
        weightChart.removeAllSeries();
        signalChart.removeAllSeries();
    }

    function clearScale() {
        valueAxisX.min = 0;
        valueAxisY.min = -(refVal.txtTextField*3)/9;
        valueAxisY.max = (refVal.txtTextField*3)/2
        if (optionTime === 1) {
            valueAxisX.max = (parseInt(settingT1.txtTextField) + parseInt(settingT2.txtTextField)) * 2
            signalAxisX.max = (parseInt(settingT1.txtTextField) + parseInt(settingT2.txtTextField)) * 2
        }
        else if (optionTime === 2){
            valueAxisX.max = 50;
            signalAxisX.max = 50;
        }
        else if(optionTime === 3){
            valueAxisX.max = 100;
            signalAxisX.max = 100;
        }
        else if(optionTime === 4){
            valueAxisX.max = 200;
            signalAxisX.max = 200;
        }
        txtAsisX_min.mText = valueAxisX.min.toString();
        txtAsisY_min.mText = 0;
        txtAsisX_max.mText = valueAxisX.max.toString();
        txtAsisY_max.mText = valueAxisY.max.toString();
        getLocationTn();
    }

    function getColor(index) {
        var color;
        switch (index) {
            case 0: color = "#FF0000";break;
            case 1: color = "#FFFF00";break;
            case 2: color = "#008B45";break;
            case 3: color = "#0000FF";break;
            case 4: color = "#00BFFF";break;
            case 5: color = "#FF6A6A";break;
            case 6: color = "#FF7F24";break;
            case 7: color = "#CD1076";break;
            case 8: color = "#FFFFFF";break;
            case 9: color = "#8B4726";break;
            case 10: color = "#00FF00";break;
            case 11: color = "#848385";break;
            default: color = "white";break;
        }
        return color;
    }

    function updateText() {
        objAdjustTimingVM.onChangeLanguage()
        txtProd.mText = objAdjustTimingVM.txtProdName
        txtSample.mText = objAdjustTimingVM.txtSample
        txtProductNo.mText = objAdjustTimingVM.valueProdNo
        refVal.txtTitle = objAdjustTimingVM.txtRefValue
        prodLen.txtTitle = objAdjustTimingVM.txtProdLen
        rectWeight.mText = objAdjustTimingVM.txtWeight
        filterTime.txtTitle = objAdjustTimingVM.txtFilterTime
        adjTimeVer4.update();
    }
}
