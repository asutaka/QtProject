import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0


TreeView {
    id: treeView

    //  property    alias   model                   // model includes nodes of treeview
    //	property	alias	id:                     Not customize	<=>	CONTROL LIST:	Name
    //	property	alias	enabled:                Not customize	<=>	CONTROL LIST:	Enabled
    //	property	alias	visible:                Not customize	<=>	CONTROL LIST:	Visible
    //	property	alias	anchors.top:            Not customize	<=>	CONTROL LIST:	Anchors(Top)
    //	property	alias	anchors.bottom:         Not customize	<=>	CONTROL LIST:	Anchors(Bottom)
    //	property	alias	anchors.right:          Not customize	<=>	CONTROL LIST:	Anchors(Right)
    //	property	alias	anchors.left:           Not customize	<=>	CONTROL LIST:	Anchors(Left)
    //	property	alias	x:                      Not customize	<=>	CONTROL LIST:	Location(x)
    //	property	alias	y:                      Not customize	<=>	CONTROL LIST:	Location(y)
    //	property	alias	width:                  Not customize	<=>	CONTROL LIST:	Size(Width)
    //	property	alias	height:                 Not customize	<=>	CONTROL LIST:	Size(Height)
    //	property	alias	anchors.margins:        Not customize	<=>	CONTROL LIST:	Margin(All)
    //	property	alias	anchors.leftMargin:     Not customize	<=>	CONTROL LIST:	Margin(Left)
    //	property	alias	anchors.rightMargin:	Not customize	<=>	CONTROL LIST:	Margin(Right)
    //	property	alias	anchors.topMargin:      Not customize	<=>	CONTROL LIST:	Margin(Top)
    //	property	alias	anchors.bottomMargin:	Not customize	<=>	CONTROL LIST:	Margin(Bottom)

    //	property	bool	mGeneratemember             Not used	<=>	CONTROL LIST:	Generatemember
    //	property	bool	mLocked                     Not used	<=>	CONTROL LIST:	Locked
    //	property	var     mModifiers                  Not used	<=>	CONTROL LIST:	Modifiers
    //	property	bool	mAllowDrop                  Not used	<=>	CONTROL LIST:	AllowDrop
    //	property	int     mDock                       Not used	<=>	CONTROL LIST:	Dock
    //  property	alias	mImageIndex                 Not used	<=>	CONTROL LIST:	ImageIndex
    //  property	alias	mImageKey                   Not used	<=>	CONTROL LIST:	ImageKey
    //  property	alias	mImageList                  Not used	<=>	CONTROL LIST:	ImageList
    //  property	alias	mImeMode                    Not used	<=>	CONTROL LIST:	ImeMode
    //  property	alias	mFullRowSelect
    //  property	alias	mLineColor
    //  property	alias	mNodes
    //  property	alias	mPathSeparator
    //  property	alias	mShowLines
    //  property	alias	mShowPlusMinus
    //  property	alias	mShowRootLines
    //  property	alias	mBorderStyle

    property	int     mSelectedImageIndex         //Not used because it's used at model
    property	var     mStateImageList             //Not used because it's used at model
    property	string	mSelectedImageKey           //Not used because it's used at model

    property	size	mMaximumSize:           Qt.size(0,0)                        //  <=>	CONTROL LIST:	MaximumSize
    property	size	mMinimumSize:           Qt.size(0,0)                        //  <=>	CONTROL LIST:	MinimumSize
    property	color	mForeColor                                                  //  <=>	CONTROL LIST:	ForeColor
    property	int     mItemHeight:            30                                  //  <=>	CONTROL LIST:	ItemHeight
    property	bool	mRightToLeft                                                //  <=>	CONTROL LIST:	RightToLeft
    property	bool	mRightToLeftLayout                                          //  <=>	CONTROL LIST:	RightToLeftLayout
    property	int     mIndent:                5                                   //  <=>	CONTROL LIST:	Indent
    property	color	mBackColor:             "#99C3C7"                           //  <=>	CONTROL LIST:	BackColor
    property	bool	mCheckBoxes                                                 //  <=>	CONTROL LIST:	CheckBoxes
    property	font	mItemFont                                                   //  <=>	CONTROL LIST:	Font
    property	font	mHeaderFont                                                 //  <=>	CONTROL LIST:	Font
    property	alias	mHScrollable:           treeView.horizontalScrollBarPolicy  //  <=>	CONTROL LIST:	Scrollable
    property    alias   mVScrollable:           treeView.verticalScrollBarPolicy    //  <=>	CONTROL LIST:	Scrollable
    property    color   mHeaderBackColor:       "#34495E"                           //  Background color of header
    property    color   mHeaderForeColor:       "#FFEBDE"                           //  Fore color of header
    property    color   mSelectionColor:        "#F5B041"                           //  Background color of item when it's selected
    property    color   mAlternatingRowColor:   "#B8CAC5"                           //  2nd background color of item
    property    var     mCausesValidation:      RegExpValidator {
                                                    regExp: /[0-9A-Fa-f.-]+/ }      //  <=> CONTROL LIST:   CausesValidation
    property	int     mDrawMode:              1                                   //  <=>	CONTROL LIST:	DrawMode
    property	bool	mUseWaitCursor:         false                               //  <=>	CONTROL LIST:	UseWaitCursor
    property    int     mCursor:                Qt.ArrowCursor                      //  <=> CONTROL LIST:   Cursor

    signal validating()

    backgroundVisible: true

    style: TreeViewStyle {
        backgroundColor: mBackColor
    }

    headerVisible: true

    headerDelegate: Rectangle {
        height: mItemHeight
        color: mHeaderBackColor
        Text {
            anchors.fill: parent
            anchors.margins: 5
            font: mHeaderFont
            text: styleData.value
            color: mHeaderForeColor
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }

    rowDelegate: Rectangle {
        height: mItemHeight
        color: styleData.selected ? mSelectionColor : (styleData.row % 2 === 0 ? mAlternatingRowColor :mBackColor)
    }

    itemDelegate:  Row {
        layoutDirection: mRightToLeftLayout ? Qt.RightToLeft : Qt.LeftToRight
        spacing: mIndent
        CheckBox {
            id:  checkItem
            anchors.verticalCenter: parent.verticalCenter
            visible: (mCheckBoxes && styleData.column === 0) ? true : false
        }

        Text {
            id: itemText
            anchors.verticalCenter: parent.verticalCenter
            font: mItemFont
            color: mForeColor
            horizontalAlignment:  mRightToLeft ? Text.AlignRight : Text.AlignLeft
            text: styleData.value === undefined ? "" : styleData.value

            onTextChanged: {
                if (mCausesValidation) { validating() }
            }
        }
    }

    onHeightChanged: {
        checkMinMaxHeight()
    }

    onWidthChanged: {
        checkMinMaxWidth()
    }

    Component.onCompleted: {
        checkMinMaxHeight()
        checkMinMaxWidth()
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }

    function checkMinMaxHeight(){
        if(mMinimumSize.height > 0 && treeView.height <= mMinimumSize.height) {
            treeView.height = mMinimumSize.height
        }

        if(mMaximumSize.height > 0 && treeView.height >= mMaximumSize.height) {
            treeView.height = mMaximumSize.height
        }
    }

    function checkMinMaxWidth(){
        if( mMinimumSize.width > 0 && treeView.width <= mMinimumSize.width) {
            treeView.width = mMinimumSize.width
        }

        if(mMaximumSize.width > 0 && treeView.width >= mMaximumSize.width) {
            treeView.width = mMaximumSize.width
        }
    }
}

