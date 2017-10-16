import QtQuick 2.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 1.4
//import QtQml.Models 2.2

Rectangle {
    id: rectMain
    width: parent.width
    height: parent.height
    color: "gray"
    clip: true
    border.width:{
        switch(mBorderStyle){
            case objBorderStyle.mNone:0;break;
            case objBorderStyle.mFixedSingle:
            case objBorderStyle.mFixed3D:1;break;
        }
    }
    border.color: "#000000"

    //	property	alias	id:                             Not customize	<=>	CONTROL LIST:	Name
    //	property	alias	anchors.top:                    Not customize	<=>	CONTROL LIST:	Anchors(Top)
    //	property	alias	anchors.bottom:                 Not customize	<=>	CONTROL LIST:	Anchors(Bottom)
    //	property	alias	anchors.right:                  Not customize	<=>	CONTROL LIST:	Anchors(Right)
    //	property	alias	anchors.left:                   Not customize	<=>	CONTROL LIST:	Anchors(Left)
    //	property	alias	anchors.margins:                Not customize	<=>	CONTROL LIST:	Margin(All)
    //	property	alias	anchors.leftMargin:             Not customize	<=>	CONTROL LIST:	Margin(Left)
    //	property	alias	anchors.rightMargin:            Not customize	<=>	CONTROL LIST:	Margin(Right)
    //	property	alias	anchors.topMargin:              Not customize	<=>	CONTROL LIST:	Margin(Top)
    //	property	alias	anchors.bottomMargin:           Not customize	<=>	CONTROL LIST:	Margin(Bottom)

    //  property	bool 	mGeneratemember                 Not used        <=> CONTROL LIST: Generatemember
    //  property	bool	mLocked                         Not used        <=> CONTROL LIST: Locked
    //  property	var 	mModifiers                      Not used        <=> CONTROL LIST: Modifiers
    //  property	bool	mAllowDrop                      Not used        <=> CONTROL LIST: AllowDrop
    //  property	var 	mImeMode                        Not used        <=> CONTROL LIST: ImeMode
    //  property	int 	mDock                           Not used        <=> CONTROL LIST: Dock


    property    alias       mX:                     rectMain.x                                       // <=>  CONTROL LIST: Location.X
    property    alias       mY:                     rectMain.y                                       // <=>  CONTROL LIST: Location.Y
    property    alias       mWidth:                 rectMain.width                                   // <=>  CONTROL LIST: Size.width
    property    alias       mHeight:                rectMain.height                                  // <=>  CONTROL LIST: Size.height
    property    alias       mEnabled:               rectMain.enabled                                 // <=>  CONTROL LIST: Enabled
    property    alias       mVisible:               rectMain.visible                                 // <=>  CONTROL LIST: Visible
    property    alias       mItems:                 rpt.model                                       //  <=> CONTROL LIST: Items
    property    int         mCursor:                Qt.ArrowCursor                                  // <=> CONTROL LIST: Cursor
    property	bool        mUseWaitCursor:         false                                           // <=> CONTROL LIST: UseWaitCursor
    property	bool        mCausesValidation:      false                                           // <=> CONTROL LIST: CausesValidation
    property    size        mMaximumSize:           Qt.size(0, 0)                                   //  <=> CONTROL LIST: MaximumSize
    property    size        mMinimumSize:           Qt.size(0, 0)                                   //  <=> CONTROL LIST: MinimumSize
    property    alias       mBackColor:             rectMain.color                                  // <=> CONTROL LIST: BackColor
    property    font        mFont                                                                   // <=> CONTROL LIST: Font
    property    color       mForeColor                                                              // <=> CONTROL LIST: ForeColor
    property    bool        mCheckBoxes:            false                                           //  <=> CONTROL LIST: CheckBoxes
    property	string      mBackgroundImage:       ""                                              //  <=> CONTROL LIST: BackgroundImage
    property	bool        mBackgroundImageTiled:  false                                           //  <=> CONTROL LIST: BackgroundImageTiled
    property    int         mBorderStyle:           objBorderStyle.mFixed3D                            // <=> CONTROL LIST: BorderStyle












    property    bool        mMultiSelect:           false                                            //  <=> CONTROL LIST: MultiSelect
    property 	bool        mRightToLeft:           false                                           // <=> CONTROL LIST: RightToLeft
    property  	bool        mRightToLeftLayout:     false                                           // <=> CONTROL LIST: RightToLeftLayout
    property    int         mSorting:               objSorting.mNone                               //  <=> CONTROL LIST: Sorting
    property    int         mView:                  objView.mLargeIcon                             //  <=> CONTROL LIST: View

    onMViewChanged: {
        switch(mView){
        case objView.mList:
            objPrivate.numberMode = 1
            break
        default:
            objPrivate.numberMode = 4
            break
        }
    }


     signal validating()









//    property    alias       mHorizontalScrollBar:   tblView.horizontalScrollBarPolicy               //  <=>	CONTROL LIST:	ScrollBars
//    property    alias       mVerticalScrollBar:     tblView.verticalScrollBarPolicy                 //  <=>	CONTROL LIST:	ScrollBars

    //       //    property  var     mSmallImageList         Not used        <=> CONTROL LIST: SmallImageList
    //       //    property  var     mColumns                Using TK_DataGridView
    //       //    property  var     mHeaderStyle            Using TK_DataGridView
    //       //    property  bool    mGridLines:             Using TK_DataGridView
    //       //    properrt  bool    mScrollable             Using Flickable
    //       //    property  bool    mAllowColumnReorder     Cause           <=> When type view = detail --> AllowColumnReorder: use TK_DataGridView to alternative
    //       //    property  alias	mFullRowSelect          Cause           <=> When type view = detail --> AllowColumnReorder: use TK_DataGridView to alternative
    //       //    property  bool    mAutoArrange            Cause           <=> AutoArrange: this View inherits GridView --> alway autoArrange
    //       //    property  bool    mOwnerDraw              Cause           <=> Select mode draw ListView is operating system or user's code.
    //       //    property  var     mVirtualListSize        Cause           <=> This property defined when VirtualMode = true
    //       //    property  var     mVirtualMode            Cause           <=> Select mode to add data to ListView, when virtualMode = true, data will not add directly to ListView. Data will be created dynamic and display if need--> not find out solution to implement


    //       property    int             mActivation:                activation.mStandard        //  <=> CONTROL LIST: Activation
    //       property    int             mLayoutDirection:           Qt.LeftToRight              //  <=> CONTROL LIST: Alignment
    //       property    int             mOrientation:               Qt.Vertical                 //  <=> CONTROL LIST: Alignment
    //       property    int             mGridVerticalDirection:     GridView.TopToBottom        //  <=> CONTROL LIST: Alignment
    //       property    int             mListVerticalDirection:     ListView.TopToBottom        //  <=> CONTROL LIST: Alignment

    //       property    int             mLabelWrap:                 Text.WordWrap               //  <=> CONTROL LIST: LabelWrap





    //       property    bool            mScrollable:                true                        //  <=> CONTROL LIST: Scrollable
    //       property    bool            mShowGroups                                             //  <=> CONTROL LIST: ShowGroups





    property bool isLargeIcon: mView === objView.mLargeIcon?true:false //mView đang ở largeIcon hay mode khác
    property Item mGridSelect //luu gia tri cua Grid duoc chon
    property Item mCellSelect //luu gia tri cua Cell duoc chon
    property int mIndex: -1 // luu gia tri cua index duoc chon
    property int mCellWidth: 80 //set chieu cao cua tung cell
    property int mCellHeight: isLargeIcon?80:30 //set chieu cao cua tung cell
    property int mSizeImageLarge: 48 //kích thước mặc định của LargeImage
    property int mSizeImageSmall: 16 //kích thước mặc định của SmallImage

    property color colorDefault: "transparent"   //set mau mac dinh cho cell
    property color colorActive: "red"           //set mau cho cell dang duoc select
    Rectangle{
        anchors.fill: parent
        anchors.margins:{
            switch(mBorderStyle){
            case 0:0; break;
            case 1:
            case 2:1;break;
            }
        }
        border.color:{
            switch(mBorderStyle){
            case 0:
            case 1:"transparent";break;
            case 2:"#fff";break;
            }
        }

        color:"transparent"

    Image {
        source: mBackgroundImage
        fillMode: mBackgroundImageTiled ? Image.Tile : Image.Stretch

        Component.onCompleted: {
            if (mBackgroundImageTiled)
                anchors.fill = parent
        }
    }


    Column  {
        id: colMain





        //       signal validating()
        //       property size mTileSize: Qt.size(300, 80)
        //       property size mImageSize: Qt.size(50, 50)
        //       property int mListTypeMargin: 10

        //       // Width, Height
        //       property size mLargeIconSize: Qt.size(60, 70)
        //       property size mSmallIconSize: Qt.size(100, 20)

        //       property size mSmallImageSize: Qt.size(30, 20)
        //       property size mLargeImageSize: Qt.size(50, 50)

        //       property int mCurrentIndex: __listView.visible ? __listView.currentIndex : __gridView.currentIndex

        //       property color mHighlightColor: "lightblue"
        //       property real mHighlightOpacity: 0.4

        //       signal itemActivate()




















            width: parent.width
            height: parent.height
            x: -hbar.position * rectMain.width
            y: -vbar.position * rpt.totalHeight








            Repeater {
                id: rpt

                property int totalHeight: 0
                property int countGroup: 0

                delegate: Component {
                    id: accordion
                    Column {
                        id: col
                        width: parent.width

                        Rectangle {
                           id: rectItem

                           width: parent.width
                           height: childrenRect.height
                           color: "transparent"
                           property bool expanded: true

                           MouseArea {
                               anchors.fill: parent
                               onPressed: {
                                   if(modelData.children) {
                                       rectItem.expanded = !rectItem.expanded
                                        console.log("clickParent: "+ modelData.row+","+ index)
                                   }
                               }
                           }

                           Image {
                               id: imgTriAngle

                               anchors {
                                   top: parent.top
                                   left:{
                                       if(mRightToLeftLayout){
                                           if(!mRightToLeft) {
                                               parent.left
                                           }
                                       }
                                       else {
                                           parent.left
                                       }
                                   }
                                   right: {
                                       if(mRightToLeftLayout){
                                           if(mRightToLeft) {
                                               parent.right
                                           }
                                       }
                                   }
                                   margins: 5
                                   rightMargin: {
                                       if(mRightToLeftLayout){
                                           if(mRightToLeft) {
                                               -20
                                           }
                                       }
                                   }

                                   topMargin: {
                                       if(mRightToLeftLayout){
                                           if(mRightToLeft) {
                                               10
                                               return
                                           }
                                       }
                                       0
                                   }
                               }

                               sourceSize.width: 16
                               sourceSize.height: 16
                               source: "image://MyProvider/triangle_32x32.png"
                               transform: Rotation {
                                   origin.x: 5
                                   origin.y: 10
                                   angle: {
                                       if(mRightToLeftLayout) {
                                            if(mRightToLeft) {
                                                rectItem.expanded? 135: 180
                                                return
                                            }
                                       }
                                       rectItem.expanded ? 45 : 0
                                   }
                                   Behavior on angle { NumberAnimation { duration: 150 } }
                               }
                           }

                           Text {
                               id: txtItem
                               anchors {
                                   top: parent.top
                                   left: {
                                       if(mRightToLeftLayout){
                                           if(!mRightToLeft) {
                                               imgTriAngle.right
                                           }
                                       }
                                       else {
                                           imgTriAngle.right
                                       }
                                   }
                                   right: {
                                       if(mRightToLeftLayout){
                                           if(mRightToLeft) {
                                               imgTriAngle.left
                                           }
                                       }
                                   }
                                   margins: 5
                                   rightMargin: {
                                       if(mRightToLeftLayout){
                                           if(mRightToLeft) {
                                               20
                                           }
                                       }
                                   }
                               }

                               font: mFont
                               color: mForeColor
                               text: modelData.groupName
                           }

                           Component.onCompleted: {
                               rpt.countGroup++
                               if(rpt.countGroup%2 === 0) { rpt.totalHeight += rectItem.height }
                           }
                       }

                        GridView {
                            id: grid

//                            property bool isSelectRow: false
//                            property bool numView: mView
                            property int countItem: 0  //count total item every Group

                            x: 20
                            width: parent.width - x
                            height: childrenRect.height * opacity
                            visible: opacity > 0
                            opacity: rectItem.expanded ? 1 : 0
                            cellWidth: parent.width/objPrivate.numberMode  //set width cell
                            cellHeight: mCellHeight

                            delegate: Rectangle {
                                id: rectDetail

                                property bool isSelected: false

                                width: isLargeIcon?mCellWidth:
                                            (txtText.width + txtText.anchors.margins + chkBox2.width + chkBox2.anchors.margins + imgSmallIcon.width + imgSmallIcon.anchors.margins)
                                height: mCellHeight
                                color: "transparent"

                                MouseArea {
                                    anchors.fill: parent
                                    propagateComposedEvents: true
                                    hoverEnabled: true
                                    onPressed: {
                                        console.log("gridHeight:"+grid.height)
                                        if(mMultiSelect){
                                            rectDetail.isSelected = !rectDetail.isSelected
                                            if(rectDetail.isSelected){
                                                rectDetail.color = colorActive
                                            }
                                            else {
                                                rectDetail.color = colorDefault
                                            }
                                        }
                                        else {
                                            if(mCellSelect !== null) {
                                                mCellSelect.color = colorDefault
                                            }
                                            rectDetail.color = colorActive
                                            mCellSelect = rectDetail
                                        }
                                    }
                                }

                                Rectangle {
                                    id: rectLargeImage
                                    anchors.top: parent.top
                                    width: parent.width
                                    height: isLargeIcon?48:0
                                    visible: isLargeIcon?true:false
                                    color: "transparent"
                                    CheckBox {
                                        anchors {
                                            left:{
                                                if(mRightToLeftLayout){
                                                    if(!mRightToLeft) {
                                                        parent.left
                                                    }
                                                }
                                                else {
                                                    parent.left
                                                }
                                            }
                                            right: {
                                                if(mRightToLeftLayout){
                                                    if(mRightToLeft) {
                                                        parent.right
                                                    }
                                                }
                                            }
                                            bottom: parent.bottom
                                            margins: 5
                                        }
                                        visible: mCheckBoxes
                                    }

                                    Image {
                                        anchors.centerIn: parent

                                        sourceSize.width: mSizeImageLarge
                                        sourceSize.height: mSizeImageLarge
                                        source: modelData.largeIcon
                                    }
                                }
                                Rectangle {
                                    anchors.top:  rectLargeImage.bottom
                                    width: parent.width
                                    height: parent.height - rectLargeImage.height
                                    color: "transparent"

                                    CheckBox {
                                        id: chkBox2
                                        anchors {
                                            top: parent.top
                                            left:{
                                                if(mRightToLeftLayout){
                                                    if(!mRightToLeft) {
                                                        parent.left
                                                    }
                                                }
                                                else {
                                                    parent.left
                                                }
                                            }
                                            right: {
                                                if(mRightToLeftLayout){
                                                    if(mRightToLeft) {
                                                        parent.right
                                                    }
                                                }
                                            }
                                            margins: 5
                                        }
                                        width: {
                                            if(!mCheckBoxes) return 0
                                        }

                                        visible: mCheckBoxes && !isLargeIcon
                                    }
                                    Image {
                                        id: imgSmallIcon

                                        anchors {
                                            top: parent.top
                                            left:{
                                                if(mRightToLeftLayout){
                                                    if(!mRightToLeft) {
                                                        chkBox2.right
                                                    }
                                                }
                                                else {
                                                    chkBox2.right
                                                }
                                            }
                                            right: {
                                                if(mRightToLeftLayout){
                                                    if(mRightToLeft) {
                                                        chkBox2.left
                                                    }
                                                }
                                            }
                                            margins: 5
                                            leftMargin: 0
                                        }
                                        width: {
                                            if(isLargeIcon) {
                                                return 0
                                            }
                                        }
                                        sourceSize.width: mSizeImageSmall
                                        sourceSize.height: mSizeImageSmall
                                        source: modelData.smallIcon
                                        visible: isLargeIcon?false:true
                                    }

                                    Text {
                                        id: txtText
                                        anchors {
                                            centerIn: {
                                                if(isLargeIcon) {
                                                    parent
                                                }
                                            }
                                            top: parent.top
                                            left: {
                                                if(mRightToLeftLayout){
                                                    if(!mRightToLeft) {
                                                        imgSmallIcon.right
                                                    }
                                                }
                                                else {
                                                    imgSmallIcon.right
                                                }
                                            }
                                            right: {
                                                if(mRightToLeftLayout){
                                                    if(mRightToLeft) {
                                                        imgSmallIcon.left
                                                    }
                                                }
                                            }
                                            margins: 5
                                        }
                                        font: mFont
                                        color: mForeColor
                                        text: modelData.name
                                    }
                                }

                                Component.onCompleted: {
                                    grid.countItem++
                                    if(grid.countItem === 1){
                                        rpt.totalHeight += rectDetail.height/2
                                    }
                                    else if(grid.countItem%objPrivate.numberMode === 0){
                                        rpt.totalHeight += rectDetail.height/2
                                    }
                                }
                            }
                            model: modelData.children ? modelData.children : []
                            interactive: false
                            Behavior on opacity { NumberAnimation { duration: 200 } }
                        }
                    }
                }
            }
        }

    }

    ScrollBar {
        id: vbar

        property bool isActive: hovered || pressed
        onIsActiveChanged: {
            console.log("rectMain.height: "+rectMain.height)
            console.log("rpt.height:"+rpt.totalHeight)
            console.log("position:"+vbar.position)
            console.log("size:"+vbar.size)
        }

        width: 17
        hoverEnabled: true
        active: isActive
        orientation: Qt.Vertical
        size: rectMain.height / rpt.totalHeight
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        visible: true

        Component.onCompleted: {
            vbar.children[0].color = "orange"
        }
    }


    ScrollBar {
        id: hbar
        hoverEnabled: true
        active: hovered || pressed
        orientation: Qt.Horizontal
        size:0.5 //rectMain.width / content.width
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        visible: false
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }

    QtObject {
        id: objPrivate

        property int numberMode: 4 //mode view : List [numberMode = 1]; Grid [numberMode = 4]
    }

    QtObject {
        id: objSorting
        property int mNone: 0
        property int mAscending: 1
        property int mDescending: 2
    }
    QtObject {
        id: objView
        property int mLargeIcon: 0
        property int mDetail: 1
        property int mSmaillIcon: 2
        property int mList: 3
        property int mTile: 4
    }
    QtObject {
        id: objBorderStyle
        property int mNone: 0
        property int mFixedSingle: 1
        property int mFixed3D: 2
    }
    ListElement {
        id: lstElement
    }

    Component.onCompleted: {
        console.log(rpt.model[0].label)
//            rpt.model = rpt.model.sort(function(a,b){ return a.label - b.label })
        rpt.model = rpt.model.sort()
        for(var i = 0 ;i < rpt.model.length ; i++)
        {
            console.log(rpt.model[i].label)
        }

        //CausesValidation
        if(mCausesValidation){
            validating()
        }
        //maximumsize
        if(mMaximumSize.width !== 0)
        {
            if(mWidth > mMaximumSize.width)
                mWidth = mMaximumSize.width;
        }
        if(mMaximumSize.height !== 0)
        {
            if(mHeight > mMaximumSize.height)
                mHeight = mMaximumSize.height
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
                mHeight = mMinimumSize.height
        }
        //sorting
        switch (mSorting) {
        case objSorting.mAscending :
            _sortingAscending()
            break
        case objSorting.mDescending:
            _sortingDescending()
            break
        default: break
        }
    }

    function _sortingAscending() {
//            for (var n=0; n < rpt.model.length; n++)
//                for (var i=n+1; i < rpt.model.length; i++)
//                {
//                    if (rpt.model[n].label > rpt.model[i].label)
//                    {
//                        var tmp = rpt.model[i].label
//                        rpt.model[i].label = rpt.model[n].label
//                        rpt.model[n].label = tmp
////                        rpt.model.move(i, n, 1)
////                        n=0;
//                    }
//                }


    }

    function _sortingDescending() {
        console.log("descending")
        for (var n=0; n < rpt.model.length; n++)
            for (var i=n+1; i < rpt.model.length; i++)
            {
                if (rpt.model.get(n).label> rpt.model.get(i).label)
                {
                    rpt.model.move(i, n, 1)
                    n=0;
                }
            }
    }
}




