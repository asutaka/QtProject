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
import ControlApp 1.0
import CommonControl 1.0
import CommonModule 1.0

Item {
    id: objParamSettingv2
    property Item objSettingContent: rectcontentMenuListv2
    property int indexSelect: 1;
    property int linePage: 10;
    property int temp;
    property int  _currentLineNo: 1
    property real wParent: 1024
    property real hParent: 640
    property real wLeftContent: 232
    property real hLeftContent: hParent
    property real wRightContent: 80
    property real hRightContent: hParent
    property real wMainContent: wParent - wLeftContent - wRightContent
    property real hMainContent: hParent
    property ParameterSettingVM paramSetting: _paramSetting
    property real rowHeight: 1

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

    ParameterSettingVM {
        id: _paramSetting
    }

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

    Rectangle {
        id: rectcontentMenuListv2
        x: 232
        y: 40
        width: 713
        height: 599
        color: "#EEF2E7"

        TK_DataGridView {
            id: list
            mWidth: parent.width
            mHeight: 200
            mReadOnly: true
            mRowHeight: 40
            mRowFont.pixelSize: 13
            mHeaderFont.pixelSize: 15
            mColHeaderWidth: 0
            mDataSource: listModel
            mSelectionMode: EnumControl.SELECTION_MODE_FULL_ROW_SELECT
            mHorizontalScrollBar: Qt.ScrollBarAlwaysOff
            mVerticalScrollBar: Qt.ScrollBarAsNeeded
            mArrColWidth: [100, 350, 250]
            mArrColName: ["No.", "パラメータ", "設定値"]

            mRowBackColor: ["#EFE7B6","#EEF2E7"]
            mRowSelectionColor: "#F69642"
            mCellBorderStyle: 4
            mArrAlignH: [Text.AlignLeft,Text.AlignHCenter,Text.AlignLeft, Text.AlignHCenter]
            mInputType: ["serial", "param", "value"]
            mParameterCol: 3
            mColumnAddInfo: 2
            mImageError: "image://MyProvider/error_16x16.png"
            mImageEdit:  "image://MyProvider/editing.png"
            mHeaderImageSrc: "image://MyProvider/TabMenu.png"
            onRowChanged: navGridViewtblView.indexRowSelected = list.mCurrentRow + 1
            onDoubleClickItem:{
                Ops.showCalculator(item, "0", "1000");
            }
            Component.onCompleted: {
                list.mCurrentRow = 0
            }
        }

        DialogInfoSubControl {
            id: rectInfo
            mTxtContent: listModel.getInfomation(indexSelect - 1).toString()
            mWidth: 713
            mHeight: 599 - 4 * 58 - 55
            y: list.mHeight
            x: 0
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
        maxIndex:list.mRowCount
        numberRow:list.mRowCount
        indexRowSelected: 0

        onKeyChanged: {
            list.mCurrentRow = indexRowSelected - 1
            list.selection.clear();
            list.selection.select(indexSelect - 1)
        }

        onPressCenterKey: {
            Ops.showCalculator(lbIndex, "1", maxIndex.toString())
        }
    }

    function updateText() {
        paramSetting.onUpdateLang()
        listModel.updateData()
        rectLeftContent.txtSwitchRight = paramSetting.txtForline
    }

    Component.onCompleted: {
        paramSetting.OnLoad()
        updateColumnName()
        updateText()
        mainModel.onChangeLanguage.connect(updateText)
    }

    function updateColumnName() {
        paramSetting.onUpdateColumnName()
    }
}
