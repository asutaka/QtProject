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

Item {
    id: objParamSetting
    property Item objSettingContent: rectcontentMenuList
    property int indexSelect: 1
    property int linePage: 10
    property int temp: 1
    property int  _currentLineNo: 1
    property bool display1: false
    property real wParent: 1024
    property real hParent: 640
    property real wLeftContent: 232
    property real hLeftContent: hParent
    property real wRightContent: 80
    property real hRightContent: hParent
    property real wMainContent: wParent - wLeftContent - wRightContent
    property real hMainContent: hParent
    property ParameterSettingVM paramSetting: _paramSetting

    ParameterSettingVM {
        id: _paramSetting
    }
    width: wParent
    height: hParent

    Label {
        id: lblValNumber
        visible: false
        text: "0"
        onTextChanged: {
            listModel.setValue(indexSelect - 1, lblValNumber.text)
        }
    }

    Label {
        id: lbIndex
        visible: false
        text: "0"
        onTextChanged: {
            navGridView.indexRowSelected = parseInt(lbIndex.text)
        }
    }

    ParameterSettingListModel {
        id: listModel
    }



    MenuBarSubControl {
        id: _menubarLayer
        x: 0
        y: 0
        width: 1024
        height: 40
        color: "#000"
    }

    Rectangle {
        width: 100
        height: 100
        color: 'pink'
        MouseArea{
            anchors.fill: parent
            onPressed: {
                console.log("ListModel:"+listModel.get(1).serial)
            }
        }
    }

    StartSwitchLineModule {
        id: rectLeftContent
        x: 0
        y: 40
        implicitWidth: wLeftContent
        implicitHeight: hLeftContent
        txtSwitchRight: paramSetting.txtForline
    }

    Rectangle {
        id: rectcontentMenuList
        x: 232
        y: 40
        width: 713
        height: 599
        color: "#EEF2E7"

        TK_DataGridView {
            id: lstParamSetting
            mWidth: parent.width
            mHeight: 200
            mReadOnly: true
            mRowHeight: 25
            mRowFont.pixelSize: 13
            mHeaderFont.pixelSize: 15
            mColHeaderWidth: 0
            mDataSource: listModel
            mColumnAddInfo: 0
            mSelectionMode: EnumControl.SELECTION_MODE_FULL_ROW_SELECT
            mHorizontalScrollBar: Qt.ScrollBarAlwaysOff
            mVerticalScrollBar: Qt.ScrollBarAsNeeded
            mArrColWidth: [100, 350, 250]
            mArrColName: ["No.", "パラメータ", "設定値"]

            mRowBackColor: ["#EFE7B6","#EEF2E7"]
            mRowSelectionColor: "#F69642"
            mCellBorderStyle: 4
            mArrAlignH: [Text.AlignLeft,Text.AlignHCenter,Text.AlignHCenter, Text.AlignHCenter]
            mInputType: ["serial", "param", "value"]
            mParameterCol: 3
            mImageError: "image://MyProvider/error_16x16.png"
            mImageEdit:  "image://MyProvider/editing.png"
            mHeaderImageSrc: "image://MyProvider/TabMenu.png"

            function updateHeight() {
                if (display1) {
                    if (lstParamSetting.rowCount < 10)
                        return rowCount * 6.5
                } else {
                    if (lstParamSetting.rowCount < 15)
                        return rowCount * 4.2
                }
            }
            onRowChanged: navGridViewtblView.indexRowSelected = lstParamSetting.mCurrentRow + 1
            onDoubleClickItem:{
                Ops.showCalculator(item, "0", "1000");
            }

            Component.onCompleted: {
                lstParamSetting.mCurrentRow = 0
            }
        }

        DialogInfoSubControl {
            id: rectInfo
            mTxtContent: listModel.getInfomation(indexSelect - 1)
            mWidth: 713
            mHeight: 599 - 4 * 58 - 55
            y: lstParamSetting.mHeight
            x: 0
        }
        function changeModeDisplay() {
            display1 = !display1
            lstParamSetting.mRowHeight = lstParamSetting.updateHeight()
        }

        function showInfo() {
            if (rectInfo.visible === true) {
                rectInfo.visible = false
            } else {
                rectInfo.visible = true
            }
        }
    }

    TK_Navigator {
        id: navGridViewtblView
        x: 944
        y: 40
        height: 599
        colorBackground: "#EEF2E7"
        fontName: "MS Gothic"
        fontSize: 27
        maxIndex:lstParamSetting.mRowCount
        numberRow:lstParamSetting.mRowCount
        indexRowSelected: 0

        onKeyChanged: {
            lstParamSetting.mCurrentRow = indexRowSelected - 1
            lstParamSetting.selection.clear();
            lstParamSetting.selection.select(indexSelect - 1)
        }

        onPressCenterKey: {
            Ops.showCalculator(lbIndex, "1", maxIndex.toString())
        }
    }

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
