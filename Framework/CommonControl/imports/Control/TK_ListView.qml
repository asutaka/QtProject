import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1

Rectangle {
    id: main

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
    //  property    alias   mGroups                         Not used        <=> CONTROL LIST: Groups             Replace by: Model
    //  property    alias   mLargeImageList                 Not used        <=> CONTROL LIST: LargeImageList     Replace by: Model
    //  property    alias   mSmallImageList                 Not used        <=> CONTROL LIST: SmallImageList     Replace by: Model
    //  property    alias   mStateImageList                 Not used        <=> CONTROL LIST: StateImageList     Replace by: Model
    //  property    alias   mColumns                        Not used        <=> CONTROL LIST: Columns            Replace by: property Columns of TK_DataGridView
    //  property    alias   mHeaderStyle                    Not used        <=> CONTROL LIST: HeaderStyle        Replace by: TK_DataGridView
    //  property    alias   mAllowColumnReorder             Not used        <=> CONTROL LIST: AllowColumnReorder Replace by: TK_DataGridView
    //  property    alias   mFullRowSelect                  Not used        <=> CONTROL LIST: FullRowSelect      Replace by: property mSelectionMode of TK_DataGridView
    //  property    alias   mGridLines                      Not used        <=> CONTROL LIST: GridLines          Replace by: property mCellBorderStyle of TK_DataGridView

    property    int         mActivation:            objActivation.mOneClick                         //  <=> CONTROL LIST: Activation
    property    int         mAlignment:             objAlignment.mTop                               //  <=> CONTROL LIST: Alignment
    property    bool        mAutoArrange:           false                                           //  <=> CONTROL LIST: AutoArrange
    property	string      mBackgroundImage:       ""                                              //  <=> CONTROL LIST: BackgroundImage
    property	bool        mBackgroundImageTiled:  false                                           //  <=> CONTROL LIST: BackgroundImageTiled
    property    color       mBackColor:             '#f0f0f0'                                       //  <=> CONTROL LIST: BackColor
    property    int         mBorderStyle:           objBorderStyle.mFixed3D                         //  <=> CONTROL LIST: BorderStyle
    property	bool        mCausesValidation:      false                                           //  <=> CONTROL LIST: CausesValidation
    property    bool        mCheckBoxes:            false                                           //  <=> CONTROL LIST: CheckBoxes
    property    int         mCursor:                Qt.ArrowCursor                                  //  <=> CONTROL LIST: Cursor
    property    alias       mEnabled:               main.enabled                                    //  <=> CONTROL LIST: Enabled
    property    font        mFont                                                                   //  <=> CONTROL LIST: Font
    property    color       mForeColor                                                              //  <=> CONTROL LIST: ForeColor
    property    alias       mHeight:                main.height                                     //  <=> CONTROL LIST: Size.height
    property    var         mItems:                 lstModel                                        //  <=> CONTROL LIST: Items
    property    bool        mLabelWrap:             false                                           //  <=> CONTROL LIST: LabelWrap
    property    size        mMaximumSize:           Qt.size(0, 0)                                   //  <=> CONTROL LIST: MaximumSize
    property    size        mMinimumSize:           Qt.size(0, 0)                                   //  <=> CONTROL LIST: MinimumSize
    property    bool        mMultiSelect:           false                                           //  <=> CONTROL LIST: MultiSelect
    property    bool        mOwnerDraw:             false                                           //  <=> CONTROL LIST: OwnerDraw
    property 	bool        mRightToLeft:           false                                           //  <=> CONTROL LIST: RightToLeft
    property  	bool        mRightToLeftLayout:     false                                           //  <=> CONTROL LIST: RightToLeftLayout
    property    int         mScrollBarHPolicy:      Qt.ScrollBarAsNeeded                            //  <=> CONTROL LIST: Scrollable
    property    int         mScrollBarVPolicy:      Qt.ScrollBarAsNeeded                            //  <=> CONTROL LIST: Scrollable
    property    bool        mShowGroups:            false                                           //  <=> CONTROL LIST: ShowGroups
    property    int         mSorting:               objSorting.mNone                                //  <=> CONTROL LIST: Sorting
    property    size        mTileSize:              Qt.size(100,80)                                 //<=> CONTROL LIST: TileSize
    property	bool        mUseWaitCursor:         false                                           //  <=> CONTROL LIST: UseWaitCursor
    property    int         mView:                  objView.mLargeIcon                              //  <=> CONTROL LIST: View
    property    int         mVirtualListSize:       0                                               //  <=> CONTROL LIST: VirtualListSize
    property    bool        mVirtualMode:           false                                           //  <=> CONTROL LIST: VirtualMode
    property    alias       mVisible:               main.visible                                    //  <=> CONTROL LIST: Visible
    property    alias       mWidth:                 main.width                                      //  <=> CONTROL LIST: Size.width
    property    alias       mX:                     main.x                                          //  <=> CONTROL LIST: Location.X
    property    alias       mY:                     main.y                                          //  <=> CONTROL LIST: Location.Y

    //Add new
    property    int         mCellWidthGroup:        main.width - 20                                 //set width every ceil for group
    property    int         mCellHeightGroup:       50                                              //set height every ceil for group
    property    int         mSizeImageLarge:        48                                              //default size of LargeImage
    property    int         mSizeImageSmall:        16                                              //default size of SmallImage
    property    int         mSizeImageState:        20                                              //default size of StateImage
    property    color       mColorGroupDefault:     "transparent"                                   //default color of cell group
    property    color       mColorDefault:          "transparent"                                   //default color of cell
    property    color       mColorActive:           "red"                                           //default color of ceil selected
    property    string      mIconGroup:             ""                                              //url icon set for group
    property    Component   mComponentItem:         subItemColumnDelegate                                         //component set item

    //Private
    property    bool        mIsLargeIcon: {
        if(mView === objView.mLargeIcon)
            return true
        return false
    }//Private: check current mView
    property    int         mColumnsItem: 1 //Private: get/set number column grid of item
    property    bool        mIsAllowTwoClick: false  //Private: check state Activation TwoClick

    signal validating()
    signal information(var index,var value,var groupIndex,var groupName,var selected)

    width: 200
    height: 300
    color: mBackColor
    border.width:{
        switch(mBorderStyle){
        case objBorderStyle.mNone:0;break;
        case objBorderStyle.mFixedSingle:
        case objBorderStyle.mFixed3D:1;break;
        }
    }
    border.color: "#000000"

    onMViewChanged: {
        switch(mView){
        case objView.mTile:
        case objView.mDetail:
        case objView.mList:
            objPrivate.isList = true
            break
        case objView.mLargeIcon:
        case objView.mSmaillIcon:
        default:
            objPrivate.isList = false
            break
        }
    }

    onMItemsChanged: {
        //AutoArrange
        if(mAutoArrange){
            if(mSorting == objSorting.mAscending){
                sortAsending()
            }
            else if(mSorting == objSorting.mDescending){
               sortDescending()
            }
        }
        //mode: virtual mode
        if(mVirtualMode && mVirtualListSize > 0){
            var i
            //Enable group
            if(mShowGroups){
                for(i = 0; i < mVirtualListSize;i++){
                    if(mItems.count <= i) return
                    lstModel.append(mItems.get(i)) //add group title
                    objPrivate.mCurIndexVirtualMode = i
                }
            }
            //Disable group
            else{
                lstModel.append(lstModelVirtualMode.get(0))
                for(i = 0; i < mVirtualListSize;i++){
                    if(mItems.get(0).subItems.count <= i) return
                    lstModel.get(0).subItems.append(mItems.get(0).subItems.get(i))
                    objPrivate.mCurIndexVirtualMode = i
                }
            }
        }
        //mode: not virtual mode
        else{
            for(var i=0; i< mItems.count;i++){
                lstModel.append(mItems.get(i))
            }
            return
        }
    }

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
            anchors.fill:{
                if(mBackgroundImageTiled) return parent
            }
            source: mBackgroundImage
            fillMode: Image.Tile
        }

        TK_ScrollView {
            anchors.fill: parent
            horizontalScrollBarPolicy: mScrollBarHPolicy
            verticalScrollBarPolicy: mScrollBarVPolicy

            ListView {
                id: lstView

                contentWidth: {
                    if((objPrivate.isList || mWidth < mTileSize.width) || (mWidth < mCellWidthGroup)){
                        mColumnsItem = 1
                        if(mTileSize.width > mCellWidthGroup)
                            return mTileSize.width
                        return mCellWidthGroup
                    }
                    mColumnsItem = (mWidth - 20)/mTileSize.width
                    return mWidth - 20
                }
                model: lstModel
                delegate: categoryDelegate
                Item{id: itemNull}
                MouseArea {
                    id: mouseWheel
                    anchors.fill: {
                        if(mVirtualMode)
                            return parent
                        return itemNull
                    }
                    acceptedButtons: Qt.NoButton
                    onWheel: {
                        console.log("ContentY:"+lstView.contentY)
                        if(!mVirtualMode) return

                        ////////////////////////////////////////////////////////////////////////////////////////
                        //TH no group
                        if(wheel.angleDelta.y < 0){
                            lstView.contentY += 50 //step contentY
                            //show last item full height
                            if((objPrivate.mCurIndexVirtualMode === mItems.get(0).subItems.count-1)
                                    ||(mVirtualListSize > objPrivate.mCurIndexVirtualMode + 1)){
                                if(lstView.contentHeight > mHeight){
                                    if((lstView.contentHeight - mHeight)<lstView.contentY){
                                        lstView.contentY = (lstView.contentHeight - mHeight)
                                    }
                                }
                                else {
                                    lstView.contentY = 0
                                }
                                return
                            }

                            var div = mHeight - (lstView.contentHeight - lstView.contentY)
                            if(div > 0){ //model raised
                                    mouseWheel.wheelHideGroup()
                            }
//                            var tmp = wheel.y + lstView.contentY
                            console.log("wheelY:"+wheel.y)
                            console.log("contentY:"+lstView.contentY)
                        }
                        else {
                            console.log("UP:"+lstView.contentY)
                            lstView.contentY -= 50 //step contentY
                            if(lstView.contentY < 0)
                            {
                                lstView.contentY = 0
                            }
                        }
                        ////////////////////////////////////////////////////////////////////////////////////////
                    }

                    function wheelShowGroup(){
                        var tmp = mVirtualListSize
                        for(var i = objPrivate.mCurIndexVirtualMode+1; i < mItems.count; i++){
                            lstModel.append(mItems.get(i))
                            if(--tmp == 0){
                                objPrivate.mCurIndexVirtualMode = i
                                return
                            }
                        }
                        objPrivate.mCurIndexVirtualMode = i
                    }
                    function wheelHideGroup(){
                        var tmp = mVirtualListSize
                        for(var i = objPrivate.mCurIndexVirtualMode+1; i < mItems.get(0).subItems.count; i++){
                            lstModel.get(0).subItems.append(mItems.get(0).subItems.get(i))
                            if(--tmp == 0){
                                objPrivate.mCurIndexVirtualMode = i
                                return
                            }
                        }
                        objPrivate.mCurIndexVirtualMode = i
                    }
                }
            }
        }
    }

    Component {
        id: categoryDelegate
        Column {
            Rectangle {
                id: categoryItem
                border.color: "orange"
                opacity: 0.7
                border.width: 1
                color: mColorGroupDefault //color of group
                clip: true
                height: {
                    if(mShowGroups){
                        return mCellHeightGroup
                    }
                    return 0
                }
                width: mCellWidthGroup
                visible: mShowGroups

                Image {
                    id: imgTriAngle
                    anchors{
                        left: {
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
                        verticalCenter: parent.verticalCenter
                    }
                    rotation: {
                        if(mRightToLeftLayout){
                            if(mRightToLeft) {
                                return 180
                            }
                        }
                        return 0
                    }
                    source: mIconGroup
                    transform: Rotation {
                        origin.x: 5
                        origin.y: 10
                        angle: {
                            if(mRightToLeftLayout) {
                                if(mRightToLeft) {
                                    if(collapsed){
                                        return 0
                                    }
                                    else {
                                        return -20
                                    }
                                }
                            }
                            if(collapsed){
                                return 0
                            }
                            else {
                                return 20
                            }
                        }
                        Behavior on angle { NumberAnimation { duration: 150 } }
                    }
                }
                Text {
                    anchors{
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
                        verticalCenter: parent.verticalCenter
                    }

                    text: categoryName
                    font: mFont
                    color: mForeColor
                }
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("lstView.ContentHeight:"+lstView.contentHeight)
                        lstModel.setProperty(index, "collapsed", !collapsed)
                    }
                }
            }
            //children
            Loader {
                id: subItemLoader
                visible: !collapsed
                property variant subItemModel : subItems
                sourceComponent: {
                    if(collapsed) return null
                    return objPrivate.mComponentUsed
                }
                onStatusChanged: {
                    if (status == Loader.Ready){
                        item.model = subItemModel
                        item.groupIndex = index
                        item.groupName = categoryName
                    }
                }
            }
        }

    }

    Component {
        id: subItemColumnDelegate
        Grid {
            id: grid

            property var model
            property int groupIndex: -1
            property string groupName: ''

            columns: mColumnsItem
            layoutDirection: {
                if(mRightToLeftLayout){
                    if(mRightToLeft) {
                        return Qt.RightToLeft
                    }
                }
                else {
                    return Qt.LeftToRight
                }
            }
            flow: {
                if(mAlignment == objAlignment.mTop)
                    return Grid.LeftToRight
                else
                    return Grid.TopToBottom
            }
            Repeater {
                model: grid.model
                delegate: Rectangle {
                    color: {
                        if(selected){
                            return mColorActive
                        }
                        return mColorDefault //color of item
                    }
                    height: mTileSize.height
                    width: mTileSize.width
                    border.color: "green"
                    border.width: 1
                    clip: true

                    Rectangle {
                        id: rectLargeImage
                        anchors.top: parent.top
                        width: parent.width
                        height: {
                            if(mIsLargeIcon)
                                return 48
                            return 0
                        }
                        visible: {
                            if(mIsLargeIcon)
                                return true
                            return false
                        }
                        color: "transparent"
                        CheckBox {
                            id: chkBoxVwLargeIcon
                            z: 1
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
                                verticalCenter: parent.verticalCenter
                                margins: 20
                            }
                            checked: _checked
                            visible: mCheckBoxes
                        }
                        Image{
                            z: 1
                            anchors{
                                left:{
                                    if(mRightToLeftLayout){
                                        if(!mRightToLeft) {
                                            chkBoxVwLargeIcon.right
                                        }
                                    }
                                    else {
                                        chkBoxVwLargeIcon.right
                                    }
                                }
                                right: {
                                    if(mRightToLeftLayout){
                                        if(mRightToLeft) {
                                            chkBoxVwLargeIcon.left
                                        }
                                    }
                                }
                                verticalCenter: parent.verticalCenter
                            }
                            sourceSize.width: mSizeImageState
                            sourceSize.height: mSizeImageState
                            source: {
                                if(_checked){
                                    return stateIconChecked
                                }
                                return stateIconUnChecked
                            }
                            visible: mCheckBoxes
                        }

                        Image {
                            anchors.centerIn: parent

                            sourceSize.width: mSizeImageLarge
                            sourceSize.height: mSizeImageLarge
                            source: largeIcon
                        }
                    }

                    Rectangle {
                        anchors.top:  rectLargeImage.bottom
                        width: parent.width
                        height: parent.height - rectLargeImage.height
                        color: "transparent"

                        CheckBox {
                            id: chkBoxVwList
                            anchors {
//                                top: parent.top
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
                                verticalCenter: parent.verticalCenter
                                margins: 20
                            }
                            width: {
                                if(!mCheckBoxes) return 0
                            }
                            checked: _checked
                            visible: mCheckBoxes && !mIsLargeIcon
                        }
                        Image {
                            id: imgState
                            anchors{
                                left:{
                                    if(mRightToLeftLayout){
                                        if(!mRightToLeft) {
                                            chkBoxVwList.right
                                        }
                                    }
                                    else {
                                        chkBoxVwList.right
                                    }
                                }
                                right: {
                                    if(mRightToLeftLayout){
                                        if(mRightToLeft) {
                                            chkBoxVwList.left
                                        }
                                    }
                                }
                                verticalCenter: parent.verticalCenter
                            }
                            sourceSize.width: mSizeImageState
                            sourceSize.height: mSizeImageState
                            source: {
                                if(_checked){
                                    return stateIconChecked
                                }
                                return stateIconUnChecked
                            }
                            visible: mCheckBoxes && !mIsLargeIcon
                        }

                        Image {
                            id: imgSmallIcon

                            anchors {
                                left:{
                                    if(mRightToLeftLayout){
                                        if(!mRightToLeft) {
                                            imgState.right
                                        }
                                    }
                                    else {
                                        imgState.right
                                    }
                                }
                                right: {
                                    if(mRightToLeftLayout){
                                        if(mRightToLeft) {
                                            imgState.left
                                        }
                                    }
                                }
                                margins: 5
                                verticalCenter: parent.verticalCenter
                            }
                            width: {
                                if(mIsLargeIcon) {
                                    return 0
                                }
                            }
                            sourceSize.width:{
                                if(mView == objView.mTile){
                                    return mSizeImageLarge
                                }
                                return mSizeImageSmall
                            }
                            sourceSize.height:{
                                if(mView == objView.mTile){
                                    return mSizeImageLarge
                                }
                                return mSizeImageSmall
                            }
                            source: {
                                if(mView == objView.mTile){
                                    return largeIcon
                                }
                                return smallIcon
                            }
                            visible: {
                                if(mIsLargeIcon)
                                    return false
                                return true
                            }
                        }

                        Text {
                            id: txtText

                            anchors {
                                centerIn: {
                                    if(mIsLargeIcon) {
                                        parent
                                    }
                                }
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
                                verticalCenter: parent.verticalCenter
                            }
                            font: mFont
                            color: mForeColor
                            text: itemName
                            width: {
                                if(mLabelWrap && (mView == objView.mLargeIcon ||
                                                  mView == objView.mSmaillIcon))
                                    return parent.width
                            }
                            wrapMode: Text.WordWrap
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        onPressed: {
                            if(mActivation == objActivation.mTwoClick){
                                if(!mIsAllowTwoClick){
                                    mIsAllowTwoClick = true
                                    return
                                }
                                mIsAllowTwoClick = false
                            }

                            if(!mMultiSelect){
                                singleSelected()
                            }
                            grid.model.setProperty(index, "selected", !selected)
                            grid.model.setProperty(index, "_checked", !_checked)
                            //signal get property
                            information(index,itemName,grid.groupIndex,grid.groupName,selected)
                        }
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
        //CausesValidation
        if(mCausesValidation){
            validating()
        }
        //sorted
        if(mSorting == objSorting.mAscending){
            sortAsending()
        }
        else if(mSorting == objSorting.mDescending){
           sortDescending()
        }
        //maximumsize
        if(mMaximumSize.width !== 0){
            if(mWidth > mMaximumSize.width)
                mWidth = mMaximumSize.width
        }
        if(mMaximumSize.height !== 0){
            if(mHeight > mMaximumSize.height)
                mHeight = mMaximumSize.height
        }
        //minimumsize
        if(mMinimumSize.width !== 0){
            if(mWidth < mMinimumSize.width)
                mWidth = mMinimumSize.width
        }
        if(mMinimumSize.height !== 0){
            if(mHeight < mMinimumSize.height)
                mHeight = mMinimumSize.height
        }
        //mOwnerDraw
        if(mOwnerDraw){
            objPrivate.mComponentUsed = mComponentItem
        }
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

    QtObject {
        id: objAlignment
        property int mTop: 0
        property int mLeft: 1
    }

    QtObject {
        id: objActivation
        property int mOneClick: 0
        property int mTwoClick: 1
    }

    QtObject{
        id: objPrivate
        property bool isList: false   //check layout of children items
        property int mCurIndexVirtualMode: -1
        property Component mComponentUsed: subItemColumnDelegate
    }

    ListModel{
        id: lstModel
    }

    ListModel{
        id: lstModelVirtualMode
        ListElement {
            categoryName: "group"
            collapsed: false
            subItems: []
        }
    }

    function sortAsending(){
        try{
            var n;
            var i;
            for (n=0; n < lstModel.count; n++){
                //sort group name
                for (i=n+1; i < lstModel.count; i++){
                    if (lstModel.get(n).categoryName > lstModel.get(i).categoryName){
                        lstModel.move(i, n, 1);
                        n=0;
                    }
                }
            }
            //sort item
            for (n=0; n < lstModel.count; n++){
                var k = lstModel.get(n).subItems.count
                for(var x = 0 ; x < k; x++)
                    for (var y = x+1; y < k; y++){
                        if (lstModel.get(n).subItems.get(x).itemName > lstModel.get(n).subItems.get(y).itemName) {
                            lstModel.get(n).subItems.move(y, x, 1);
                            x=0;
                        }
                    }
            }
        }
        catch(err){
            console.log("error sortAsending")
        }
    }

    function sortDescending(){
        try{
            var n;
            var i;
            for (n=0; n < lstModel.count; n++){
                //sort group name
                for (i=n+1; i < lstModel.count; i++){
                    if (lstModel.get(n).categoryName < lstModel.get(i).categoryName){
                        lstModel.move(i, n, 1);
                        n=0;
                    }
                }
            }
            //sort item
            for (n=0; n < lstModel.count; n++){
                var k = lstModel.get(n).subItems.count
                for(var x = 0 ; x < k; x++)
                    for (var y = x+1; y < k; y++){
                        if (lstModel.get(n).subItems.get(x).itemName < lstModel.get(n).subItems.get(y).itemName) {
                            lstModel.get(n).subItems.move(y, x, 1);
                            x=0;
                        }
                    }
            }
        }
        catch(err){
            console.log("error sortDescending")
        }
    }

    function singleSelected(){
        try{
            var n;
            //sort item
            for (n=0; n < lstModel.count; n++){
                var k = lstModel.get(n).subItems.count
                for(var x = 0 ; x < k; x++){
                    lstModel.get(n).subItems.setProperty(x, "selected", false)
                }
            }
        }
        catch(err){
            console.log("error singleSelected")
        }
    }
}







