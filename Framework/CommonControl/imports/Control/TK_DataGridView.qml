import QtQuick 2.5
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0

TableView {
    id: tblView

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

    //	property	alias	mColumns                        Not used	<=>	CONTROL LIST:	Columns
    //	property	alias	mDataMember                     Not used	<=>	CONTROL LIST:	DataMember
    //	property	bool	mGeneratemember                 Not used	<=>	CONTROL LIST:	Generatemember
    //	property	bool	mLocked                         Not used	<=>	CONTROL LIST:	Locked
    //	property	var     mModifiers                      Not used	<=>	CONTROL LIST:	Modifiers
    //	property	bool	mAllowDrop                      Not used	<=>	CONTROL LIST:	AllowDrop
    //	property	int     mDock                           Not used	<=>	CONTROL LIST:	Dock
    //	property	alias	mRowHeadersBorderStyle          Not used	<=>	CONTROL LIST:	RowHeadersBorderStyle
    //	property	alias	mRowHeadersDefaultCellStyle     Not used	<=>	CONTROL LIST:	RowHeadersDefaultCellStyle
    //	property	alias	mRowHeadersVisible              Not used	<=>	CONTROL LIST:	RowHeadersVisible
    //	property	alias	mRowsDefaultCellStyle           Not used	<=>	CONTROL LIST:	RowsDefaultCellStyle
    //	property	alias	mRowTemplate                    Not used	<=>	CONTROL LIST:	RowTemplate
    //	property	alias	mAllowUserToAddRows             Not used	<=>	CONTROL LIST:	AllowUserToAddRows
    //	property	alias	mAllowUserToDeleteRows          Not used	<=>	CONTROL LIST:	AllowUserToDeleteRows
    //	property	alias	mAllowUserToOrderColumns        Not used	<=>	CONTROL LIST:	AllowUserToOrderColumns
    //	property	alias	mAllowUserToResizeColumns       Not used	<=>	CONTROL LIST:	AllowUserToResizeColumns
    //	property	alias	mAllowUserToResizeRows          Not used	<=>	CONTROL LIST:	AllowUserToResizeRows
    //	property	alias	mColumnHeadersHeightSizeMode	Not used	<=>	CONTROL LIST:	ColumnHeadersHeightSizeMode
    //	property	alias	mImeMode                        Not used	<=>	CONTROL LIST:	ImeMode
    //	property	alias	mRowHeadersWidthSizeMode        Not used	<=>	CONTROL LIST:	RowHeadersWidthSizeMode
    //	property	alias	mRowHeadersWidth                Not used	<=>	CONTROL LIST:	RowHeadersWidth
    //	property	alias	mAlternatingRowsDefaultCellStyle	Not used	<=>	CONTROL LIST:	AlternatingRowsDefaultCellStyle
    //	property	alias	mDefaultCellStyle               Not used	<=>	CONTROL LIST:	DefaultCellStyle
    //	property	alias	mEnableHeadersVisualStyles      Not used	<=>	CONTROL LIST:	EnableHeadersVisualStyles
    //	property	alias	mAutoSizeColumnsMode            Not used	<=>	CONTROL LIST:	AutoSizeColumnsMode
    //	property	alias	mAutoSizeRowsMode               Not used	<=>	CONTROL LIST:	AutoSizeRowsMode

    property	bool        mCausesValidation:      true                                            // <=>  CONTROL LIST: CausesValidation
    property	int     	mCellBorderStyle:       objCellBorderStyle.pSingle                      // <=>	CONTROL LIST:	CellBorderStyle
    property    int         mClipboardCopyMode:     objClipboardCopyMode.pEnableWithAutoHeaderText  // <=>	CONTROL LIST:	ClipboardCopyMode
    property    int         mCursor:                Qt.ArrowCursor                                  // <=>  CONTROL LIST: Cursor
    property    var         mDataSource                                                             // <=>  CONTROL LIST: DataSource
    property    alias       mEnabled:               tblView.enabled                                 // <=>  CONTROL LIST: Enabled
    property    bool        mEnableHeadersVisualStyles: true                                        // <=>  CONTROL LIST: EnableHeadersVisualStyles
    property    alias       mHeight:                tblView.height                                  // <=>  CONTROL LIST: Size.height
    property    bool        mMultiSelect:           false                                           // <=>	CONTROL LIST:	MultiSelect
    property	bool    	mReadOnly:              false                                           // <=>	CONTROL LIST:	ReadOnly
    property	bool    	mRightToLeft:           false                                           // <=>	CONTROL LIST:	RightToLeft
    property    int         mSelectionMode:         objSelectionMode.pCellSelect                    // <=>	CONTROL LIST:	SelectionMode
    property	bool        mShowCellErrors:        true                                            // <=>	CONTROL LIST:	ShowCellErrors
    property	bool    	mShowCellToolTips:      false                                           // <=>	CONTROL LIST:	ShowCellToolTips
    property	bool        mShowEditingIcon:       true                                            // <=>	CONTROL LIST:	ShowEditingIcon
    property    bool        mShowRowErrors:         true                                            // <=>	CONTROL LIST:	ShowRowErrors
    property    bool        mUseWaitCursor:         false                                           // <=>  CONTROL LIST: UseWaitCursor
    property    bool        mVirtualMode:           false                                           // <=>  CONTROL LIST: VirtualMode
    property    alias       mVisible:               tblView.visible                                 // <=>  CONTROL LIST: Visible
    property    alias       mWidth:                 tblView.width                                   // <=>  CONTROL LIST: Size.width
    property    alias       mX:                     tblView.x                                       // <=>  CONTROL LIST: Location.X
    property    alias       mY:                     tblView.y                                       // <=>  CONTROL LIST: Location.Y
    /* Grid View */
    property    color       mBackgroundColor:       "transparent"                                   // <=>	CONTROL LIST:	BackgroundColor
    property    color       mBorderColor                                                            // <=>	CONTROL LIST:	BackgroundColor
    property    int         mBorderStyle:           objBorderStyle.pFixed3D                         // <=> CONTROL LIST: BorderStyle
    property    color       mGridColor:             "black"                                         // <=>	CONTROL LIST:	GridColor
    property	int         mGridWidth                                                              // <=>	CONTROL LIST:	GridWidth
    property	size        mMaximumSize:           Qt.size(0, 0)                                   // <=>	CONTROL LIST:	MaximumSize
    property	size        mMinimumSize:           Qt.size(0, 0)                                   // <=>	CONTROL LIST:	MinimumSize
    //Header Style
    property	int         mColumnHeadersHeight:   40                                              // <=>	CONTROL LIST:	ColumnHeadersHeight
    property	bool        mColumnHeadersVisible:  true                                            // <=>	CONTROL LIST:	ColumnHeadersVisible
    property    int         mHeaderAlignmentH                                                       // <=>  CONTROL LIST:   ColumnHeadersDefaultCellStyle
    property    int         mHeaderAlignmentV                                                       // <=>  CONTROL LIST:   ColumnHeadersDefaultCellStyle
    property    color       mHeaderBackgroundColor                                                  // <=>	CONTROL LIST:   ColumnHeadersDefaultCellStyle
    property    color       mHeaderBorderColor                                                      // <=>	CONTROL LIST:   ColumnHeadersBorderStyle
    property    int         mHeaderBorderWidth                                                      // <=>	CONTROL LIST:   ColumnHeadersBorderStyle
    property    font        mHeaderFont                                                             // <=>  CONTROL LIST:   ColumnHeadersDefaultCellStyle
    property    color       mHeaderForeColor                                                        // <=>	CONTROL LIST:   ColumnHeadersDefaultCellStyle
    property    string      mHeaderImageSrc:        ""                                              //  Create newly
    property    int         mHeaderWrapMode                                                         // <=>  CONTROL LIST:   ColumnHeadersDefaultCellStyle
    //Row Style
    property    int         mRowAlignmentH                                                          //  <=> CONTROL LIST:   RowTemplate
    property    int         mRowAlignmentV                                                          //  <=> CONTROL LIST:   RowTemplate
    property    var         mRowBackColor:          ["whitesmoke","white"]                          //  <=>	CONTROL LIST:   RowTemplate
    property    int         mRowBorderWidth                                                         //  <=>	CONTROL LIST:   RowTemplate
    property    color       mRowBorderColor                                                         //  <=>	CONTROL LIST:   RowTemplate
    property    font        mRowFont                                                                //  <=> CONTROL LIST:   RowTemplate
    property    color       mRowForeColor                                                           //  <=>	CONTROL LIST:   RowTemplate
    property	int         mRowHeight:             40                                              //  <=>	CONTROL LIST:	RowTemplate
    property    int         mRowPadding                                                             //  <=> CONTROL LIST:   RowTemplate
    property    color       mRowSelectionColor:     "steelblue"                                     //  <=>	CONTROL LIST:   RowTemplate
    property    int         mRowWrapMode                                                            //  <=> CONTROL LIST:   RowTemplate
    //Scroll bar
    property    int         mHorizontalScrollBar:   Qt.ScrollBarAsNeeded                  			//  <=>	CONTROL LIST:	ScrollBars
    property    int         mVerticalScrollBar:     Qt.ScrollBarAsNeeded                 			//  <=>	CONTROL LIST:	ScrollBars
    property    color       mScrollColor:           "#F9B070"                                       //  Create newly
    property    color       mScrollBorderColor                                                      //  Create newly
    property    int         mScrollBorderWidth                                                      //  Create newly
    property    int         mScrollWidth:           14                                              //  Create newly

    //add New
    property    var         mArrColWidth:           []                                              // Create newly: array width of column
    property    var         mArrColName:            []                                              // Create newly: array name of column header
    property    var         mArrAlignV:             []                                              // Create newly: array Align vertical of column
    property    var         mArrAlignH:             []                                              // Create newly: array Align horizontal of column
    property    int         mBorderWidth                                                            //  Create newly
    property    int         mColHeaderWidth:        50                                              // Create newly: default width of column header0
    property    int         mColumnAddInfo:         0                                               //Create new: adding info below column
    property    int         mCurrentRow:            -1                                              // Create newly: current Row
    property    string      mImageEdit:             ""                                              //Create new: Source Image Edit
    property    string      mImageError:            ""                                              //Create new: Source Image Error
    property    var         mInputType:             []                                              // Create newly: choose what to dislay in table view
    property    int         mNumItemPage                                                            //  Create newly
    property    var         mParameterCol:          []                                              //Create new: parameter column
    property    int         mRowCount:              0

    signal validating()
    signal toolTipEvent(var item)
    signal errorEvent(var item0, var item1,var item2,var msgError)
    signal itemOutput(var item)
    signal rowChanged()
    signal doubleClickItem(var item)
    signal clickItem(var item)

    flickableItem.flickableDirection : Flickable.HorizontalAndVerticalFlick //allow scroll horizontal
    horizontalScrollBarPolicy: mHorizontalScrollBar
    verticalScrollBarPolicy: mVerticalScrollBar
    onMCurrentRowChanged: {
        if(mSelectionMode === objSelectionMode.pCellSelect) return
        if(objPrivate.mListItemFirst.length > 0){
            if(mCurrentRow === -1){
                objPrivate.mListItemFirst[objPrivate.mPreviousSelected].isSelectRow = !objPrivate.mListItemFirst[objPrivate.mPreviousSelected].isSelectRow
            }else {
                objPrivate.mListItemFirst[mCurrentRow].isSelectRow = !objPrivate.mListItemFirst[mCurrentRow].isSelectRow
                objPrivate.mPreviousSelected = mCurrentRow
            }
        }
        rowChanged();
    }
    style: TableViewStyle {
        backgroundColor: mBackgroundColor  //màu nền của datagridview màu 1
        highlightedTextColor :"red"   //màu của text trên row dc chọn
        frame: Rectangle {
            id: frameRect
            border.color: mBorderColor
            border.width: {
                if(mBorderStyle === objBorderStyle.pNone)
                    return 0
                return mBorderWidth
            }
        }
        headerDelegate: Rectangle {
            id: headerRect
            height: mColumnHeadersHeight
            color: mHeaderBackgroundColor
            border.color: mHeaderBorderColor
            border.width: mHeaderBorderWidth
            visible: mColumnHeadersVisible

            Image {
                anchors.fill: parent
                source: mHeaderImageSrc
            }

            Text {
                id: headerText
                anchors.centerIn: parent
                color: mHeaderForeColor
                font: mHeaderFont
                text: styleData.value
                wrapMode: mHeaderWrapMode
                horizontalAlignment: mHeaderAlignmentH
                verticalAlignment: mHeaderAlignmentV
            }

        }
        handle: Item {
            id: scrollItem
            implicitWidth: mScrollWidth
            implicitHeight: mScrollWidth

            Rectangle {
                id: scrollRect
                anchors.fill: parent
                color: mScrollColor
                radius: parent.width/2
                border.color: mScrollBorderColor
                border.width: mScrollBorderWidth
            }
        }
    }

    onMDataSourceChanged:{
        if(mVirtualMode) {
            for(var i = 0;i< 10;i++)
            {
                lstModel.append(mDataSource.get(i))
            }
            tblView.model = lstModel
        }
        else {
            tblView.model = mDataSource
        }
    }

    resources: {
        //colName
        var arr = []
        for(var prop in mDataSource.get(0)) {
            if (prop === "objectNameChanged") break
            arr.push(prop.toString())
        }

        arr = arr.filter( function( item, index, inputArray ) {
            return inputArray.indexOf(item) === index;
        });

        //colWidth
        var diff = arr.length - mArrColWidth.length
        if(diff > 0)
            for(var i = 0; i < diff; i++) {
                mArrColWidth.push(objPrivate.mColWidth)
            }
        //AlignH
        var diffH = arr.length - mArrAlignH.length
        if(diffH > 0)
            for(var h = 0; h < diffH; h++) {
                mArrAlignH.push(Text.AlignHCenter)
            }
        //AlignV
        var diffV = arr.length - mArrAlignV.length
        if(diffV > 0)
            for(var v = 0; v < diffV; v++) {
                mArrAlignV.push(Text.AlignVCenter)
            }

        //colName
        var diffName = arr.length - mArrColName.length
        if(diffName > 0)
            for(var j = 0; j < diffName; j++) {
                mArrColName.push(objPrivate.mName+(mArrColName.length + 1))
            }

        //create object
        var obj = []
        var count = 0
        obj.push(columnComponent.createObject(tblView, {  width: mColHeaderWidth, resizable: false,movable: false}))
        if(mInputType.length > 0){
            for(j=0;j<mInputType.length;j++){
                for (i = arr.length -1 ; i >=0; i--){
                    if(arr[i] === mInputType[j]){
                        obj.push(columnComponent.createObject(tblView,
                                                              { role: arr[i], title: mArrColName[count]/*[(arr.length - 1)- i]*/ , width: mArrColWidth[count]/*[(arr.length - 1)- i]*/}))
                        count++
                        break
                    }
                }
            }
            objPrivate.mNumHeader = count
        } else {
            for (var i = arr.length -1 ; i >=0; i--) {
                obj.push(columnComponent.createObject(tblView,
                                                      { role: arr[i], title: mArrColName[(arr.length - 1)- i] , width: mArrColWidth[(arr.length - 1)- i]}))
            }
            objPrivate.mNumHeader = arr.length
        }
        mRowCount = arr.length + 1
        return obj
    }

    rowDelegate: Rectangle {
        id: rectRow
        height: mRowHeight
        border.color: mRowBorderColor
        border.width: mRowBorderWidth
        color: {
            if(styleData === null) return "transparent"
            if(styleData.row % 2 === 0)
                return mRowBackColor[mRowBackColor.length - 1]
            return mRowBackColor[0]
        }
    }

    itemDelegate: Rectangle {
        id: rectItem

        property bool isSelectRow: false

        border.color: mGridColor
        border.width: mGridWidth


        onIsSelectRowChanged:{
            var bgColor
            if(objPrivate.mPreviousSelected!=-1 && objPrivate.mPreviousSelected%2){
                bgColor = mRowBackColor[0]
            }
            else {
                bgColor = mRowBackColor[mRowBackColor.length - 1]
            }

            var strCol
            if(Qt.colorEqual(parent.parent.children[0].item.color,mRowSelectionColor)){
                strCol = bgColor
            }
            else {
                strCol = mRowSelectionColor
            }

            //splice output
            while(objPrivate.mItemSelected.length > 0){
                objPrivate.mItemSelected.splice(0,1)
            }

            if(mMultiSelect){
                for(var i=0; i < objPrivate.mArrY.length; i++) {
                    if(objPrivate.mArrY[i] === styleData.row) {
                        objPrivate.mArrY.splice(i,1)
                        objPrivate.mArrX.splice(i,1)
                        objPrivate.mArrVal.splice(i,1)
                        i--
                    }
                }

                for(i = 0;i < objPrivate.mNumHeader+1;i++) {
                    parent.parent.children[i].item.color = strCol
                    if(i > 0) {
                        if(Qt.colorEqual(strCol,mRowSelectionColor)) {
                            //add
                            objPrivate.mArrX.push(i)
                            objPrivate.mArrY.push(styleData.row)
                            objPrivate.mArrVal.push(parent.parent.children[i].item.children[1].text)
                            parent.parent.children[1].item.children[1].forceActiveFocus()
                            //output
                            objPrivate.mItemSelected.push(parent.parent.children[i].item.children[1].text)
                            if(i === objPrivate.mNumHeader){
                                itemOutput(objPrivate.mItemSelected)
                            }
                        }
                    }
                }
            }

            else {
                //set normalColor
                if(objPrivate.mArrItem.length === objPrivate.mNumHeader+1){
                    for(i = 0;i < objPrivate.mNumHeader+1;i++) {
                        objPrivate.mArrItem[0].color = bgColor
                        objPrivate.mArrItem.splice(0,1)
                    }
                }
                //splice
                while(objPrivate.mArrY.length>0){
                    objPrivate.mArrY.splice(0,1)
                    objPrivate.mArrX.splice(0,1)
                    objPrivate.mArrVal.splice(0,1)
                }
                //push
                if(mCurrentRow !== -1){
                    strCol = mRowSelectionColor
                }

                for(i = 0;i < objPrivate.mNumHeader+1;i++) {
                    parent.parent.children[i].item.color = strCol
                    objPrivate.mArrItem.push(parent.parent.children[i].item)
                    if(i > 0) {
                        if(Qt.colorEqual(strCol,mRowSelectionColor)) {
                            //add
                            objPrivate.mArrX.push(i)
                            objPrivate.mArrY.push(styleData.row)
                            objPrivate.mArrVal.push(parent.parent.children[i].item.children[1].text)
                            parent.parent.children[1].item.children[1].forceActiveFocus()
                            //output
                            objPrivate.mItemSelected.push(parent.parent.children[i].item.children[1].text)
                            if(i === objPrivate.mNumHeader){
                                itemOutput(objPrivate.mItemSelected)
                            }
                        }
                    }
                }
            }
        }

        color: {
            if(mMultiSelect) {
                if(styleData.row%2)
                    return mRowBackColor[0]
                return mRowBackColor[mRowBackColor.length - 1]
            }
            else {
                var bgColor
                if(styleData.row%2){
                    bgColor = mRowBackColor[0]
                }
                else {
                   bgColor =  mRowBackColor[mRowBackColor.length - 1]
                }

                var activeRow =  styleData.row === tblView.currentRow
                var activeColumn = objPrivate.mCurrentColumn === styleData.column
                if(activeRow && activeColumn)
                    return mRowSelectionColor
                return bgColor
            }
        }

        layer.enabled: {
            if(mCellBorderStyle === objCellBorderStyle.pNone)
                return false
            return true
        }

        layer.effect: DropShadow {
            horizontalOffset: {
                switch(mCellBorderStyle) {
                case objCellBorderStyle.pSingle:
                    0
                    break
                case objCellBorderStyle.pRaised:
                    1
                    break
                case objCellBorderStyle.pSunken:
                    -1
                    break
                case objCellBorderStyle.pSingleVertical:
                    0
                    break
                case objCellBorderStyle.pRaisedVertical:
                    1
                    break
                case objCellBorderStyle.pSunkenVertical:
                    -1
                    break
                case objCellBorderStyle.pSingleHorizontal:
                    0
                    break
                case objCellBorderStyle.pRaisedHorizontal:
                    0
                    break
                case objCellBorderStyle.pSunkenHorizontal:
                    0
                    break
                default:
                    0
                    break
                }
            }

            verticalOffset:{
                switch(mCellBorderStyle) {
                case objCellBorderStyle.pSingle:
                    0
                    break
                case objCellBorderStyle.pRaised:
                    1
                    break
                case objCellBorderStyle.pSunken:
                    -1
                    break
                case objCellBorderStyle.pSingleVertical:
                    0
                    break
                case objCellBorderStyle.pRaisedVertical:
                    0
                    break
                case objCellBorderStyle.pSunkenVertical:
                    0
                    break
                case objCellBorderStyle.pSingleHorizontal:
                    0
                    break
                case objCellBorderStyle.pRaisedHorizontal:
                    1
                    break
                case objCellBorderStyle.pSunkenHorizontal:
                    -1
                    break
                default: break;
                }
            }
        }

        Image {
            id: imgEditing
            width: 12
            height: 12
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.rightMargin: 3
            anchors.bottomMargin: 3
            source: mImageEdit
            visible: false
        }

        TextEdit {
            id: txt
            readOnly: mReadOnly
            text:{
                try{
                    if(mColumnAddInfo > 0){
                        if(mColumnAddInfo === styleData.column){
                            if(styleData.row === 0){
                                styleData.value + "\n"
                                        + mDataSource.getInfomation(styleData.row+1).toString()
                            }else{
                                styleData.value + "\n"
                                        + mDataSource.getInfomation(styleData.row).toString()
                            }
                        }else
                            styleData.value
                    } else
                        styleData.value
                }
                catch(exception){
                    return ''
                }
            }

            color: mRowForeColor
            font: mRowFont
            verticalAlignment: mRowAlignmentV
            horizontalAlignment:  mRowAlignmentH
            wrapMode: mRowWrapMode
            anchors.margins: mRowPadding
            anchors {
                top: {
                    if(mArrAlignV[styleData.column] === Text.AlignTop){
                        parent.top
                    }
                }
                bottom: {
                    if(mArrAlignV[styleData.column] === Text.AlignBottom){
                        parent.bottom
                    }
                }
                left: {
                    if(!mRightToLeft && mArrAlignH[styleData.column] === Text.AlignLeft){
                        parent.left
                    }
                }
                right: {
                    if(mRightToLeft || (!mRightToLeft && mArrAlignH[styleData.column] === Text.AlignRight)) {
                        parent.right
                    }
                }
                verticalCenter: {
                    if(mArrAlignV[styleData.column] === Text.AlignVCenter){
                        parent.verticalCenter
                    }
                }
                horizontalCenter: {
                    if(!mRightToLeft && mArrAlignH[styleData.column] === Text.AlignHCenter){
                        parent.horizontalCenter
                    }
                }
            }

            Keys.onPressed: {
                if(event.modifiers & Qt.ControlModifier) {
                    if(event.key === Qt.Key_C) {
                        var strCopy = ""
                        //clipboardCopyMode alwaysIncludeHeaderText
                        if(mClipboardCopyMode === objClipboardCopyMode.pEnableAlwaysIncludeHeaderText) {
                            var arrTmp = []
                            for(var i = 0;i < objPrivate.mArrX.length; i++) {
                                arrTmp.push(objPrivate.mArrX[i])
                            }

                            //sort column
                            for(var i = 0;i<arrTmp.length; i++){
                                for(var j = i+1;j<arrTmp.length; j++){
                                    if(arrTmp[i] >arrTmp[j]){
                                        var tmpY = arrTmp[i]
                                        arrTmp[i] = arrTmp[j]
                                        arrTmp[j] = tmpY
                                    }
                                }
                            }
                            //add title column
                            for( i = 0;i<arrTmp.length;i++) {
                                if(i === 0) {
                                    //row min
                                    for(var j = 0; j< parseInt(arrTmp[i]); j++){
                                        strCopy += "\t\t"
                                    }
                                    strCopy += tblView.getColumn(parseInt(arrTmp[i])).title
                                }
                                else if(arrTmp[i] > arrTmp[i-1]) {
                                    var diff = parseInt(arrTmp[i]) - parseInt(arrTmp[i-1])
                                    if(diff > 0){
                                        strCopy += "\t"
                                    }
                                    for(var j = 0;j<diff-1;j++){
                                        strCopy += "\t\t"
                                    }
                                    strCopy += tblView.getColumn(parseInt(arrTmp[i])).title
                                }
                            }
                            strCopy += "\n"
                        }

                        //sortY
                        for( i = 0;i<objPrivate.mArrY.length; i++){
                            for(var j = i+1;j<objPrivate.mArrY.length; j++){
                                if(objPrivate.mArrY[i] >objPrivate.mArrY[j]){
                                    var tmpY = objPrivate.mArrY[i]
                                    objPrivate.mArrY[i] = objPrivate.mArrY[j]
                                    objPrivate.mArrY[j] = tmpY

                                    var tmpX = objPrivate.mArrX[i]
                                    objPrivate.mArrX[i] = objPrivate.mArrX[j]
                                    objPrivate.mArrX[j] = tmpX

                                    var tmpVal = objPrivate.mArrVal[i]
                                    objPrivate.mArrVal[i] = objPrivate.mArrVal[j]
                                    objPrivate.mArrVal[j] = tmpVal
                                }
                            }
                        }

                        //sortX
                        for(var i = 0;i<objPrivate.mArrX.length;i++){
                            for(var j = i+1;j<objPrivate.mArrX.length;j++){
                                if(objPrivate.mArrY[i] === objPrivate.mArrY[j]){
                                    if(objPrivate.mArrX[i] > objPrivate.mArrX[j]){
                                        var tmpX = objPrivate.mArrX[i]
                                        objPrivate.mArrX[i] = objPrivate.mArrX[j]
                                        objPrivate.mArrX[j] = tmpX

                                        var tmpVal = objPrivate.mArrVal[i]
                                        objPrivate.mArrVal[i] = objPrivate.mArrVal[j]
                                        objPrivate.mArrVal[j] = tmpVal
                                    }
                                }
                            }
                        }

                        for( i = 0; i< objPrivate.mArrVal.length; i++){
                            if(i === 0){
                                //row min
                                for(var j = 0; j< parseInt(objPrivate.mArrX[i]); j++){
                                    strCopy += "\t\t"
                                }
                            }
                            else {
                                if(objPrivate.mArrY[i] === objPrivate.mArrY[i-1]){
                                    var diff = parseInt(objPrivate.mArrX[i]) - parseInt(objPrivate.mArrX[i-1])
                                    if(diff > 0){
                                        strCopy += "\t"
                                    }
                                    for(var j = 0;j<diff-1;j++){
                                        strCopy += "\t\t"
                                    }
                                }
                                else {
                                    var diff = parseInt(objPrivate.mArrY[i]) - parseInt(objPrivate.mArrY[i-1])
                                    for(var j = 0;j < diff;j++){
                                        strCopy +="\n"
                                    }

                                    for(var j = 0; j< parseInt(objPrivate.mArrX[i]); j++){
                                        strCopy += "\t\t"
                                    }
                                }
                            }
                            strCopy += objPrivate.mArrVal[i]
                        }

                        if(mClipboardCopyMode === objClipboardCopyMode.pDisable) {
                            strCopy = ""
                        }
                        clipBoard.copy(strCopy)
                    }
                }
            }

            onTextChanged: {
                tool.visible = false
                var bgColor
                if( styleData.row%2){
                    bgColor = mRowBackColor[0]
                }
                else {
                    bgColor = mRowBackColor[mRowBackColor.length - 1]
                }

                var activeRow = tblView.currentRow === styleData.row
                var activeColumn = objPrivate.mCurrentColumn === styleData.column
                if(mShowEditingIcon) {
                    imgEditing.source = mImageEdit
                    imgEditing.visible  = (activeRow && activeColumn && txt.focus)
                    if(styleData.row > -1){
                        if(parent.parent !== null)
                        {
                            parent.parent.parent.children[0].item.children[0].visible = false
                        }
                    }
                }
                if (mCausesValidation) {
                    validating()
                }
            }

            /*onEditingFinished: {
                imgEditing.visible  = false
                if(mShowCellErrors || mShowRowErrors){
                    errorEvent(txt,imgEditing,parent.parent.parent.children[0].item.children[0],"")
                }
            }*/
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: {
                if(mUseWaitCursor )
                    return Qt.WaitCursor
                return mCursor
            }

            onDoubleClicked: {
                for(var i = 0;i < mParameterCol.length;i++){
                    if(styleData.column === mParameterCol[i]){
                        doubleClickItem(parent.children[1])
                        break
                    }
                }
            }

            onClicked:  {
                if(styleData.column !== 0) {
                    if(mSelectionMode === objSelectionMode.pFullRowSelect) {
                        mCurrentRow = styleData.row
                    }
                    else if(mMultiSelect) {
                        var bgColor
                        if(styleData.row%2){
                            bgColor = mRowBackColor[0]
                        }
                        else {
                            bgColor = mRowBackColor[mRowBackColor.length - 1]
                        }

                        if(Qt.colorEqual(rectItem.color,mRowSelectionColor)) {
                            rectItem.color = bgColor
                            //remove
                            for(var i=0;i<objPrivate.mArrX.length;i++) {
                                if(objPrivate.mArrX[i] === styleData.column) {
                                    if(objPrivate.mArrY[i] === styleData.row) {
                                        objPrivate.mArrVal.splice(i,1)
                                        objPrivate.mArrY.splice(i,1)
                                        objPrivate.mArrX.splice(i,1)
                                        break
                                    }
                                }
                            }
                        }
                        else {
                            rectItem.color = mRowSelectionColor
                            //add
                            objPrivate.mArrX.push(styleData.column)
                            objPrivate.mArrY.push(styleData.row)
                            objPrivate.mArrVal.push(txt.text)
                        }
                        //set index
                        if(styleData.row > -1){
                            tblView.currentRow = styleData.row
                        }
                        if(styleData.column > -1){
                            objPrivate.mCurrentColumn = styleData.column
                        }
                        txt.forceActiveFocus()
                    }
                    else {
                        //remove
                        objPrivate.mArrVal.splice(0,1)
                        objPrivate.mArrY.splice(0,1)
                        objPrivate.mArrX.splice(0,1)
                        //add
                        objPrivate.mArrX.push(styleData.column)
                        objPrivate.mArrY.push(styleData.row)
                        objPrivate.mArrVal.push(txt.text)
                        //set index
                        if(styleData.row > -1){
                            tblView.currentRow = styleData.row
                        }
                        if(styleData.column > -1){
                            objPrivate.mCurrentColumn = styleData.column
                        }
                        txt.forceActiveFocus()
                    }
                }
                else {
                    if(mSelectionMode === objSelectionMode.pFullRowSelect ||
                            mSelectionMode === objSelectionMode.pRowHeaderSelect) {
                        mCurrentRow = styleData.row
                    }
                }
                for(var i = 0;i < mParameterCol.length;i++){
                    if(styleData.column === mParameterCol[i]){
                        clickItem(parent.parent.parent.children[objPrivate.mNumHeader].children[0].children[1])
                        break
                    }
                }
            }

            onEntered: {
                if(mShowCellToolTips){
                    toolTipEvent(rectItem)
                }
            }

            onExited: {
                ToolTip.visible = false
            }

            onWheel: {
                if(mVirtualMode) {
                    if(wheel.angleDelta.y < 0 && lstModel.count < mDataSource.count){
                        var i = lstModel.count
                        var j
                        if(lstModel.count+10 < mDataSource.count){
                            j = (i+ 10)
                        }
                        else {
                            j = mDataSource.count
                        }

                        for( i;i < j;i++){
                            lstModel.append(mDataSource.get(i))
                        }
                        tblView.model = lstModel
                    }
                }
            }
        }

        Component.onCompleted: {
            if(styleData.column === 0){
                objPrivate.mListItemFirst.push(rectItem)
            }
        }
    }

    onToolTipEvent: {
        tool.parent = tblView
    }

    Component.onCompleted: {
        //maximumsize
        if(tblView.mMaximumSize.width!==0)
        {
            if(tblView.objPrivate.mWidth > tblView.mMaximumSize.width)
                tblView.objPrivate.mWidth = tblView.mMaximumSize.width;
        }
        if(tblView.mMaximumSize.height!==0)
        {
            if(tblView.mHeight > tblView.mMaximumSize.height)
                tblView.mHeight = tblView.mMaximumSize.height;
        }
        //minimumsize
        if(tblView.mMinimumSize.width!==0)
        {
            if(tblView.objPrivate.mWidth < tblView.mMinimumSize.width)
                tblView.objPrivate.mWidth = tblView.mMinimumSize.width;
        }
        if(tblView.mMinimumSize.height!==0)
        {
            if(tblView.mHeight < tblView.mMinimumSize.height)
                tblView.mHeight = tblView.mMinimumSize.height;
        }

        mNumItemPage = parseInt(tblView.height/mRowHeight) - 1
        if(tblView.rowCount <= mNumItemPage){
            tblView.height = mRowHeight *rowCount + mColumnHeadersHeight
        }

        switch (mBorderStyle) {
        case objBorderStyle.mNone:
            tblView.layer.enabled = false
            break
        case objBorderStyle.mFixedSingle:
            tblView.layer.enabled = false
            break
        case objBorderStyle.mFixed3D:
            tblView.layer.enabled = true
            break
        default:
            break
        }

    }

    QtObject {
        id: objPrivate
        //private
        property    int         mColWidth:          100             //set default column width
        property    string      mName:              "Column"        //set default column name
        property    var         mArrX:              []              //multiselect: array value X of position
        property    var         mArrY:              []              // multiselect: array value y of position
        property    var         mArrVal:            []              //multiselect: array value of position
        property    int         mNumHeader:         -1              //total number of header
        property    int         mCurrentColumn:     0
        property    var         mListItemFirst:     []              //list object item0
        property    int         mPreviousSelected:  -1              //the previous row selected
        property    var         mItemSelected:      []              //  Create newly: Item Output
        property    var         mArrItem:           []              // Create newly: array Item selected previous
    }

    QtObject {
        id: objCellBorderStyle
        property int pCustom :              0 //not support
        property int pSingle :              1
        property int pRaised :              2
        property int pSunken :              3
        property int pNone   :              4
        property int pSingleVertical:       5
        property int pRaisedVertical :      6
        property int pSunkenVertical :      7
        property int pSingleHorizontal :    8
        property int pRaisedHorizontal :    9
        property int pSunkenHorizontal :    10
    }

    QtObject {
        id: objClipboardCopyMode
        property int pDisable :                         0
        property int pEnableWithAutoHeaderText :        1
        property int pEnableWithoutHeaderText :         2
        property int pEnableAlwaysIncludeHeaderText :   3
    }

    QtObject {
        id: objSelectionMode
        property int pCellSelect :                      0
        property int pFullRowSelect :                   1
        property int pRowHeaderSelect :                 2
        property int pFullColumnSelect :                3
        property int pColumnHeaderSelect :              4
    }

    QtObject {
        id: objBorderStyle
        property int pNone: 1
        property int pFixedSingle: 2
        property int pFixed3D: 3
    }

    Component{
        id: columnComponent
        TableViewColumn{width: 100 }
    }

    Item {
        id: clipBoard
        opacity: 0
        function copy(text) {
            helper.text = text;
            helper.selectAll();
            helper.copy();
        }

        TextEdit {
            id: helper
        }
    }

    ListModel {
        id: lstModel
    }

    ToolTip {
        id: tool
    }

    function traceError(obj0,obj1,obj2,msg) {
        obj0.color ="red"
        tool.text = msg
        tool.visible = true

        if(mShowCellErrors)
        {
            obj1.source = mImageError
            obj1.visible = true
        }
        if(mShowRowErrors)
        {
            obj2.source = mImageError
            obj2.visible = true
        }
    }
}


