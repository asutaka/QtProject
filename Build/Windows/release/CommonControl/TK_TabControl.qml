import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

Row {
    id: tabControl
    //    property	alias	id:                     Not customize   <=> CONTROL LIST: Name
    //    property	alias	enabled:                Not customize   <=> CONTROL LIST: Enabled
    //    property	alias	visible:                Not customize   <=> CONTROL LIST: Visibled
    //    property	alias	anchors.top:            Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias	anchors.bottom:         Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias	anchors.right:          Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias	anchors.left:           Not customize   <=> CONTROL LIST: Anchors(Left)
    //    property	alias	x:                      Not customize   <=> CONTROL LIST: Location(x)
    //    property	alias	y:                      Not customize   <=> CONTROL LIST: Location(y)
    //    property	alias	width:                  Not customize   <=> CONTROL LIST: Size(Width)
    //    property	alias	height:                 Not customize   <=> CONTROL LIST: Size(Height)
    //    property	alias	anchors.margins:        Not customize   <=> CONTROL LIST: Margin(All)
    //    property	alias	anchors.leftMargin:     Not customize   <=> CONTROL LIST: Margin(Left)
    //    property	alias	anchors.rightMargin:    Not customize   <=> CONTROL LIST: Margin(Right)
    //    property	alias	anchors.topMargin:      Not customize   <=> CONTROL LIST: Margin(Top)
    //    property	alias	anchors.bottomMargin:   Not customize   <=> CONTROL LIST: Margin(Bottom)

    //    property  bool    mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property  int     mImeMode                Not used        <=> CONTROL LIST: ImeMode
    //    property  bool    mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property  var     mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property  bool    mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property  int     mDock                   Not used        <=> CONTROL LIST: Dock
    //    property  alias   mImageList              Not used        <=> CONTROL LIST: ImageList
    //    property  alias   RightToLeftLayout       Not used        <=> CONTROL LIST: RightToLeftLayout

    property    int     mSpacingItem:           3
    property    bool    mAlignmentLeft:         false                       //  <=> CONTROL LIST: Alignment
    property    bool    mAlignmentTop:          true                        //  <=> CONTROL LIST: Alignment
    property    bool    mAlignmentBottom:       false                       //  <=> CONTROL LIST: Alignment
    property    bool    mAlignmentRight:        false                       //  <=> CONTROL LIST: Alignment
    property    bool    mRightToLeft:           false                       //  <=> CONTROL LIST: RightToLeft
    property    size    mItemSize:              Qt.size(100, 40)            //  <=> CONTROL LIST: ItemSize
    property    var     mPadding:               [15, 15]                    //  <=> CONTROL LIST: Padding
    property    var     mTabHeaderColor:        ["#F79642", "#EFF3E7"]      //  <=> CONTROL LIST: TabHeaderColor
    property    var     mTabTitleColor:         ["#FFF", "#000"]            //  <=> CONTROL LIST: TabTitleColor
    property    font    mFont:                  Qt.font({ pixelSize: 15 })  //  <=> CONTROL LIST: Font
    property    size    mMaximumSize:           Qt.size(1000, 1000)         //  <=> CONTROL LIST: MaximumSize
    property    size    mMinimumSize:           Qt.size(0, 0)               //  <=> CONTROL LIST: MinimumSize
    property    int     mAlign:                 _align.mTop                 //  <=> CONTROL LIST: Alignment
    property    int     mCursor:                Qt.ArrowCursor              //  <=> CONTROL LIST: Cursor
    property    bool    mUseWaitCursor:         false                       //  <=> CONTROL LIST: UseWaitCursor
    property    bool    mCausesValidation:      true                        //  <=> CONTROL LIST: CausesValidation
    property    int     mSizeMode:              sizeMode.mNormal            //  <=> CONTROL LIST: SizeMode
    property    int     mDrawMode:              1                           //  <=> CONTROL LIST: DrawMode
    property    bool    mMultiline:             false                       //  <=> CONTROL LIST: Multiline

    // Tab Content Property
    property    color   mTabBorderColor:        "#000"                      // Tab Frame Border Color
    property    color   mTabColor:              "#FFEBDE"                   // Tab Frame Color
    property    int     mTabBorderWidth:        3                           // Tab Frame Border Width
    property    int     mTabWidth:              800                         // Tab Frame Width
    property    int     mTabHeight:             400                         // Tab Frame Heiight

    // Tab Header Property
    property    color   mTabHeaderBorderColor:   "#fff"                     // Tab Header Border Color
    property    color   mTabShadowColor:        "#B6B9B2"                   // Tab Header Shadow Color
    property    int     mTabShadowH:            1                           // Tab Header Shadow Horizontal Offset
    property    int     mTabShadowV:            4                           // Tab Header Shodow Vertical Offset

    signal validating()

    // Alignment Options
    QtObject {
        id: _align
        property int mTop:      1       // Top option
        property int mBottom:   2       // Bottom option
        property int mLeft:     3       // Left option
        property int mRight:    4       // Right option
    }

    // SizeMode Options
    QtObject {
        id: sizeMode
        property int mNormal:       1   // Normal option
        property int mFillToRight:  2   // FillToRight option
        property int mFixed:        3   // Fixed option
    }

    // Tab Float Left
    Column {
        id: tabLeft
        spacing: mSpacingItem
        GridLayout {
            columns:  mMultiline ? Math.ceil(view.count / rows) : 1
            rows: Math.floor(mTabHeight / mItemSize.height)
            flow: GridLayout.TopToBottom
            Repeater {
                id: repeater
                model: view.count

                TabButton {
                    id: btnTabLeft
                    implicitWidth: {
                        switch(mSizeMode) {
                            case sizeMode.mNormal:
                            case sizeMode.mFillToRight:
                            case sizeMode.mFixed:
                                mItemSize.width + mPadding[1]
                                break
                            default:
                                break
                        }
                    }

                    implicitHeight: {
                        switch(mSizeMode) {
                            case sizeMode.mNormal:
                            case sizeMode.mFillToRight:
                                txtTabLeft.height + mPadding[1] + 10
                                break
                            case sizeMode.mFixed:
                                mItemSize.height + mPadding[1]
                                break
                            default:
                                break
                        }
                    }
                    onClicked: view.currentIndex = index

                    // Text of Tab
                    contentItem: Rectangle {
                        color: "transparent"
                        Text {
                            id: txtTabLeft
                            color: btnTabLeft.checked ? mTabTitleColor[0] : mTabTitleColor[1]
                            text: view.getTab(index).title
                            font: mFont

                            Component.onCompleted: {
                                switch (mSizeMode) {
                                    case sizeMode.mNormal:
                                    case sizeMode.mFillToRight:
                                        txtTabLeft.anchors.left = parent.left
                                        txtTabLeft.anchors.verticalCenter = parent.verticalCenter
                                        break
                                    case sizeMode.mFixed:
                                        txtTabLeft.anchors.centerIn = parent
                                        break
                                    default:
                                        break
                                }
                            }
                        }
                    }

                    // Tab Background Style
                    background: Rectangle {
                        id: txtLeft
                        color: btnTabLeft.checked ? mTabHeaderColor[0] : mTabHeaderColor[1]
                        border.color:  mTabHeaderBorderColor
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            horizontalOffset: mTabShadowH
                            verticalOffset: mTabShadowV
                            color: mTabShadowColor
                        }
                    }
                }

                Component.onCompleted: {
                    var max = 0
                    for(var i = 0; i < repeater.count; i++) {
                        max = max < repeater.itemAt(i).width ? repeater.itemAt(i).width : max
                    }
                }
            }
        }

        Component.onCompleted: {
            repeater.itemAt(0).checked = true
        }
    }

    // Tab Content
    TabView {
        id: view
        width: mTabWidth
        height: mTabHeight
        anchors.margins: 100

        style: TabViewStyle {
            frameOverlap: 1
            tabsMovable: true
            tabsAlignment: mRightToLeft ? Qt.AlignRight : Qt.AlignLeft

            tab: Rectangle {
                anchors.rightMargin: mSpacingItem
                color: styleData.selected ? mTabHeaderColor[0] : mTabHeaderColor[1]
                border.color: mTabHeaderBorderColor
                implicitWidth: {
                    switch (mSizeMode) {
                        case sizeMode.mNormal:
                        case sizeMode.mFillToRight:
                            txtTab.width + mPadding[0] + 20
                            break
                        case sizeMode.mFixed:
                            mItemSize.width + mPadding[0]
                            break
                        default:
                            break
                    }
                }
                implicitHeight: {
                    switch (mSizeMode) {
                        case sizeMode.mNormal:
                        case sizeMode.mFillToRight:
                            txtTab.height + mPadding[1] + 20
                            break
                        case sizeMode.mFixed:
                            mItemSize.height + mPadding[1]
                            break
                        default:
                            break
                    }
                }

                Text {
                    id: txtTab
                    text: styleData.title
                    color: styleData.selected ? mTabTitleColor[0] : mTabTitleColor[1]
                    font: mFont

                    Component.onCompleted: {
                        switch (mSizeMode) {
                            case sizeMode.mNormal:
                            case sizeMode.mFillToRight:
                                txtTab.anchors.left = parent.left
                                txtTab.anchors.verticalCenter = parent.verticalCenter
                                txtTab.anchors.leftMargin = 5
                                break
                            case sizeMode.mFixed:
                                txtTab.anchors.centerIn = parent
                                break
                            default:
                                break
                        }
                    }
                }
            }

            frame: Rectangle {
                color: mTabColor
                border.color: mTabBorderColor
                border.width: mTabBorderWidth
            }
        }

        MouseArea {
            anchors.fill: parent
            cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
            acceptedButtons: Qt.NoButton
        }
    }

    // Tab Float Right
    Column {
        id: tabRight
        spacing: mSpacingItem
        GridLayout {
            columns:  mMultiline ? Math.ceil(view.count / rows) : 1
            rows: Math.floor(mTabHeight / mItemSize.height) - 1
            flow: GridLayout.TopToBottom
            // Add TabButton
            Repeater {
                id: repRight
                model: view.count
                TabButton {
                    id: btnTabRight
                    implicitWidth: {
                        switch(mSizeMode) {
                        case sizeMode.mNormal:
                        case sizeMode.mFillToRight:
                        case sizeMode.mFixed:
                            mItemSize.width + mPadding[1]
                            break
                        default:
                            break
                        }
                    }

                    implicitHeight: {
                        switch(mSizeMode) {
                        case sizeMode.mNormal:
                        case sizeMode.mFillToRight:
                            txtTabRight.height + mPadding[1] + 10
                            break
                        case sizeMode.mFixed:
                            mItemSize.height + mPadding[1]
                            break
                        default:
                            break
                        }
                    }
                    onClicked: view.currentIndex = index

                    // Text Content
                    contentItem: Rectangle {
                        color: "transparent"
                        Text {
                            id: txtTabRight
                            color: btnTabRight.checked ? mTabTitleColor[0] : mTabTitleColor[1]
                            text: view.getTab(index).title
                            font: mFont

                            Component.onCompleted: {
                                switch (mSizeMode) {
                                case sizeMode.mNormal:
                                case sizeMode.mFillToRight:
                                    txtTabRight.anchors.right = parent.right
                                    txtTabRight.anchors.verticalCenter = parent.verticalCenter
                                    break
                                case sizeMode.mFixed:
                                    txtTabRight.anchors.centerIn = parent
                                    break
                                default:
                                    break
                                }
                            }
                        }
                    }

                    // Control Background
                    background: Rectangle {
                        color: btnTabRight.checked ? mTabHeaderColor[0] : mTabHeaderColor[1]
                        border.color:  mTabHeaderBorderColor
                        layer.enabled: true
                        layer.effect: DropShadow {
                            transparentBorder: true
                            horizontalOffset: mTabShadowH
                            verticalOffset: mTabShadowV
                            color: mTabShadowColor
                        }
                    }
                }
            }
        }
        Component.onCompleted: {
            repRight.itemAt(0).checked = true
        }
    }

    Component.onCompleted: {
        if (mCausesValidation) { validating() }
        __tabAlign()
        tabControl.width = __controlWidth()
        tabControl.height = __controlHeight()
    }

    // Add Component to Tab
    function addTab(title, component) {
        view.addTab(title, component)
    }

    // Get Component in Tab
    function getTab(index) {
        view.getTab(index)
    }

    // Insert new Tab
    function insertTab(index, title, component) {
        view.insertTab(index, title, component)
    }

    // Move a Tab
    function moveTab(from, to) {
        view.moveTab(from, to)
    }

    // Remove a Tab
    function removeTab(index) {
        view.removeTab(index)
    }

    // Control width
    function __controlWidth() {
        if (tabControl.width > mMaximumSize.width) return mMaximumSize.width
        if (tabControl.width < mMinimumSize.width) return mMinimumSize.width
        return tabControl.width
    }

    // Control Height
    function __controlHeight() {
        if (tabControl.height > mMaximumSize.height) return mMaximumSize.height
        if (tabControl.height < mMinimumSize.height) return mMinimumSize.height
        return tabControl.height
    }

    // Tab Alignment
    function __tabAlign() {
        switch(mAlign) {
            case _align.mTop:
                view.tabPosition = Qt.TopEdge
                view.tabsVisible = true
                tabLeft.visible = false
                tabRight.visible = false
                break
            case _align.mBottom:
                view.tabPosition = Qt.BottomEdge
                view.tabsVisible = true
                tabLeft.visible = false
                tabRight.visible = false
                break
            case _align.mLeft:
                view.tabsVisible = false
                tabLeft.visible = true
                tabRight.visible = false
                break
            case _align.mRight:
                view.tabsVisible = false
                tabLeft.visible = false
                tabRight.visible = true
                break
            default:
                break
        }
    }
}
