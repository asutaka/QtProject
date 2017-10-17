import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0
import QtQml.Models 2.2
import QtGraphicalEffects 1.0


TreeView {
    id: treeView

    //  property    alias   model                   Not customize	<=>	CONTROL LIST:	Nodes
    //	property	alias	id:                     Not customize	<=>	CONTROL LIST:	Name
    //	property	alias	anchors.top:            Not customize	<=>	CONTROL LIST:	Anchors(Top)
    //	property	alias	anchors.bottom:         Not customize	<=>	CONTROL LIST:	Anchors(Bottom)
    //	property	alias	anchors.right:          Not customize	<=>	CONTROL LIST:	Anchors(Right)
    //	property	alias	anchors.left:           Not customize	<=>	CONTROL LIST:	Anchors(Left)
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
    //  property	int     mDrawMode:                  Not used    <=> CONTROL LIST:	DrawMode Replace by mComponentItem

    property	string	mSelectedImageKey       //Not used because it's used at model
    property	int     mSelectedImageIndex     //Not used because it's used at model
    property	var     mStateImageList         //Not used because it's used at model

    property    color   mAlternatingRowColor:   "#B8CAC5"                           //  2nd background color of item
    property	color	mBackColor:             "#99C3C7"                           //  <=>	CONTROL LIST:	BackColor
    property    color   mBorderColor:           "black"                             //  Color of border
    property	int     mBorderStyle:           borderStyle.mNone                   //  <=> CONTROL LIST:   BorderStyle
    property    int     mBorderWidth:           2                                   //  Width of border
    property    var     mCausesValidation:      RegExpValidator {
                                                    regExp: /[0-9A-Fa-f.-]+/ }      //  <=> CONTROL LIST:   CausesValidation
    property	bool	mCheckBoxes                                                 //  <=>	CONTROL LIST:	CheckBoxes
    property    int     mCursor:                Qt.ArrowCursor                      //  <=> CONTROL LIST:   Cursor
    property	alias	mEnabled:               treeView.enabled                    //	<=>	CONTROL LIST:	Enabled
    property	color	mForeColor                                                  //  <=>	CONTROL LIST:	ForeColor
    property	bool	mFullRowSelect:         false                               //  <=>	CONTROL LIST:	FullRowSelect
    property    color   mHeaderBackColor:       "#34495E"                           //  Background color of header
    property	font	mHeaderFont                                                 //  <=>	CONTROL LIST:	Font
    property    color   mHeaderForeColor:       "#FFEBDE"                           //  Fore color of header
    property	alias	mHeight:                treeView.height                     //	<=>	CONTROL LIST:	Size(Height)
    property	alias	mHScrollable:           treeView.horizontalScrollBarPolicy  //  <=>	CONTROL LIST:	Scrollable
    property	int     mIndent:                5                                   //  <=>	CONTROL LIST:	Indent
    property	font	mItemFont                                                   //  <=>	CONTROL LIST:	Font
    property	int     mItemHeight:            30                                  //  <=>	CONTROL LIST:	ItemHeight
    property	color	mLineColor:             "black"                             //  <=> CONTROL LIST:   LineColor
    property	size	mMaximumSize:           Qt.size(0,0)                        //  <=>	CONTROL LIST:	MaximumSize
    property	size	mMinimumSize:           Qt.size(0,0)                        //  <=>	CONTROL LIST:	MinimumSize
    property	string	mPathSeparator:         "/"                                 //  <=>	CONTROL LIST:	PathSeparator
    property	bool	mRightToLeft                                                //  <=>	CONTROL LIST:	RightToLeft
    property	bool	mRightToLeftLayout                                          //  <=>	CONTROL LIST:	RightToLeftLayout
    property    color   mSelectionColor:        "#F5B041"                           //  Background color of item when it's selected
    property	bool	mShowLines:             false
    property	bool	mShowPlusMinus:         true                                //  <=> CONTROL LIST:   ShowPlusMinus
    property	bool	mShowRootLines:         false
    property	bool	mUseWaitCursor:         false                               //  <=>	CONTROL LIST:	UseWaitCursor
    property	alias	mVisible:               treeView.visible                    //	<=>	CONTROL LIST:	Visible
    property    alias   mVScrollable:           treeView.verticalScrollBarPolicy    //  <=>	CONTROL LIST:	Scrollable
    property	alias	mWidth:                 treeView.width                      //	<=>	CONTROL LIST:	Size(Width)
    property	alias	mX:                     treeView.x                          //	<=>	CONTROL LIST:	Location(x)
    property	alias	mY:                     treeView.y                          //	<=>	CONTROL LIST:	Location(y)

    //AddNew
    property    string      mIconPlus:              ""                              //Icon Node TreeView when Collapse
    property    string      mIconMinus:             ""                              //Icon Node TreeView when expanded
    property    int         mSelectedNode_Index:    -1                              //support property SelectedNode: getIndex
    property    string      mSelectedNode_Parent:   ''                              //support property SelectedNode: getParent
    property    string      mSelectedNode_Text:     ''                              //support property SelectedNode: getText
    property    string      mSelectedNode_FullPath: ''                              //support property SelectedNode: getFullPath
    property    Component   mComponentItem:         comItem                         //component set item

    signal validating()

    backgroundVisible: true

    style: TreeViewStyle {
        backgroundColor: mBackColor

        branchDelegate: Button {
            id: imgPlusMinus
            visible: mShowPlusMinus
            width: {
                if(mIconPlus !== ''){
                    return objPrivate.mBranchWidth
                }
                else {
                    return 0
                }
            }
            height: objPrivate.mBranchWidth
            anchors.verticalCenter: if(parent) { parent.verticalCenter }
            anchors.horizontalCenter: if(parent) { parent.horizontalCenter }
            style: ButtonStyle{ background: Rectangle { color: "white" } }

            Image {
                anchors.fill: parent
                source: {
                    if(styleData.isExpanded)
                        return mIconMinus
                    return mIconPlus
                }
            }

            onClicked: {
                if(styleData.isExpanded) {
                    treeView.collapse(styleData.index)
                } else {
                    mPrivateLock = true
                    treeView.expand(styleData.index )
                }
            }
        }
    }

    selectionMode: SelectionMode.SingleSelection

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
        color: {
            if(mFullRowSelect && !mShowLines){
                if(styleData.selected){
                    return mSelectionColor
                }
                else if(styleData.row % 2 === 0){
                    return mAlternatingRowColor
                }
                else {
                    return mBackColor
                }
            }
            else {
                return 'transparent'
            }
        }
    }

    itemDelegate:  Rectangle {
        id: rectItem

        color: {
            if(mFullRowSelect && !mShowLines){
                return 'transparent'
            }
            else {
                if(styleData.selected){
                    return mSelectionColor
                }
                else if(styleData.row % 2 === 0){
                    return mAlternatingRowColor
                }
                else {
                    return mBackColor
                }
            }
        }

        Canvas {
            //rootLine when styleData.depth = 0
            id: _cv_Line
            x: -(1 + styleData.depth) * objPrivate.mBranchWidth
            width: (1 + styleData.depth) * objPrivate.mBranchWidth + mIndent
            height: parent.height
            visible: (styleData.column === 0 && mShowLines)
            onPaint: {
                if((styleData.depth === 0 && mShowRootLines) || styleData.depth !== 0){
                    var ctx = getContext("2d");
                    ctx.strokeStyle = mLineColor //color of line
                    var x_h, y_h, x_v, y_v

                    //Draw horizontal line
                    if(styleData.hasChildren){
                        x_h = objPrivate.mBranchWidth
                    }
                    else{
                        x_h = objPrivate.mBranchWidth/2
                    }
                    x_h += styleData.depth * objPrivate.mBranchWidth
                    y_h = _cv_Line.height/2
                    drawHorizontalLine(ctx, x_h, y_h, _cv_Line.width)


                    //Draw vertical line
                    for(var i = 0; i <= styleData.depth; i++) {
                        if(i === 0 && !mShowRootLines) {
                            continue;
                        }
                        x_v = objPrivate.mBranchWidth/2 + i * objPrivate.mBranchWidth
                        if(styleData.hasChildren && (styleData.row !== 0) && i === styleData.depth) {
                            y_v = 0
                            drawVerticalLine(ctx, x_v, y_v,  (_cv_Line.height - objPrivate.mBranchWidth)/2)
                            y_v =  (_cv_Line.height + objPrivate.mBranchWidth)/2
                            drawVerticalLine(ctx, x_v, y_v, _cv_Line.height)
                        } else {
                            if(styleData.hasChildren && styleData.row === 0){
                                y_v = (_cv_Line.height + objPrivate.mBranchWidth)/2
                            }
                            else {
                                y_v = 0
                            }
                            var yMax
                            if(styleData.hasSibling || i !== styleData.depth){
                                yMax = _cv_Line.height
                            }
                            else {
                                yMax = _cv_Line.height/2
                            }
                            drawVerticalLine(ctx, x_v, y_v, yMax)
                        }
                    }
                }
            }

            //draw horizontal dot line
            function drawHorizontalLine(_ctx, _x, _y, _xMax){
                while(_x < _xMax){
                    if(_x % 2 == 0) {
                        _ctx.moveTo(_x, _y)
                        _ctx.lineTo(_x + 1, _y)
                        _ctx.stroke()
                    }
                    _x++
                }
            }

            //draw vertical dot line
            function drawVerticalLine(_ctx, _x, _y, _yMax){
                while(_y < _yMax){
                    if(_y % 2 == 0) {
                        _ctx.moveTo(_x, _y)
                        _ctx.lineTo(_x, _y + 1)
                        _ctx.stroke()
                    }
                    _y++
                }
            }
        }

        Loader{
            id: loader
            anchors.verticalCenter: parent.verticalCenter
            sourceComponent: mComponentItem

            onStatusChanged: {
                if (status == Loader.Ready){
                    if(mCheckBoxes && styleData.column === 0){
                        item.objCheck = true
                    }
                    else {
                        item.objCheck = false
                    }

                    if(styleData.value === undefined){
                        item.objText = ""
                    }
                    else {
                        item.objText = treeView.model.getText(styleData.index)
                    }
                }
            }
        }
    }

    Component{
        id: comItem

        Row {
            id: row
            property bool objCheck: false
            property string objText: ""


            height: parent.height
            layoutDirection: {
                if(mRightToLeftLayout)
                    return Qt.RightToLeft
                return Qt.LeftToRight
            }
            padding: mIndent
            spacing: mIndent

            CheckBox {
                id:  checkItem
                anchors.verticalCenter: row.verticalCenter
                visible: objCheck
             }
            Text {
                id: itemText
                anchors.verticalCenter: row.verticalCenter
                font: mItemFont
                color: mForeColor
                horizontalAlignment: {
                    if(mRightToLeft)
                        return Text.AlignRight
                    return Text.AlignLeft
                }
                text: objText

                onTextChanged: {
                    if (mCausesValidation) { validating() }
                }
            }
        }
    }

    onClicked: {
        mSelectedNode_Text = model.getText(index)
        mSelectedNode_Text = model.getParent(index)
        mSelectedNode_Index = model.getIndex(index)
        mSelectedNode_FullPath = model.getFullPath(index,mPathSeparator.charAt(0))
    }

    onDoubleClicked: {
        if(isExpanded(currentIndex)){
            treeView.collapse(currentIndex)
        } else {
            treeView.expand(currentIndex)
        }
    }

    onHeightChanged: {
        checkMinMaxHeight()
    }

    onWidthChanged: {
        checkMinMaxWidth()
    }

    Rectangle {
        id: _background
        color: "transparent"
        anchors.fill: parent
        border.color: mBorderColor
        border.width: {
            if(mBorderStyle == borderStyle.mFixedSingle) {
                return mBorderWidth
            }
            return 0
        }

        layer.effect: DropShadow {
            verticalOffset: -1
            horizontalOffset: -1
            transparentBorder: true
        }

        Component.onCompleted: {
            _background.layer.enabled = (mBorderStyle == borderStyle.mFixed3D)
        }
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: {
            if(mUseWaitCursor)
                return Qt.WaitCursor
            return mCursor
        }
        acceptedButtons: Qt.NoButton
    }

    QtObject {
        id: borderStyle
        property int mNone: 1
        property int mFixedSingle: 2
        property int mFixed3D: 3
    }

    QtObject {
        id: objPrivate
        property    int         mBranchWidth:           16
    }

    Component.onCompleted: {
        checkMinMaxHeight()
        checkMinMaxWidth()
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

