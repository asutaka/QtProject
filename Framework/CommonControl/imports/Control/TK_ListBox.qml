import QtQuick 2.0
import QtQuick.Controls 2.0
import CommonControl 1.0
import QtQuick.Layouts 1.1

Rectangle
{
    id:rectList

    //      property alias id:                                  Not Customize <=> CONTROL LIST: Name
    //      property alias anchors{left,top,right,bottom}       Not Customize <=> Anchor{Top,Left,Right,Bottom}
    //      property alias anchors{margins,leftMargin,topMargin,rightMargin,bottomMargin} Not Customize <=> Margin{All,Left,Top,Right,Bottom}


    //      property bool mGenerateMember:                      Not Used <=> CONTROL LIST: GenerateMember
    //      property bool mLocked: false                        Not Used <=> CONTROL LIST: Locked
    //      property int mModifiers:                            Not Used <=> CONTROL LIST: Modifiers
    //      property string mImeMode:                           Not Used <=> CONTROL LIST: ImeMode
    //      property int mDock:                                 Not Used <=> CONTROL LIST: Dock
    //      property bool mAllowDrop                            Not Used <=> CONTROL LIST: AllowDrop
    //      property string mDisplayMember                      Not Used <=> CONTROL LIST: DisplayMember
    //      property string mValueMember                        Not Used <=> CONTROL LIST: ValueMember


            property int        mDrawMode:              0                       // <=> CONTROL LIST: DrawMode
            property int        mSelectionMode:         objSelectionMode.mOne   // <=> CONTROL LIST: SelectionMode
            property bool       mIntegralHeight:        false                   // <=> CONTROL LIST: IntegralHeight
            property alias      mItems:                 rpt.model               // <=> CONTROL LIST: Items
            property bool       mHorizontalScrollbar:   false                   // <=> CONTROL LIST: HorizontalScrollbar
            property int        mHorizontalExtent:      0                       // <=> CONTROL LIST: HorizontalExtent
            property bool       mScrollAlwaysVisible:   false                   // <=> CONTROL LIST: ScrollAlwaysVisible
            property int        mFormatString:          Text.AutoText           // <=> CONTROL LIST: FormatString
            property alias      mDataSource:            rpt.model               // <=> CONTROL LIST: DataSource
            property alias      mEnabled:               rectList.enabled        // <=> CONTROL LIST: Enabled
            property alias      mVisible:               rectList.visible        // <=> CONTROL LIST: Visible
            property font       mFont:                  lbl.font                // <=> CONTROL LIST: Font
            property color      mForeColor:             lbl.color               // <=> CONTROL LIST: ForeColor
            property alias      mX:                     rectList.x              // <=> CONTROL LIST: Location.X
            property alias      mY:                     rectList.y              // <=> CONTROL LIST: Location.Y
            property alias      mWidth:                 rectList.width          // <=> CONTROL LIST: Size.width
            property alias      mHeight:                rectList.height         // <=> CONTROL LIST: Size.height
            property alias      mBackColor:             rectList.color          // <=> CONTROL LIST: BackColor
            property int        mBorderStyle:           objBorderStyle.mFixed3D    // <=> CONTROL LIST: BorderStyle
            property variant    mMaximumSize:           Qt.size(0,0)            // <=> CONTROL LIST: MaximumSize
            property variant    mMinimumSize:           Qt.size(0,0)            // <=> CONTROL LIST: MinimumSize
            property bool       mSorted:                false                   // <=> CONTROL LIST: Sorted
            property int        mItemHeight:            40                      // <=> CONTROL LIST: ItemHeight
            property bool       mMultiColumn:           false                   // <=> CONTROL LIST: MultiColumn
            property bool       mFormattingEnabled:     true                    // <=> CONTROL LIST: FormattingEnabled
            property bool       mRightToLeft:           false                   // <=> CONTROL LIST: RightToLeft
            property bool       mCausesValidation:      true                    // <=> CONTROL LIST: CausesValidation
            property bool       mUseWaitCursor:         false                   // <=> CONTROL LIST: UseWaitCursor
            property int        mCursor:                Qt.ArrowCursor          // <=> CONTROL LIST: Cursor
            property int        mColumnWidth:           rectList.width-(nav.width+nav.anchors.rightMargin)-20 // <=> CONTROL LIST: ColumnWidth

            //AddNew
            property int        mIndex:                 0                       //Index of Item when click ListBox
            property bool       mVisibleNavigator:      true                    //option visible Navigator
            property int        mImageTopMargin:        10                      //Image Margin.Top
            property int        mImageLeftMargin:       10                      //Image Margin.Left
            property int        mImageBottomMargin:     10                      //Image Margin.Bottom
            property int        mTextLeftMargin:        10                      //Text Margin.Left
            property int        mTextTopMargin:         10                      //Text Margin.Top
            property int        mTextBottomMargin:      10                      //Text Margin.Bottom
            property string     mColorHightlight:       '#f79642'               //Color hightlight when select item
            property    var     mItemHeightArray:           []                  //CreateNew : 	array Item Height
            property    var     mFontArray:                 []                  //CreateNew: 	array Font
            property    var     mForeColorArray:            []                  //CreateNew: 	array ForeColor
            property    var     mBackgroundArray:           []                  //CreateNew: 	array background

            signal              selectedIndexChanged()
            signal              openCalculator()
            signal              validating()

            width: 500
            height:500
            color:"white"
            border.width:{
                switch(rectList.mBorderStyle){
                case 0:0;break;
                case 1:
                case 2:1;break;
                }
            }
            border.color: "#000000"
            clip: true


            QtObject {
                id: objSelectionMode
                property int mNone: 0
                property int mOne: 1
                property int mMultiSimple: 2
                property int mMultiExtended: 3
            }
            QtObject {
                id: objBorderStyle
                property int mNone: 0
                property int mFixedSingle: 1
                property int mFixed3D: 2
            }
            QtObject {
                id: objPrivate
                property int        mHEIGHT:                mMultiColumn?(mHeight-20):(rpt.model.count*mItemHeight)
                property int        mIRow:                  Math.floor(objPrivate.mHEIGHT/mItemHeight)
                property int        mIColumn:               mMultiColumn?Math.ceil(rpt.model.count/objPrivate.mIRow):1
                property string     mColor:                 'transparent'
                property int        mCurrentIndex:          0
            }

            Rectangle{
                anchors.fill: parent
                anchors.margins:{
                    switch(rectList.mBorderStyle){
                    case 0:0; break;
                    case 1:
                    case 2:1;break;
                    }
                }
                border.color:{
                    switch(rectList.mBorderStyle){
                    case 0:
                    case 1:"transparent";break;
                    case 2:"#00308f";break;
                    }
                }

                color:"transparent"
                TK_Navigator{
                    id: nav
                    x: 0
                    y: 0
                    height: rectList.height
                    anchors.topMargin: 3
                    anchors.rightMargin: 3
                    anchors.bottomMargin: 3
                    colorBackground: "#EEF2E7"
                    fontName: "MS Gothic"
                    fontSize: 27
                    maxIndex: rpt.model.count
                    numberRow: rpt.model.count
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    visible:rectList.mVisibleNavigator

                    onKeyChanged: {
                        if(nav.indexRowSelected === 0) return
                        if(rectList.mSelectionMode === objSelectionMode.mOne &&
                                grid.children[objPrivate.mCurrentIndex].color!==undefined){
                            //set background special
                            var myColor
                            var tmpSize = mBackgroundArray.length
                            var tmpIndex = objPrivate.mCurrentIndex
                            if(tmpSize >0){
                                while(tmpIndex >= tmpSize){
                                    tmpIndex = tmpIndex - tmpSize
                                }
                                myColor = mBackgroundArray[tmpIndex]
                            }
                            else {
                                myColor = objPrivate.mColor
                            }
                            grid.children[objPrivate.mCurrentIndex].color=myColor;
                            rectList.mIndex=indexRowSelected - 1;
                            objPrivate.mCurrentIndex=rectList.mIndex;
                            grid.children[objPrivate.mCurrentIndex].color=rectList.mColorHightlight;
                        }
                        selectedIndexChanged();
                    }
                    onPressCenterKey:{
                        openCalculator();
                    }
                }
                Rectangle{
                    width:parent.width-(nav.width+nav.anchors.rightMargin)
                    height: parent.height
                    color:'transparent'
                    Rectangle {
                        anchors.fill: parent
                        color:'transparent'
                        Component.onCompleted: scroll.contentItem = contener


                        function scrollChange(){
                            if ((width > rectList.mColumnWidth) && (height > objPrivate.mHEIGHT)){
                                if((mScrollAlwaysVisible || mHorizontalScrollbar)) return
                                scroll.contentItem = itemNull
                                contener.width = rectList.mColumnWidth*objPrivate.mIColumn;
                                contener.height = (rpt.model.count<=objPrivate.mIRow)?
                                            (rpt.model.count*rectList.mItemHeight):height
                            }
                            else{
                                if(mScrollAlwaysVisible){
                                    if(contener.height < rectList.height)
                                        contener.height = rectList.height
                                }

                                if(mHorizontalScrollbar){
                                    contener.width = mHorizontalExtent
                                }

                                scroll.contentItem = contener
                            }
                        }

                        onWidthChanged:{
                            scrollChange()
                        }


                        onHeightChanged:{
                            scrollChange()
                        }

                        TK_ScrollView {
                            id : scroll
                            anchors.fill : parent
                        }

                        Item{id :itemNull}

                        Rectangle {
                            id: contener
                            width : rectList.mColumnWidth
                            height: objPrivate.mHEIGHT
                            color:'transparent'
                            GridLayout {
                                id: grid
                                columns: objPrivate.mIColumn
                                /* couple*/
                                flow: GridLayout.TopToBottom
                                rows:objPrivate.mIRow

                                /**/
                                anchors.fill :contener
                                Repeater {
                                    id:rpt
                                    model:rectList.mDataSource

                                    Rectangle {
                                        id: rectFace
                                        Layout.fillWidth: true
//                                        Layout.fillHeight: true
                                        height: {
                                            //set height special
                                              var tmpSize = mItemHeightArray.length
                                              var tmpIndex = index
                                              if(tmpSize >0){
                                                  //set mItemHeight
                                                  var sumTotal = 0
                                                  var sumArr = eval(mItemHeightArray.join("+")) // sum Array mItemHeightArray
                                                  var countSource = mDataSource.count
                                                  var div = countSource/tmpSize
                                                  var odd = countSource%tmpSize
                                                  sumTotal += div*sumArr
                                                  for(var i = 0; i<odd;i++){
                                                      sumTotal += mItemHeightArray[i]
                                                  }
                                                  mItemHeight = sumTotal/countSource
                                                  //
                                                  while(tmpIndex >= tmpSize){
                                                      tmpIndex = tmpIndex - tmpSize
                                                  }
                                                  return mItemHeightArray[tmpIndex] - 5
                                              }
                                              else {
                                                  return mItemHeight - 5
                                              }
//                                              mItemHeight - 5
                                        }
                                        color: {
                                            //set background special
                                            var tmpSize = mBackgroundArray.length
                                            var tmpIndex = index
                                            if(tmpSize >0){
                                                while(tmpIndex >= tmpSize){
                                                    tmpIndex = tmpIndex - tmpSize
                                                }
                                                return mBackgroundArray[tmpIndex]
                                            }
                                            else {
                                                return 'transparent'
                                            }
                                        }

                                        Image {
                                            id:img
                                            anchors.top: parent.top
                                            anchors.topMargin: rectList.mImageTopMargin
                                            anchors.left: parent.left
                                            anchors.leftMargin: rectList.mRightToLeft?
                                                rectList.mColumnWidth-(img.width+txt.width+rectList.mImageLeftMargin+20)
                                                :rectList.mImageLeftMargin
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: rectList.mImageBottomMargin
                                            source: imgSrc
                                        }
                                        Text {
                                            id:txt
                                            anchors.left: img.right
                                            anchors.leftMargin: rectList.mTextLeftMargin
                                            anchors.top: parent.top
                                            anchors.topMargin: rectList.mTextTopMargin
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: rectList.mTextBottomMargin
                                            text: strText
                                            textFormat: rectList.mFormattingEnabled?rectList.mFormatString:undefined
                                            font: {
                                                //set font special
                                                var tmpSize = mFontArray.length
                                                var tmpIndex = index
                                                if(tmpSize >0){
                                                    while(tmpIndex >= tmpSize){
                                                        tmpIndex = tmpIndex - tmpSize
                                                    }
                                                    return mFontArray[tmpIndex]
                                                }
                                                else {
                                                    return rectList.mFont
                                                }
                                            }
                                            color:{
                                                  //set color special
                                                  var tmpSize = mForeColorArray.length
                                                  var tmpIndex = index
                                                  if(tmpSize >0){
                                                      while(tmpIndex >= tmpSize){
                                                          tmpIndex = tmpIndex - tmpSize
                                                      }
                                                      return mForeColorArray[tmpIndex]
                                                  }
                                                  else {
                                                      return rectList.mForeColor
                                                  }
                                              }
                                        }

                                        MouseArea
                                        {
                                            anchors.fill: parent
                                            onPressed:
                                            {
                                                //set background special
                                                var myColor
                                                var tmpSize = mBackgroundArray.length
                                                var tmpIndex = index
                                                if(tmpSize >0){
                                                    while(tmpIndex >= tmpSize){
                                                        tmpIndex = tmpIndex - tmpSize
                                                    }
                                                    myColor = mBackgroundArray[tmpIndex]
                                                }
                                                else {
                                                    myColor = objPrivate.mColor
                                                }

                                                nav.indexRowSelected = index+1;

                                                if(rectList.mSelectionMode === objSelectionMode.mOne)
                                                {
                                                    grid.children[objPrivate.mCurrentIndex].color = myColor
                                                }
                                                nav.indexRowSelected = index+1;
                                                rectList.mIndex=nav.indexRowSelected-1;
                                                objPrivate.mCurrentIndex=rectList.mIndex;
                                                if(rectList.mSelectionMode === objSelectionMode.mOne)
                                                {
                                                    rectFace.color=rectList.mColorHightlight;
                                                }
                                                else if(rectList.mSelectionMode === objSelectionMode.mMultiSimple ||
                                                        rectList.mSelectionMode === objSelectionMode.mMultiExtended)
                                                {
                                                    if(Qt.colorEqual(rectFace.color,rectList.mColorHightlight))
                                                    {
                                                        rectFace.color = myColor
                                                    }
                                                    else
                                                    {
                                                        rectFace.color=rectList.mColorHightlight;
                                                    }
                                                }
                                            }

                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            Label
            {
                id:lbl
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
                acceptedButtons: Qt.NoButton
            }
            Component.onCompleted:
            {
                //set default navigator
                nav.indexRowSelected = 0
                //Validation
                if(mCausesValidation)
                {
                    validating()
                }

                //IntegralHeight
                if((rectList.height%rectList.mItemHeight!==0)&& rectList.mIntegralHeight)
                {
                    rectList.height = (Math.floor(rectList.height/rectList.mItemHeight))*rectList.mItemHeight;
                }

                //sorted
                if(rectList.mSorted)
                {
                    var n;
                    var i;
                    for (n=0; n < rpt.model.count; n++)
                        for (i=n+1; i < rpt.model.count; i++)
                        {
                            if (rpt.model.get(n).strText> rpt.model.get(i).strText)
                            {
                                rpt.model.move(i, n, 1);
                                n=0;
                            }
                        }
                }

                //maximumsize
                if(rectList.mMaximumSize.width!==0)
                {
                    if(rectList.mWidth>rectList.mMaximumSize.width)
                        rectList.mWidth=rectList.mMaximumSize.width;
                }
                if(rectList.mMaximumSize.height!==0)
                {
                    if(rectList.mHeight>rectList.mMaximumSize.height)
                        rectList.mHeight=rectList.mMaximumSize.height;
                }
                //minimumsize
                if(rectList.mMinimumSize.width!==0)
                {
                    if(rectList.mWidth<rectList.mMinimumSize.width)
                        rectList.mWidth=rectList.mMinimumSize.width;
                }
                if(rectList.mMinimumSize.height!==0)
                {
                    if(rectList.mHeight<rectList.mMinimumSize.height)
                        rectList.mHeight=rectList.mMinimumSize.height;
                }
            }

}
