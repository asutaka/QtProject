import QtQuick 2.0
import CommonControl 1.0
import QtQuick.Controls 2.0

Rectangle {
    id: main

    property    var         mDataSource
    property    alias       mWidth:                 main.width
    property    alias       mHeight:                main.height
    property    alias       mX:                     main.x
    property    alias       mY:                     main.y
    property    var         mArrColWidth:           []
    property    var         mArrColName:            []
    property    var         mArrAlignV:             []
    property    var         mArrAlignH:             []
    property    string      mImageError:            ''
    property    string      mImageEdit:             ''
    property    string      mHeaderImageSrc:        ''
    property    font        mHeaderFont
    property    font        mRowFont
    property    var         mRowBackColor:          ["#EFE7B6","#EEF2E7"]
    property    color       mRowSelectionColor:     "#F69642"
    property    int         mRowHeight:             25
    property    var         mParameterCol:          []
    property    var         mInputType:             []
    property    int         mRowCount:              0

    width: parent.width
    height: 500
    clip: true

    signal click(var item)
    signal pressKeyCenter(var item)

    TK_DataGridView {
        id: grid
        mArrAlignH: main.mArrAlignH
        mArrAlignV: main.mArrAlignV
        mArrColName: main.mArrColName
        mArrColWidth: main.mArrColWidth
        mCellBorderStyle: 4
        mColHeaderWidth: 0
        mDataSource: main.mDataSource
        mHeaderFont: main.mHeaderFont
        mHeaderImageSrc: main.mHeaderImageSrc
        mHeight: main.height
        mHorizontalScrollBar: Qt.ScrollBarAlwaysOff
        mImageError: main.mImageError
        mImageEdit:  main.mImageEdit
        mInputType: main.mInputType
        mParameterCol: main.mParameterCol
        mReadOnly: true
        mRowBackColor: main.mRowBackColor
        mRowCount: main.mRowCount
        mRowFont: main.mRowFont
        mRowHeight: main.mRowHeight
        mRowSelectionColor: main.mRowSelectionColor
        mSelectionMode: 1
        mVerticalScrollBar: Qt.ScrollBarAsNeeded
        mWidth: main.width - nav.width

        onRowChanged: {
            nav.indexRowSelected = grid.mCurrentRow + 1
        }
        onClickItem: {
            click(item)
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
            pressKeyCenter(lbIndex)
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

    Component.onCompleted: {
        mHeaderFont.pixelSize = 15
        mRowFont.pixelSize = 13
    }
}


