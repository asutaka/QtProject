import QtQuick 2.0
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.2
import "qrc:/Control/VirtualKey.js" as Ops
import "qrc:/Control/switchControl"
import "qrc:/Control/switchLineUC"
import "qrc:/ParameterSetting"
import "qrc:/BottomBar"
import ControlApp 1.0
import CommonControl 1.0
import CommonModule 1.0
import Frame 1.0

Item {
    id: objParamSetting
    property Item objSettingContent: menuListFrame
//    property int linePage: 10
//    property int temp: 1
//    property int  _currentLineNo: 1
    property bool display1: false
    property int indexSelect: 1
    property real wParent: 1024
    property real hParent: 640
    property real wLeftContent: 232
    property real hLeftContent: hParent
//    property real wRightContent: 80
//    property real hRightContent: hParent
//    property real wMainContent: wParent - wLeftContent - wRightContent
//    property real hMainContent: hParent
    property ParameterSettingVM paramSetting: _paramSetting

    width: wParent
    height: hParent

    ParameterSettingVM {
        id: _paramSetting
    }

    ParameterSettingListModel {
        id: listModel
    }

    TK_MenuListFrame {
        id: menuListFrame
        color: 'red'
        width: parent.width
        height: parent.height
        menuListObject.mHeaderImageSrc: "image://MyProvider/TabMenu.png"
        menuListObject.mDataSource: listModel
        menuListObject.y: 40
        menuListObject.width : menuListFrame.width - rectLeftContent.width
        menuListObject.height: menuListFrame.height - menuListObject.y
        menuListObject.anchors.left: rectLeftContent.right
        menuListObject.mInputType: ["serial", "param", "value"]
        menuListObject.mArrColWidth: [100, 350, 250]
        menuListObject.mArrColName: ["No.", "パラメータ", "設定値"]
        menuListObject.mArrAlignH: [Text.AlignLeft,Text.AlignHCenter,Text.AlignHCenter, Text.AlignHCenter]


        MenuBarSubControl {
            id: _menubarLayer
            x: 0
            y: 0
            width: 1024
            height: 40
            color: "#000"
        }

        StartSwitchLineModule {
            id: rectLeftContent
            x: 0
            y: 40
            implicitWidth: wLeftContent
            implicitHeight: hLeftContent
            txtSwitchRight: paramSetting.txtForline
        }

        ////        DialogInfoSubControl {
        ////            id: rectInfo
        ////            mTxtContent: listModel.getInfomation(indexSelect - 1)
        ////            mWidth: 713
        ////            mHeight: 599 - 4 * 58 - 55
        ////            y: lstParamSetting.mHeight
        ////            x: 0
        ////        }


        ////        function showInfo() {
        ////            if (rectInfo.visible === true) {
        ////                rectInfo.visible = false
        ////            } else {
        ////                rectInfo.visible = true
        ////            }
        ////        }

        function changeModeDisplay() {
            display1 = !display1
            console.log("DEF:"+menuListObject.rowCount)
            console.log("ABC:"+menuListFrame.updateHeight())
            menuListObject.mRowHeight = menuListFrame.updateHeight()
        }

        function updateHeight() {
            if (display1) {
                if (menuListObject.rowCount < 10)
                    return menuListObject.rowCount * 6.5
            } else {
                if (menuListObject.rowCount < 15)
                    return menuListObject.rowCount * 4.2
            }
        }
    }








//    Rectangle {
//        id: rectcontentMenuList
//        x: 232
//        y: 40
//        width: 713
//        height: 599
//        color: "#EEF2E7"

//        TK_DataGridView {
//            id: lstParamSetting
//            mWidth: parent.width
//            mHeight: 200
//            mReadOnly: true
//            mRowHeight: 25
//            mRowFont.pixelSize: 13
//            mHeaderFont.pixelSize: 15
//            mColHeaderWidth: 0
//            mDataSource: listModel
//            mColumnAddInfo: 0
//            mSelectionMode: EnumControl.SELECTION_MODE_FULL_ROW_SELECT
//            mHorizontalScrollBar: Qt.ScrollBarAlwaysOff
//            mVerticalScrollBar: Qt.ScrollBarAsNeeded
//            mArrColWidth: [100, 350, 250]
//            mArrColName: ["No.", "パラメータ", "設定値"]

//            mRowBackColor: ["#EFE7B6","#EEF2E7"]
//            mRowSelectionColor: "#F69642"
//            mCellBorderStyle: 4
//            mArrAlignH: [Text.AlignLeft,Text.AlignHCenter,Text.AlignHCenter, Text.AlignHCenter]
//            mInputType: ["serial", "param", "value"]
//            mParameterCol: 3
//            mImageError: "image://MyProvider/error_16x16.png"
//            mImageEdit:  "image://MyProvider/editing.png"
//            mHeaderImageSrc: "image://MyProvider/TabMenu.png"

//            function updateHeight() {
//                if (display1) {
//                    if (menuListFrame.menuListObject.rowCount < 10)
//                        return rowCount * 6.5
//                } else {
//                    if (menuListFrame.menuListObject.rowCount < 15)
//                        return rowCount * 4.2
//                }
//            }
////            onRowChanged: navGridViewtblView.indexRowSelected = lstParamSetting.mCurrentRow + 1
//            onDoubleClickItem:{
//                Ops.showCalculator(item, "0", "1000");
//            }

//            Component.onCompleted: {
//                lstParamSetting.mCurrentRow = 0
//            }
//        }

////        DialogInfoSubControl {
////            id: rectInfo
////            mTxtContent: listModel.getInfomation(indexSelect - 1)
////            mWidth: 713
////            mHeight: 599 - 4 * 58 - 55
////            y: lstParamSetting.mHeight
////            x: 0
////        }
//            function changeModeDisplay() {
//                display1 = !display1
//                menuListFrame.menuListObject.mRowHeight = menuListFrame.menuListObject.updateHeight()
//            }

////        function showInfo() {
////            if (rectInfo.visible === true) {
////                rectInfo.visible = false
////            } else {
////                rectInfo.visible = true
////            }
////        }
//    }

//    /////
//    TK_Navigator {
//        id: navGridViewtblView
//        x: 944
//        y: 40
//        height: 599
//        colorBackground: "#EEF2E7"
//        fontName: "MS Gothic"
//        fontSize: 27
//        maxIndex:lstParamSetting.mRowCount
//        numberRow:lstParamSetting.mRowCount
//        indexRowSelected: 0

//        onKeyChanged: {
//            lstParamSetting.mCurrentRow = indexRowSelected - 1
//            lstParamSetting.selection.clear();
//            lstParamSetting.selection.select(indexSelect - 1)
//        }

//        onPressCenterKey: {
//            Ops.showCalculator(lbIndex, "1", maxIndex.toString())
//        }
//    }

//    Label {
//        id: lbIndex
//        visible: false
//        text: "0"
//        onTextChanged: {
//            navGridViewtblView.indexRowSelected = parseInt(lbIndex.text)
//        }
//    }
//    /////

    Component.onCompleted: {
        paramSetting.OnLoad()
        updateText()
        updateColumnName()
        mainModel.onChangeLanguage.connect(updateText)
    }

    function updateText() {
        paramSetting.onUpdateLang()
        listModel.updateData()
        rectLeftContent.txtSwitchRight = paramSetting.txtForline
    }

    function updateColumnName() {
        paramSetting.onUpdateColumnName()
    }
}
