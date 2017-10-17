import QtQuick 2.0
import CommonControl 1.0
import QtQuick.Controls 2.0
import "qrc:/Control/VirtualKey.js" as Ops

Item {
    id: main

    property    var         mDataSource
    property    alias       mWidth:                 main.width
    property    alias       mHeight:                main.height
    property    alias       mX:                     main.x
    property    alias       mY:                     main.y
    property    var         mArrColWidth:           []                                              // Create newly: array width of column
    property    var         mArrColName:            []                                              // Create newly: array name of column header
    property    var         mArrAlignV:             []                                              // Create newly: array Align vertical of column
    property    var         mArrAlignH:             []                                              // Create newly: array Align horizontal of column
    property    string      mImageError:            ''
    property    string      mImageEdit:             ''
    property    string      mHeaderImageSrc:        ''
    property    int         indexSelect:            1

    TK_DataGridView {
        id: grid
        mWidth: main.width - nav.width
        mHeight: main.height
        mDataSource: main.mDataSource
        mImageError: main.mImageError
        mImageEdit:  main.mImageEdit
        mHeaderImageSrc: main.mHeaderImageSrc
        mReadOnly: true
        mSelectionMode: 1
        mHorizontalScrollBar: Qt.ScrollBarAlwaysOff
        mVerticalScrollBar: Qt.ScrollBarAsNeeded
        mRowBackColor: ["#EFE7B6","#EEF2E7"]
        mCellBorderStyle: 4
        mRowSelectionColor: "#F69642"
        mHeaderFont.pixelSize: 15
        mRowFont.pixelSize: 13
        mRowHeight: 25
        mColHeaderWidth: 0
        mArrColWidth: main.mArrColWidth
        mArrColName: main.mArrColName
        mArrAlignV: main.mArrAlignV
        mArrAlignH: main.mArrAlignH
        onRowChanged: {
            nav.indexRowSelected = grid.mCurrentRow + 1
        }
        onClickItem: {
            console.log("ClickItem:"+grid.mCurrentRow)
        }

        Component.onCompleted: {
            grid.mCurrentRow = 0
        }
    }

    TK_Navigator {
        id: nav
        height: main.height
        anchors.left: grid.right
        colorBackground: "#EEF2E7"
        fontName: "MS Gothic"
        fontSize: 27
        maxIndex:grid.mDataSource.count
        numberRow:grid.mDataSource.count
        indexRowSelected: 0

        onKeyChanged: {
            grid.mCurrentRow = indexRowSelected - 1
        }

        onPressCenterKey: {
            Ops.showCalculator(lbIndex, "1", maxIndex.toString())
        }
    }

    Label {
        id: lbIndex
        visible: false
        text: "0"
        onTextChanged: {
            nav.indexRowSelected = parseInt(lbIndex.text)
        }
    }

    QtObject {
        id: objPrivateComponent
        property ListModel items : ListModel {}
    }
}


