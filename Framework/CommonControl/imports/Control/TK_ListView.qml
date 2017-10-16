import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
import QtQml.Models 2.2

Rectangle {
    id: rectBack

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

    //    property	bool 	mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property	bool	mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property	var 	mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property	bool	mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property	var 	mImeMode                Not used        <=> CONTROL LIST: ImeMode
    //    property	int 	mDock                   Not used        <=> CONTROL LIST: Dock
    //    property  var     mSmallImageList         Not used        <=> CONTROL LIST: SmallImageList
    //    property  var     mColumns                Using TK_DataGridView
    //    property  var     mHeaderStyle            Using TK_DataGridView
    //    property  bool    mGridLines:             Using TK_DataGridView
    //    properrt  bool    mScrollable             Using Flickable
    //    property  bool    mAllowColumnReorder     Cause           <=> When type view = detail --> AllowColumnReorder: use TK_DataGridView to alternative
    //    property  alias	mFullRowSelect          Cause           <=> When type view = detail --> AllowColumnReorder: use TK_DataGridView to alternative
    //    property  bool    mAutoArrange            Cause           <=> AutoArrange: this View inherits GridView --> alway autoArrange
    //    property  bool    mOwnerDraw              Cause           <=> Select mode draw ListView is operating system or user's code.
    //    property  var     mVirtualListSize        Cause           <=> This property defined when VirtualMode = true
    //    property  var     mVirtualMode            Cause           <=> Select mode to add data to ListView, when virtualMode = true, data will not add directly to ListView. Data will be created dynamic and display if need--> not find out solution to implement


    property    int             mActivation:                activation.mStandard        //  <=> CONTROL LIST: Activation
    property    int             mLayoutDirection:           Qt.LeftToRight              //  <=> CONTROL LIST: Alignment
    property    int             mOrientation:               Qt.Vertical                 //  <=> CONTROL LIST: Alignment
    property    int             mGridVerticalDirection:     GridView.TopToBottom        //  <=> CONTROL LIST: Alignment
    property    int             mListVerticalDirection:     ListView.TopToBottom        //  <=> CONTROL LIST: Alignment
    property    var             mItems                                                  //  <=> CONTROL LIST: Items
    property    int             mLabelWrap:                 Text.WordWrap               //  <=> CONTROL LIST: LabelWrap
    property    int             mView:                      typeView.mList              //  <=> CONTROL LIST: View
    property	alias           mBackColor:                 rectBack.color              //  <=> CONTROL LIST: BackColor
    property    bool            mCheckBoxes:                false                       //  <=> CONTROL LIST: CheckBoxes
    property    size            mMaximumSize:               Qt.size(500, 500)           //  <=> CONTROL LIST: MaximumSize
    property    size            mMinimumSize:               Qt.size(0, 0)               //  <=> CONTROL LIST: MinimumSize
    property	font            mFont                                                   //  <=> CONTROL LIST: Font
    property	color           mForeColor                                              //  <=> CONTROL LIST: ForeColor
    property	string          mBackgroundImage:           ""                          //  <=> CONTROL LIST: BackgroundImage
    property	bool            mBackgroundImageTiled:      false                       //  <=> CONTROL LIST: BackgroundImageTiled
    property    int             mSorting:                   1                           //  <=> CONTROL LIST: Sorting
    property    bool            mScrollable:                true                        //  <=> CONTROL LIST: Scrollable
    property    var             mMultiSelect                                            //  <=> CONTROL LIST: MultiSelect
    property    bool            mShowGroups                                             //  <=> CONTROL LIST: ShowGroups
    property	bool            mCausesValidation:          false                       // <=> CONTROL LIST: CausesValidation
    property    int             mCursor:                    Qt.ArrowCursor              // <=> CONTROL LIST: Cursor
    property	bool            mUseWaitCursor:             false                       // <=> CONTROL LIST: UseWaitCursor
	property 	bool       		mRightToLeft:           	false                   	// <=> CONTROL LIST: RightToLeft
	property  	bool     		mRightToLeftLayout:      	false 		                // <=> CONTROL LIST: RightToLeftLayout


    signal validating()
    property size mTileSize: Qt.size(300, 80)
    property size mImageSize: Qt.size(50, 50)
    property int mListTypeMargin: 10

    // Width, Height
    property size mLargeIconSize: Qt.size(60, 70)
    property size mSmallIconSize: Qt.size(100, 20)

    property size mSmallImageSize: Qt.size(30, 20)
    property size mLargeImageSize: Qt.size(50, 50)

    property int mCurrentIndex: __listView.visible ? __listView.currentIndex : __gridView.currentIndex

    property color mHighlightColor: "lightblue"
    property real mHighlightOpacity: 0.4

    signal itemActivate()
    color: "black"

    QtObject {
        id: typeView
        property int mLargeIcon:    1
        property int mDetails:      2
        property int mSmallIcon:    3
        property int mList:         4
        property int mTile:         5
    }

    QtObject {
        id: activation
        property int mStandard: 1
        property int mOneClick: 2
        property int mTwoClick: 3
    }

    QtObject {
        id: sorting
        property int mNone:         1
        property int mAscending:    2
        property int mDescending:   3
    }

    Image {
        id: imgBackground
        source: mBackgroundImage
        fillMode: mBackgroundImageTiled ? Image.Tile : Image.Stretch

        Component.onCompleted: {
            if (mBackgroundImageTiled)
                anchors.fill = parent
        }
    }

    DelegateModel {
        id: delegateListModel
        model: mItems

        groups: [
            DelegateModelGroup { name: "selected" }
        ]

        delegate: mView === typeView.mList ? __typeListView : __tideView
    }

    DelegateModel {
        id: delegateGridModel
        model: mItems

        groups: [
            DelegateModelGroup { name: "selected" }
        ]

        delegate:mView === typeView.mLargeIcon ? __largeIconView : __smallIconView
    }

    // Include List Style and Tile Style
    ScrollView {
        id: __scrollListView
        anchors.fill: parent
        verticalScrollBarPolicy: mScrollable ? Qt.ScrollBarAsNeeded : Qt.ScrollBarAlwaysOff
        horizontalScrollBarPolicy: mScrollable ? Qt.ScrollBarAsNeeded : Qt.ScrollBarAlwaysOff

        ListView {
            id: __listView
            focus: true
            model: delegateListModel
            anchors.fill: parent

            // Layout alignment
            orientation: mOrientation
            layoutDirection:{
                if(mRightToLeftLayout)
                {
                    if(mRightToLeft)
                    {
                        Qt.RightToLeft
                    }
                    else
                    {
                        Qt.LeftToRight
                    }
                }
                else
                {
                    mLayoutDirection
                }
            }
            verticalLayoutDirection: mListVerticalDirection

            section.property: "group"
            section.criteria: ViewSection.FullString
            section.delegate: sectionHeading
        }
    }

    ScrollView {
        id: __scrollGridView
        anchors.fill: parent
        verticalScrollBarPolicy: mScrollable ? Qt.ScrollBarAsNeeded : Qt.ScrollBarAlwaysOff
        horizontalScrollBarPolicy: mScrollable ? Qt.ScrollBarAsNeeded : Qt.ScrollBarAlwaysOff

        // Include LargeIcon Style and SmallIcon Style
        GridView {
            id: __gridView
            focus: true
            anchors.fill: parent
            model: delegateGridModel

            // Layout alignment
            layoutDirection:{
                if(mRightToLeftLayout)
                {
                    if(mRightToLeft)
                    {
                        Qt.RightToLeft
                    }
                    else
                    {
                        Qt.LeftToRight
                    }
                }
                else
                {
                    mLayoutDirection
                }
            }
            verticalLayoutDirection: mGridVerticalDirection
//            delegate:  mView === typeView.mLargeIcon ? __largeIconView : __smallIconView

            // Selected Item Style
            highlight: Rectangle {
                color: mHighlightColor
                opacity: mHighlightOpacity
            }
        }
    }

    Component {
        id: sectionHeading

        Rectangle {
            width: __gridView.width
            height: childrenRect.height

            Text {
                id: textSection
                text: section
                font.bold: true
                font.pixelSize: 15
                verticalAlignment: Text.AlignVCenter
            }

            Canvas {
                id: root
                // canvas size
                anchors.fill: parent
                // handler to override for drawing
                onPaint: {
                    // get context to draw with
                    var ctx = getContext("2d")
                    // setup the stroke
                    ctx.lineWidth = 1
                    ctx.strokeStyle = "blue"
                    // setup the fill
                    ctx.fillStyle = "steelblue"
                    // begin a new path to draw
                    ctx.beginPath()
                    // top-left start point
                    ctx.moveTo(textSection.width + 10, height / 2)
                    // upper line
                    ctx.lineTo(width - 10, height / 2)
                    // left line through path closing
                    ctx.closePath()
                    // fill using fill style
                    ctx.fill()
                    // stroke using line width and stroke style
                    ctx.stroke()
                }
            }
        }
    }

    // LargeIcon Style
    Component {
        id: __largeIconView
        Rectangle {
            id: _large
            width: __gridView.cellWidth
            height: __gridView.cellHeight
            color: _large.DelegateModel.inSelected ? mHighlightColor : mBackColor

            Column {
                spacing: 3
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                Row {
                    anchors.horizontalCenter: parent.horizontalCenter
                    CheckBox {
                        id: chkItems
                        visible: mCheckBoxes
                    }
                    Image {
                        id: __img
                        source: largeIcon
                        width: mLargeImageSize.width
                        height: mLargeImageSize.height
                    }
                }
                Text {
                    id: __txt
                    text: name
                    color: fontColor
                    wrapMode: Text.NoWrap
                    font.family: fontName
                    font.pixelSize: fontSize
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }

            // Mouse Handler
            MouseArea {
                anchors.fill: parent

                onClicked: {
                    mouse.accepted = false
                    __gridView.currentIndex = index
                    if (mActivation === activation.mOneClick) {
                        itemActivate()
                    }
                }

                onDoubleClicked: {
                    mouse.accepted = false
                    if (mActivation === activation.mTwoClick) {
                        itemActivate()
                    }
                }

                onPressed: {
                    mouse.accepted = false
                    _large.DelegateModel.inSelected = !_large.DelegateModel.inSelected
                }

                onReleased: mouse.accepted = false
                onPositionChanged: mouse.accepted = false
                onPressAndHold: mouse.accepted = false
            }
        }
    }

    // SmallIcon Style
    Component {
        id: __smallIconView
        Rectangle {
            // Each Item Content
            id: _small
            width: __gridView.cellWidth
            height: __gridView.cellHeight / 2
            color: _small.DelegateModel.inSelected ? mHighlightColor : mBackColor

            Row {
                spacing: 3
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                CheckBox {
                    id: chkItems
                    visible: mCheckBoxes
                    anchors.verticalCenter: parent.verticalCenter
                }
                Image {
                    id: __img
                    source: smallIcon
                    anchors.verticalCenter: parent.verticalCenter
                }
                Text {
                    id: __txt
                    text: name
                    color: fontColor
                    wrapMode: mLabelWrap
                    font.family: fontName
                    font.pixelSize: fontSize
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            // Each Item MouseArea
            MouseArea {
                anchors.fill: parent

                onClicked: {
                    mouse.accepted = false
                    __gridView.currentIndex = index
                    if (mActivation === activation.mOneClick) {
                        itemActivate()
                    }
                }

                onDoubleClicked: {
                    mouse.accepted = false
                    if (mActivation === activation.mTwoClick) {
                        itemActivate()
                    }
                }

                onPressed: {
                    mouse.accepted = false
                    _small.DelegateModel.inSelected = !_small.DelegateModel.inSelected
                }

                onReleased: mouse.accepted = false
                onPositionChanged: mouse.accepted = false
                onPressAndHold: mouse.accepted = false
            }
        }
    }

    // ListView Style
    Component {
        id: __typeListView
        Rectangle {
            id: _list
            width: __listView.width
            height: __img.height + mListTypeMargin * 2
            color: _list.DelegateModel.inSelected ? mHighlightColor : mBackColor

            Row {
                spacing: 2
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                CheckBox {
                    id: chkItems
                    visible: mCheckBoxes
                }
                Image {
                    id: __img
                    width: mSmallImageSize.width
                    height: mSmallImageSize.height
                    source: smallIcon
                }
                Text {
                    id: __txt
                    text: name
                    color: fontColor
                    wrapMode: mLabelWrap
                    font.family: fontName
                    font.pixelSize: fontSize
                }
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    mouse.accepted = false
                    __listView.currentIndex = index
                    if (mActivation === activation.mOneClick) {
                        itemActivate()
                    }
                }

                onDoubleClicked: {
                    mouse.accepted = false
                    if (mActivation === activation.mTwoClick) {
                        itemActivate()
                    }
                }

                onPressed: {
                    mouse.accepted = false
                    _list.DelegateModel.inSelected = !_list.DelegateModel.inSelected
                }

                onReleased: mouse.accepted = false
                onPositionChanged: mouse.accepted = false
                onPressAndHold: mouse.accepted = false
            }
        }
    }

    // Tile Style
    Component {
        id: __tideView
        Rectangle {
            id: _tile
            height: mTileSize.height
            width: mTileSize.width
            color: _tile.DelegateModel.inSelected ? mHighlightColor : mBackColor

            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                CheckBox {
                    id: chkItems
                    visible: mCheckBoxes
                }
                Image {
                    source: largeIcon
                    width: mImageSize.width
                    height: mImageSize.height
                }
                Text {
                    text: name
                    color: fontColor
                    wrapMode: mLabelWrap
                    font.family: fontName
                    font.pixelSize: fontSize
                }
            }

            MouseArea {
                anchors.fill: parent

                onClicked: {
                    mouse.accepted = false
                    __listView.currentIndex = index
                    if (mActivation === activation.mOneClick) {
                        itemActivate()
                    }
                }

                onDoubleClicked: {
                    mouse.accepted = false
                    if (mActivation === activation.mTwoClick) {
                        itemActivate()
                    }
                }

                onPressed: {
                    mouse.accepted = false
                    _tile.DelegateModel.inSelected = !_tile.DelegateModel.inSelected
                }

                onReleased: mouse.accepted = false
                onPositionChanged: mouse.accepted = false
                onPressAndHold: mouse.accepted = false
            }
        }
    }

    Component.onCompleted: {
        __getViewType()
        rectBack.width = __getWidth()
        rectBack.height = __getHeight()
        __sorting(mSorting)
        validating()
    }

    function __getViewType() {
        switch (mView) {
            case typeView.mLargeIcon:
            case typeView.mSmallIcon:
                __scrollListView.visible = false
                __scrollGridView.visible = true
                break
            case typeView.mList:
            case typeView.mDetails:
            case typeView.mTile:
                __scrollListView.visible = true
                __scrollGridView.visible = false
                break
            default:
                break
        }
    }

    function __getWidth() {
        if (rectBack.width > mMaximumSize.width) return mMaximumSize.width
        if (rectBack.width < mMinimumSize.width) return mMinimumSize.width
        return rectBack.width
    }

    function __getHeight() {
        if (rectBack.height > mMaximumSize.height) return mMaximumSize.height
        if (rectBack.height < mMinimumSize.height) return mMinimumSize.height
        return rectBack.height
    }

    function __sortAscendingItem() {
        for (var n = 0; n < mItems.count; n++) {
            for (var i = n + 1; i < mItems.count; i++) {
                if (mItems.get(n).name > mItems.get(i).name) {
                    mItems.move(i, n, 1)
                    n = 0
                }
            }
        }
    }

    function __sortDescendingItem() {
        for (var n = 0; n < mItems.count; n++) {
            for (var i = n + 1; i < mItems.count; i++) {
                if (mItems.get(n).name < mItems.get(i).name) {
                    mItems.move(i, n, 1)
                    n = 0
                }
            }
        }
    }

    function __sorting(sortType) {
        switch(sortType) {
            case sorting.mAscending:
                __sortAscendingItem()
                break
            case sorting.mDescending:
                __sortDescendingItem()
                break
            default:
                break
        }
    }
    MouseArea{
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }
}
