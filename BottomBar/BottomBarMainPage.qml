import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.4
import QtQuick.Controls 1.4
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import "../Control/menu"
import "../StatusBar"
import ControlApp 1.0
import CommonControl 1.0
import CommonModule 1.0

Item {
    property int count: 0;
    property bool isShowMenu: true
    id: bottomBarMainPage
    Rectangle {
        id: rectBottom
        width: 1024
        height: 64
        color: "#ffffff"

        Image {
            id: rectBottomBkgnd
            x: 0
            y: 0
            source: "image://MyProvider/ControlBar_bg.png"
        }

        // button Menu
        TK_QuickMenuButton {
            id: toolButton_Menu
            x: 0
            y: 0
            width: 104
            height: 64
            imgSourceBg: "image://MyProvider/contbar_btn_104.png"
            imgSourceActive: "image://MyProvider/contbar_btn_touched_104.png"
            imgSourceIcon: "image://MyProvider/contbar_icon_menu.png"
            imgIconTopMargin: 4
            imgIconLeftMargin: 37
            wIcon: 32
            hIcon: 32
            txtButton: "Menu"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 27
            textTopMargin: 31
            textLeftMargin: 8
            colorText: "white"
            colorTextSelected: "white"
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignHCenter

            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.MenuV1)
            }
        }

        //button change screen
        TK_QuickMenuButton {
            id: toolButton_ChangeScreen
            x: 105
            y: 0
            width: 112
            height: 64
            imgSourceBg: "image://MyProvider/contbar_btn_112.png"
            imgSourceActive: "image://MyProvider/contbar_btn_touched_112.png"
            txtButton: "Display"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 27
            textTopMargin: 31
            textLeftMargin: 4
            colorText: "white"
            colorTextSelected: "white"
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignHCenter
            mMenuDirection: 0
            mMenuAlignment: 3
            mPosibleArea: Qt.rect(0,-640,640,1024)

            Image {
                id: screen1
                x: 6
                y: 5
                height: 16
                width:16
                source: "image://MyProvider/dispswitchbtnno1.png"
            }

            Image {
                id: screen2
                x: 27
                y: 5
                width: 16
                height: 16
                source: "image://MyProvider/dispswitchbtnno2.png"
            }

            Image {
                id: screen3
                x: 48
                y: 5
                width: 17
                height: 16
                source: "image://MyProvider/dispswitchbtnno3.png"
            }

            Image {
                id: screen4
                x: 69
                y: 5
                width: 17
                height: 16
                source: "image://MyProvider/dispswitchbtnno4.png"
            }

            Image {
                id: screen5
                x: 89
                y: 5
                width: 17
                height: 16
                source: "image://MyProvider/Icon_Screen_5_on.png"
            }

            onClicked: {
                rectBottom.closeOtherQuickMenu(toolButton_SetAdj, toolButton_ProCntl, toolButton_OpeCheck)
                btnProdScreen.visible = true
                btnProdScreenV2.visible = true
                btnFillAdjust.visible = true
                btnGeneral.visible = true
                btnZoomLine.visible = true
                btnXBarRS.visible = true
                btnStatis.visible = true
                btnZoomDisp.visible = true
            }
            Component.onCompleted: {
                objQuickMenu.sizeOfItem = Qt.size(250,50)
                objQuickMenu.addQuickMenuButton(btnProdScreen)
                objQuickMenu.addQuickMenuButton(btnProdScreenV2)
                objQuickMenu.addQuickMenuButton(btnFillAdjust)
                objQuickMenu.addQuickMenuButton(btnGeneral)
                objQuickMenu.addQuickMenuButton(btnZoomLine)
                objQuickMenu.addQuickMenuButton(btnXBarRS)
                objQuickMenu.addQuickMenuButton(btnStatis)
                objQuickMenu.addQuickMenuButton(btnZoomDisp)
            }
        }

        TK_QuickMenuButton {
            id: btnProdScreen
            visible: false
            txtButton: "Production Screen"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                rectBottom.switchScreen(0);
                toolButton_ChangeScreen.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnProdScreenV2
            visible: false
            txtButton: "Production Screen Ver2"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                rectBottom.switchScreen(1);
                toolButton_ChangeScreen.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnFillAdjust
            visible: false
            txtButton: "Fill Adjustment"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                rectBottom.switchScreen(2);
                toolButton_ChangeScreen.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnGeneral
            visible: false
            txtButton: "General"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                rectBottom.switchScreen(3);
                toolButton_ChangeScreen.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnZoomLine
            visible: false
            txtButton: "Zoom for each line"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                rectBottom.switchScreen(4);
                toolButton_ChangeScreen.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnXBarRS
            visible: false
            txtButton: "X-Bar R/S"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                rectBottom.switchScreen(5);
                toolButton_ChangeScreen.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnStatis
            visible: false
            txtButton: "Statis"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                toolButton_ChangeScreen.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnZoomDisp
            visible: false
            txtButton: "Zoom weight disp"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                toolButton_ChangeScreen.objQuickMenu.visible = false
            }
        }

        // quick menu OpeCheck
        TK_QuickMenuButton {
            id: toolButton_OpeCheck
            x: 396
            y: 0
            width: 200
            height: 64
            imgSourceBg: "image://MyProvider/w168h62_B.png"
            imgSourceActive: "image://MyProvider/w168h62_B_p.png"
            imgSourceIcon: "image://MyProvider/contbar_icon_operation.png"
            imgIconTopMargin: 18
            imgIconLeftMargin: 8
            wIcon: 32
            hIcon: 32
            txtButton: "Ope.Check"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 27
            textLeftMargin: 28
            colorText: "white"
            colorTextSelected: "white"
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignHCenter
            mMenuDirection: 0
            mMenuAlignment: 3
            mPosibleArea: Qt.rect(0,-640,640,1024)

            onClicked: {
                rectBottom.closeOtherQuickMenu(toolButton_SetAdj, toolButton_ProCntl, toolButton_ChangeScreen)
                btnEvalRJ.visible = true
                btnAccuracyCheck.visible = true
                btnStatusMonitor.visible = true
                btnOEE.visible = true
            }
            Component.onCompleted: {
                objQuickMenu.sizeOfItem = Qt.size(250,50)
                objQuickMenu.addQuickMenuButton(btnEvalRJ)
                objQuickMenu.addQuickMenuButton(btnAccuracyCheck)
                objQuickMenu.addQuickMenuButton(btnStatusMonitor)
                objQuickMenu.addQuickMenuButton(btnOEE)
            }
        }

        TK_QuickMenuButton {
            id: btnEvalRJ
            visible: false
            txtButton: "Eval/Rj Confirmation"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.EvalRJStart)
            }
        }

        TK_QuickMenuButton {
            id: btnAccuracyCheck
            visible: false
            txtButton: "Accuracy Check"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                toolButton_OpeCheck.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnStatusMonitor
            visible: false
            txtButton: "内部ステータスモニタ"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.InternalStatusMonitor)
            }
        }

        TK_QuickMenuButton {
            id: btnOEE
            visible: false
            txtButton: "OEE"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.Oee)
                toolButton_OpeCheck.objQuickMenu.visible = false
            }
        }

        // quick menu ProCtrl
        TK_QuickMenuButton {
            id: toolButton_ProCntl
            x: 597
            y: 0
            width: 170
            height: 64
            imgSourceBg: "image://MyProvider/w168h62_B.png"
            imgSourceActive: "image://MyProvider/w168h62_B_p.png"
            imgSourceIcon: "image://MyProvider/contbar_icon_manage.png"
            imgIconTopMargin: 18
            imgIconLeftMargin: 8
            wIcon: 32
            hIcon: 32
            txtButton: "Pro Cntl"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 27
            textLeftMargin: 28
            colorText: "white"
            colorTextSelected: "white"
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignHCenter
            mMenuDirection: 0
            mMenuAlignment: 3
            mPosibleArea: Qt.rect(0,-640,640,1024)

            onClicked: {
                rectBottom.closeOtherQuickMenu(toolButton_SetAdj, toolButton_OpeCheck, toolButton_ChangeScreen)
                btnInvalidV2.visible = true
                btnInvalidV1.visible = true
                btnClearStats.visible = true
                btnPresetCount.visible = true
                btnSaveUSB.visible = true
            }
            Component.onCompleted: {
                objQuickMenu.sizeOfItem = Qt.size(250,50)
                objQuickMenu.addQuickMenuButton(btnInvalidV2)
                objQuickMenu.addQuickMenuButton(btnInvalidV1)
                objQuickMenu.addQuickMenuButton(btnClearStats)
                objQuickMenu.addQuickMenuButton(btnPresetCount)
                objQuickMenu.addQuickMenuButton(btnSaveUSB)
            }
        }

        TK_QuickMenuButton {
            id: btnInvalidV2
            visible: false
            txtButton: "Invalid Line ver 2"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.InvalidLineV2)

            }
        }

        TK_QuickMenuButton {
            id: btnInvalidV1
            visible: false
            txtButton: "Invalid Line"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.InvalidLine)
                mainModel.InnerChangeBottomBar(ScreenMng.BottomBarInvalid)
            }
        }

        TK_QuickMenuButton {
            id: btnClearStats
            visible: false
            txtButton: "Clear Stats."
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                toolButton_ProCntl.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnPresetCount
            visible: false
            txtButton: "Preset count clear"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                toolButton_ProCntl.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnSaveUSB
            visible: false
            txtButton: "Save to USB memory"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                var component = Qt.createComponent("qrc:/Dialog/WaitDialog.qml");
                toolButton_ProCntl.objQuickMenu.visible = false
                appWindow.showDialog(component,1024,768);
            }
        }

        // quick menu SetAdj
        TK_QuickMenuButton {
            id: toolButton_SetAdj
            x: 768
            y: 0
            width: 170
            height: 64
            imgSourceBg: "image://MyProvider/w168h62_B.png"
            imgSourceActive: "image://MyProvider/w168h62_B_p.png"
            imgSourceIcon: "image://MyProvider/contbar_icon_config.png"
            imgIconTopMargin: 18
            imgIconLeftMargin: 8
            wIcon: 32
            hIcon: 32
            txtButton: "Pro Cntl"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 27
            textLeftMargin: 28
            colorText: "white"
            colorTextSelected: "white"
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignHCenter
            mMenuDirection: 0
            mMenuAlignment: 3
            mPosibleArea: Qt.rect(0,-640,640,1024)

            onClicked: {
                rectBottom.closeOtherQuickMenu(toolButton_ProCntl, toolButton_OpeCheck, toolButton_ChangeScreen)
                btnAdjustTimingV2.visible = true
                btnAdjustTimingV1.visible = true
                btnIOMonitor.visible = true
                btnGPnlMainAdjustTimingTblV2.visible = true
                btnGPnlMainAdjustTimingTbl.visible = true
                btnSensCorrStart.visible = true
                btnInputMasterWork.visible = true
            }
            Component.onCompleted: {
                objQuickMenu.sizeOfItem = Qt.size(220,50)
                objQuickMenu.addQuickMenuButton(btnAdjustTimingV2)
                objQuickMenu.addQuickMenuButton(btnAdjustTimingV1)
                objQuickMenu.addQuickMenuButton(btnIOMonitor)
                objQuickMenu.addQuickMenuButton(btnGPnlMainAdjustTimingTblV2)
                objQuickMenu.addQuickMenuButton(btnGPnlMainAdjustTimingTbl)
                objQuickMenu.addQuickMenuButton(btnSensCorrStart)
                objQuickMenu.addQuickMenuButton(btnInputMasterWork)
            }
        }

        TK_QuickMenuButton {
            id: btnAdjustTimingV2
            visible: false
            txtButton: "Timing Adjustment Ver4"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.AdjustTimingV2)

            }
        }

        TK_QuickMenuButton {
            id: btnAdjustTimingV1
            visible: false
            txtButton: "Timing Adjustment Ver3"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.AdjustTimingV1)
                mainModel.InnerChangeBottomBar(ScreenMng.BottomBarAdjustTiming)
                mainModel.InnerChangeStatusBar(ScreenMng.AdjustTimingStatusBar)
            }
        }

        TK_QuickMenuButton {
            id: btnIOMonitor
            visible: false
            txtButton: "IO Monitor"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.IOMonitor)
            }
        }

        TK_QuickMenuButton {
            id: btnGPnlMainAdjustTimingTblV2
            visible: false
            txtButton: "Timing Adjust ver2"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.GPnlMainAdjustTimingTblV2)
                mainModel.InnerChangeBottomBar(ScreenMng.BottomBarAdjustTiming)
            }
        }

        TK_QuickMenuButton {
            id: btnGPnlMainAdjustTimingTbl
            visible: false
            txtButton: "Timing Adjust"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.GPnlMainAdjustTimingTbl)
                toolButton_SetAdj.objQuickMenu.visible = false
            }
        }

        TK_QuickMenuButton {
            id: btnSensCorrStart
            visible: false
            txtButton: "Sensitivity Correction"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.SensCorrStart)
                mainModel.InnerChangeBottomBar(ScreenMng.BottomBarSensCorr)
            }
        }

        TK_QuickMenuButton {
            id: btnInputMasterWork
            visible: false
            txtButton: "Fine Adjustment"
            fontText.family: "Noto Sans"
            fontText.pixelSize: 18
            textAlignV: Text.AlignVCenter
            textAlignH: Text.AlignLeft
            textLeftMargin: 10
            onClicked: {
                mainModel.InnerChangeScreen(ScreenMng.InputMasterWork)
                mainModel.InnerChangeBottomBar(ScreenMng.BottomBarBackNextCancel)
            }
        }

        // show only one quick menu on screen
        function closeOtherQuickMenu(objOne, objTwo, objThree){
            if(objOne.objQuickMenu !== undefined){
                objOne.objQuickMenu.visible = false
            }
            if(objTwo.objQuickMenu !== undefined){
                objTwo.objQuickMenu.visible = false
            }
            if(objThree.objQuickMenu !== undefined){
                objThree.objQuickMenu.visible = false
            }
            else return
        }

        function switchScreen(index){
            if(index === 0){
                mainModel.InnerChangeScreen(ScreenMng.ProductionV1)
                screen1.source = "image://MyProvider/Icon_Screen_1_on.png";
                screen2.source = "image://MyProvider/dispswitchbtnno2.png";
                screen3.source = "image://MyProvider/dispswitchbtnno3.png";
                screen4.source = "image://MyProvider/dispswitchbtnno4.png";
                screen5.source = "image://MyProvider/dispswitchbtnno5.png";
            }else if(index === 1){
                mainModel.InnerChangeScreen(ScreenMng.ProductionV2)
                screen2.source = "image://MyProvider/Icon_Screen_2_on.png";
                screen1.source = "image://MyProvider/dispswitchbtnno1.png";
                screen3.source = "image://MyProvider/dispswitchbtnno3.png";
                screen4.source = "image://MyProvider/dispswitchbtnno4.png";
                screen5.source = "image://MyProvider/dispswitchbtnno5.png";
            }
            else if(index === 2)
            {
                mainModel.InnerChangeScreen(ScreenMng.FillingAmount)
                screen3.source = "image://MyProvider/Icon_Screen_3_on.png";
                screen2.source = "image://MyProvider/dispswitchbtnno2.png";
                screen1.source = "image://MyProvider/dispswitchbtnno1.png";
                screen4.source = "image://MyProvider/dispswitchbtnno4.png";
                screen5.source = "image://MyProvider/dispswitchbtnno5.png";
            }
            else if(index === 3)
            {
                mainModel.InnerChangeScreen(ScreenMng.ProductionV2)
                screen4.source = "image://MyProvider/Icon_Screen_4_on.png";
                screen3.source = "image://MyProvider/dispswitchbtnno3.png";
                screen2.source = "image://MyProvider/dispswitchbtnno2.png";
                screen1.source = "image://MyProvider/dispswitchbtnno1.png";
                screen5.source = "image://MyProvider/dispswitchbtnno5.png";
            }
            else if(index === 4)
            {
                mainModel.InnerChangeScreen(ScreenMng.ZoomLine3V)
                screen5.source = "image://MyProvider/Icon_Screen_5_on.png";
                screen4.source = "image://MyProvider/dispswitchbtnno4.png";
                screen3.source = "image://MyProvider/dispswitchbtnno3.png";
                screen2.source = "image://MyProvider/dispswitchbtnno2.png";
                screen1.source = "image://MyProvider/dispswitchbtnno1.png";
            }
            else if (index === 5)
            {
                mainModel.InnerChangeScreen(ScreenMng.XbarRS_NewChart)
            }
        }
    }
}
