import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQml.Models 2.2

Rectangle {
    id: main

    //    property	alias	id:                     Not customize   <=> CONTROL LIST: Name
    //    property	alias	anchors.top:            Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias	anchors.bottom:         Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias	anchors.right:          Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias	anchors.left:           Not customize   <=> CONTROL LIST: Anchors(Left)
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
    //    property  int     mDrawMode:              Not used        <=> CONTROL LIST: DrawMode

    property    int     mAlignment:             objAlignment.mTop           //  <=> CONTROL LIST: Alignment
    property    color   mBackColor:             'transparent'               //  <=> CONTROL LIST: BackColor
    property    bool    mCausesValidation:      false                       //  <=> CONTROL LIST: CausesValidation
    property    int     mCursor:                Qt.ArrowCursor              //  <=> CONTROL LIST: Cursor
    property	alias	mEnabled:               main.enabled                //  <=> CONTROL LIST: Enabled
    property    font    mFont:                  Qt.font({ pixelSize: 15 })  //  <=> CONTROL LIST: Font
    property	alias	mHeight:                main.height                 //  <=> CONTROL LIST: Size(Height)
    property    size    mItemSize:              Qt.size(100, 40)            //  <=> CONTROL LIST: ItemSize
    property    size    mMaximumSize:           Qt.size(0, 0)               //  <=> CONTROL LIST: MaximumSize
    property    size    mMinimumSize:           Qt.size(0, 0)               //  <=> CONTROL LIST: MinimumSize
    property    bool    mMultiline:             false                       //  <=> CONTROL LIST: Multiline
    property    var     mPadding:               [0, 0]                      //  <=> CONTROL LIST: Padding
    property    bool    mRightToLeft:           false                       //  <=> CONTROL LIST: RightToLeft
    property    bool    mRightToLeftLayout:     false                       //  <=> CONTROL LIST: RightToLeftLayout
    property    int     mSizeMode:              objSizeMode.mNormal         //  <=> CONTROL LIST: SizeMode
    property    bool    mUseWaitCursor:         false                       //  <=> CONTROL LIST: UseWaitCursor
    property	alias	mVisible:               main.visible                //  <=> CONTROL LIST: Visibled
    property	alias	mWidth:                 main.width                  //  <=> CONTROL LIST: Size(Width)
    property	alias	mX:                     main.x                      //  <=> CONTROL LIST: Location(x)
    property	alias	mY:                     main.y                      //  <=> CONTROL LIST: Location(y)


    // Tab Content Property
    property    color   mTabBorderColor:        "#000"                      // Tab Frame Border Color
    property    color   mTabColor:              "#f0f0f0"                   // Tab Frame Color
    property    int     mTabBorderWidth:        0                           // Tab Frame Border Width
    // Tab Header Property
    property    color   mTabHeaderBorderColor:  "#fff"                      // Tab Header Border Color
    property    color   mTabHeaderBackgroundColor:'#EFF3E7'                 // Tab Header Background Color
    property    color   mTabShadowColor:        "#B6B9B2"                   // Tab Header Shadow Color
    property    int     mTabShadowH:            0                           // Tab Header Shadow Horizontal Offset
    property    int     mTabShadowV:            0                           // Tab Header Shodow Vertical Offset
    property    var     mTabHeaderColor:        ["#F79642", "#EFF3E7"]      // TabHeaderColor

    //Add New
    property    var     mTabTitleColor:         ["#FFF", "#000"]            // TabTitleColor
    property    int     mSizeButtonScroll:      25                          // size of button scroll tabHeader
    property    var     mButtonScrollControl:   ['#f0f0f0','orange']
    property    int     mSpacingItem:           3
    property    Item    mFlowLayout                                         //Create Newly: item reference object FlowLayout
    property    Item    mTabView                                            //Create Newly: item reference object Tabview

    color: mBackColor
    signal validating()
    Grid{
        columns: {
            if (mAlignment == objAlignment.mTop || mAlignment == objAlignment.mBottom) {
                return 1;
            } else {
                return 2;
            }
        }
        rows: {
            if (mAlignment == objAlignment.mTop || mAlignment == objAlignment.mBottom) {
                return 2;
            } else {
                return 1;
            }
        }

        Loader{
            id: loaderFirst
            sourceComponent: {
                if (mAlignment == objAlignment.mBottom || mAlignment == objAlignment.mRight) {
                    componentSecond
                } else {
                    componentFirst
                }

            }
            onStatusChanged: {
                if (status == Loader.Ready){
                    if (mAlignment == objAlignment.mBottom || mAlignment == objAlignment.mRight) {
                        mTabView = item
                    }
                    else {
                        mFlowLayout = item
                    }
                }
            }
        }
        Loader{
            id: loaderSecond

            sourceComponent: {
                if (mAlignment == objAlignment.mBottom || mAlignment == objAlignment.mRight) {
                    componentFirst
                } else {
                    componentSecond
                }

            }
            onStatusChanged: {
                if (status == Loader.Ready){
                    if (mAlignment == objAlignment.mBottom || mAlignment == objAlignment.mRight) {
                        mFlowLayout = item
                    }
                    else {
                        mTabView = item
                    }
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: {
            if(mUseWaitCursor){
                return Qt.WaitCursor
            }
            else {
                return mCursor
            }
        }
        acceptedButtons: Qt.NoButton
    }

    Component.onCompleted: {
        if (mCausesValidation) { validating() }

        //maximumsize
        if(mMaximumSize.width !== 0)
        {
            if(mWidth > mMaximumSize.width)
                mWidth = mMaximumSize.width;
        }
        if(mMaximumSize.height !== 0)
        {
            if(mHeight > mMaximumSize.height)
                mHeight = mMaximumSize.height;
        }
        //minimumsize
        if(mMinimumSize.width !== 0)
        {
            if(mWidth < mMinimumSize.width)
                mWidth = mMinimumSize.width;
        }
        if(mMinimumSize.height !== 0)
        {
            if(mHeight < mMinimumSize.height)
                mHeight = mMinimumSize.height;
        }
    }

    Component{
        id: componentFirst

        Rectangle {
            id: tabHeader
            property alias objFlowTabButton: flowTabButton

            color: 'transparent'
            width: {
                switch(mAlignment){
                case objAlignment.mLeft:
                case objAlignment.mRight:
                    flowTabButton.height
                    break
                case objAlignment.mBottom:
                case objAlignment.mTop:
                default:
                    flowTabButton.width
                    break
                }
            }

            height: {
                switch(mAlignment){
                case objAlignment.mLeft:
                case objAlignment.mRight:
                    flowTabButton.width
                    break
                case objAlignment.mBottom:
                case objAlignment.mTop:
                default:
                    flowTabButton.height
                    break
                }
            }
            TK_FlowLayoutPanel{
                id: flowTabButton
                mTopPadding:            0
                mRightPadding:          0
                mLeftPadding:           0
                mBottomPadding:         0
                mScrollBarVPolicy: Qt.ScrollBarAlwaysOff
                mScrollBarHPolicy: Qt.ScrollBarAlwaysOff
                mBackColor: 'transparent'
                width: {
                    switch(mAlignment){
                    case objAlignment.mLeft:
                    case objAlignment.mRight:
                        main.mHeight
                        break
                    case objAlignment.mBottom:
                    case objAlignment.mTop:
                    default:
                        main.mWidth
                        break
                    }
                }

                height: {
                    if(objPrivateProperty.mMultiline_real) {
                        var numberTabButtonOnLine = Math.floor(main.mWidth/(mItemSize.width+mSpacingItem));
                        var numberLineOnHeader = Math.ceil(mTabView.count/numberTabButtonOnLine)
                        return mItemSize.height*numberLineOnHeader
                    } else {
                        return mItemSize.height
                    }
                }

                mSpacing: 0
                mModel: itemModel
                mWrapContents: {
                    if(objPrivateProperty.mMultiline_real)
                        return true
                    return false
                }
                mFlowDirection: {
                    return 0
                }
                mRightToLeft: {
                    var layout = main.mRightToLeft && main.mRightToLeftLayout
                    if(mAlignment == objAlignment.mLeft){
                        return !layout
                    } else {
                        return layout
                    }
                }
                rotation: {
                    switch(mAlignment){
                    case objAlignment.mLeft:
                        270
                        break
                    case objAlignment.mRight:
                        90
                        break
                    case objAlignment.mBottom:
                    case objAlignment.mTop:
                    default:
                        0
                        break
                    }
                }
                x:{
                    if (mAlignment == objAlignment.mLeft || mAlignment == objAlignment.mRight) {
                        0 - (flowTabButton.width - flowTabButton.height)/2
                    } else {
                        return 0
                    }
                }
                y: {
                    if (mAlignment == objAlignment.mLeft || mAlignment == objAlignment.mRight) {
                        0 - (flowTabButton.height - flowTabButton.width)/2
                    } else {
                        return 0
                    }
                }

                Rectangle {
                    id: rectBack
                    z:1

                    width: mSizeButtonScroll
                    height: mSizeButtonScroll
                    clip: true
                    color: {
                        if(mouseBack.pressed)
                            return mButtonScrollControl[0]
                        return mButtonScrollControl[1]
                    }
                    MouseArea{
                        id: mouseBack
                        anchors.fill: parent
                        onClicked: {
                            if(mAlignment === objAlignment.mTop || mAlignment === objAlignment.mBottom){
                                rectNext.enabled = true
                                if(mFlowLayout.children[0].mFlow.x >= 0){
                                    rectBack.enabled = false
                                    return
                                }
                                mFlowLayout.children[0].mFlow.x += mItemSize.width
                            }
                        }
                    }
                    Text {
                        anchors.centerIn: parent
                        text: '<'
                        font: mFont
                        Component.onCompleted: { font.bold = true }
                    }
                    anchors{
                        right: rectNext.left
                        rightMargin: 2
                        top: {
                            if(mAlignment === objAlignment.mTop)
                                return parent.top
                        }
                        bottom: {
                            if(mAlignment === objAlignment.mBottom)
                                return parent.bottom
                        }
                        verticalCenter: parent.verticalCenter
                    }
                    visible: {
                        if(mAlignment === objAlignment.mTop || mAlignment === objAlignment.mBottom){
                            if(flowTabButton.mFlow.width > main.width)
                                return true
                        }
                        return false
                    }
                }
                Rectangle {
                    id: rectNext
                    z:1
                    anchors{
                        right: parent.right
                        top: {
                            if(mAlignment === objAlignment.mTop)
                                return parent.top
                        }
                        bottom: {
                            if(mAlignment === objAlignment.mBottom)
                                return parent.bottom
                        }
                        verticalCenter: parent.verticalCenter
                    }

                    width: mSizeButtonScroll
                    height: mSizeButtonScroll
                    color: {
                        color: {
                            if(mouseNext.pressed)
                                return mButtonScrollControl[0]
                            return mButtonScrollControl[1]
                        }
                    }
                    clip: true
                    visible: {
                        if(mAlignment === objAlignment.mTop || mAlignment === objAlignment.mBottom){
                            if(flowTabButton.mFlow.width > main.width)
                                return true
                        }
                        return false
                    }

                    Text {
                        anchors.centerIn: parent
                        text: '>'
                        font: mFont
                        Component.onCompleted: { font.bold = true }
                    }
                    MouseArea{
                        id: mouseNext
                        anchors.fill: parent
                        onClicked: {
                            if(mAlignment === objAlignment.mTop || mAlignment === objAlignment.mBottom){
                                rectBack.enabled = true

                                if((flowTabButton.mFlow.width + flowTabButton.mFlow.x) < main.width - 2*mSizeButtonScroll){
                                    rectNext.enabled = false
                                    return
                                }
                                rectNext.enabled = true
                                mFlowLayout.children[0].mFlow.x -= mItemSize.width
                            }
                        }
                    }
                }
            }
        }
    }

    Component{
        id: componentSecond
        TabView {
            id: tabView
            tabsVisible: false
            width: {
                switch(mAlignment){
                case objAlignment.mLeft:
                case objAlignment.mRight:
                    main.width - mFlowLayout.width
                    break
                case objAlignment.mTop:
                case objAlignment.mBottom:
                default:
                    main.width
                    break
                }
            }

            height: {
                switch(mAlignment){
                case objAlignment.mLeft:
                case objAlignment.mRight:
                    main.height
                    break
                case objAlignment.mTop:
                case objAlignment.mBottom:
                default:
                    main.height - mFlowLayout.height
                    break
                }
            }

            style: TabViewStyle {
                frameOverlap: 1
                tabsMovable: true

                tab: Rectangle {
                    anchors.rightMargin: mSpacingItem
                    color: styleData.selected ? mTabHeaderColor[0] : mTabHeaderColor[1]
                    border.color: mTabHeaderBorderColor
                    implicitWidth: {
                        switch (mSizeMode) {
                        case objSizeMode.mNormal:
                            txtTab.width + mPadding[0] + 20
                            break
                        case objSizeMode.mFillToRight:
                            txtTab.width + mPadding[0] + 20
                            break
                        case objSizeMode.mFixed:
                            mItemSize.width + mPadding[0]
                            break
                        default:
                            break
                        }
                    }
                    implicitHeight: {
                        switch (mSizeMode) {
                        case objSizeMode.mNormal:
                        case objSizeMode.mFillToRight:
                            txtTab.height + mPadding[1] + 20
                            break
                        case objSizeMode.mFixed:
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
                        padding: mPadding[0]

                        Component.onCompleted: {
                            switch (mSizeMode) {
                            case objSizeMode.mNormal:
                            case objSizeMode.mFillToRight:
                                txtTab.anchors.left = parent.left
                                txtTab.anchors.verticalCenter = parent.verticalCenter
                                txtTab.anchors.leftMargin = 5
                                break
                            case objSizeMode.mFixed:
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
        }
    }


    ObjectModel {
        id: itemModel

        Repeater {
            model: mTabView.count
            Rectangle {
                color: mTabHeaderBackgroundColor
                clip: true
                width: {
                    var parentWidth =  mFlowLayout.objFlowTabButton.width
                    var numberTabButtonOnLine = Math.floor(parentWidth/(mItemSize.width+mSpacingItem));
                    var numberLineOnHeader = Math.ceil(mTabView.count/numberTabButtonOnLine)
                    var currentLine = Math.floor(index / numberTabButtonOnLine)
                    if (currentLine == numberLineOnHeader - 1) {
                        numberTabButtonOnLine = mTabView.count - currentLine*numberTabButtonOnLine
                    }

                    var w = mItemSize.width
                    switch(mSizeMode) {
                    case objSizeMode.mFillToRight:
                        if(mMultiline && numberLineOnHeader > 1){
                            w = parentWidth/numberTabButtonOnLine - mSpacingItem
                        }
                        break
                    case objSizeMode.mNormal:
                    case objSizeMode.mFixed:
                    default:
                        break
                    }
                    return w + mSpacingItem
                }

                height: {
                    return mItemSize.height
                }

                TabButton {
                    id: btnTabButton
                    width: parent.width - mSpacingItem
                    height: parent.height
                    checked: index === mTabView.currentIndex

                    onClicked: {
                        mTabView.currentIndex = index
                    }

                    // Text of Tab
                    contentItem: Text {
                        id: txtTabButton
                        color: {
                            if(btnTabButton.checked){
                                return mTabTitleColor[0]
                            }
                            else {
                                return mTabTitleColor[1]
                            }
                        }
                        text: mTabView.getTab(index).title
                        padding: mPadding[0]
                        font: mFont

                        Component.onCompleted: {
                            switch (mSizeMode) {
                            case objSizeMode.mNormal:
                            case objSizeMode.mFillToRight:
                                txtTabButton.anchors.left = parent.left
                                txtTabButton.anchors.verticalCenter = parent.verticalCenter
                                break
                            case objSizeMode.mFixed:
                                txtTabButton.anchors.centerIn = parent
                                break
                            default:
                                break
                            }
                        }
                    }

                    // Tab Background Style
                    background: Rectangle {
                        color: {
                            if(btnTabButton.checked){
                                return mTabHeaderColor[0]
                            }
                            else{
                                return mTabHeaderColor[1]
                            }
                        }
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
    }
        // Alignment Options
        QtObject {
            id: objAlignment
            property int mTop:      0       // Top option
            property int mBottom:   1       // Bottom option
            property int mLeft:     2       // Left option
            property int mRight:    3       // Right option
        }
        // SizeMode Options
        QtObject {
            id: objSizeMode
            property int mNormal:       0   // Normal option
            property int mFillToRight:  1   // FillToRight option
            property int mFixed:        2   // Fixed option
        }
        //Private Attribute
        QtObject {
            id: objPrivateProperty
            property bool  mMultiline_real: {
                if (mAlignment == objAlignment.mLeft || mAlignment ==objAlignment.mRight) {
                    return true
                } else {
                    return mMultiline
                }
            }
        }

        // Add Component to Tab
        function addTab(title, component) {
            mTabView.addTab(title, component)
        }

        // Get Component in Tab
        function getTab(index) {
            mTabView.getTab(index)
        }

        // Insert new Tab
        function insertTab(index, title, component) {
            mTabView.insertTab(index, title, component)
        }

        // Move a Tab
        function moveTab(from, to) {
            mTabView.moveTab(from, to)
        }

        // Remove a Tab
        function removeTab(index) {
            mTabView.removeTab(index)
        }
}
