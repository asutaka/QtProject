import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import CommonControl 1.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.0



Rectangle
{
    id:rectList

    //      property alias id:                                  Not Customize <=> CONTROL LIST: Name
    //      property alias anchors{left,top,right,bottom}       Not Customize <=> Anchor{Top,Left,Right,Bottom}
    //      property alias anchors{margins,leftMargin,topMargin,rightMargin,bottomMargin} Not Customize <=> Margin{All,Left,Top,Right,Bottom}


    //      property bool           mGenerateMember:                                Not Used <=> CONTROL LIST: GenerateMember
    //      property bool           mLocked:                                        Not Used <=> CONTROL LIST: Locked
    //      property int            mModifiers:                                     Not Used <=> CONTROL LIST: Modifiers
    //      property string         mImeMode:                                       Not Used <=> CONTROL LIST: ImeMode
    //      property int            mDock:                                          Not Used <=> CONTROL LIST: Dock
    //      property bool           mAllowDrop                                      Not Used <=> CONTROL LIST: AllowDrop


            property bool           mCausesValidation:      true                    // <=> CONTROL LIST: CausesValidation
            property bool           mUseWaitCursor:         false                   // <=> CONTROL LIST: UseWaitCursor
            property int            mCursor:                Qt.ArrowCursor          // <=> CONTROL LIST: Cursor
            property bool           mHorizontalScrollbar:   false                   // <=> CONTROL LIST: HorizontalScrollbar
            property int            mHorizontalExtent:      0                       // <=> CONTROL LIST: HorizontalExtent
            property bool           mScrollAlwaysVisible:   false                   // <=> CONTROL LIST: ScrollAlwaysVisible
            property int            mSelectionMode:         objSelectionMode.mOne   // <=> CONTROL LIST: SelectionMode
            property alias          mItems:                 rpt.model               // <=> CONTROL LIST: Items
            property bool           mIntegralHeight:        false                   // <=> CONTROL LIST: IntegralHeight
            property bool           mThreeDCheckBoxes:      true                    // <=> CONTROL LIST: ThreeDCheckBoxes
            property bool           mCheckOnClick :         false                   // <=> CONTROL LIST: CheckOnClick
            property int            mFormatString:          Text.AutoText           // <=> CONTROL LIST: FormatString
            property alias          mEnabled:               rectList.enabled        // <=> CONTROL LIST: Enabled
            property alias          mVisible:               rectList.visible        // <=> CONTROL LIST: Visible
            property font           mFont:                  lbl.font                // <=> CONTROL LIST: Font
            property color          mForeColor:             lbl.color               // <=> CONTROL LIST: ForeColor
            property alias          mX:                     rectList.x              // <=> CONTROL LIST: Location.X
            property alias          mY:                     rectList.y              // <=> CONTROL LIST: Location.Y
            property alias          mWidth:                 rectList.width          // <=> CONTROL LIST: Size.width
            property alias          mHeight:                rectList.height         // <=> CONTROL LIST: Size.height
            property alias          mBackColor:             rectList.color          // <=> CONTROL LIST: BackColor
            property int            mBorderStyle:           borderStyle.mFixed3D    // <=> CONTROL LIST: BorderStyle
            property variant        mMaximumSize:           Qt.size(0,0)            // <=> CONTROL LIST: MaximumSize
            property variant        mMinimumSize:           Qt.size(0,0)            // <=> CONTROL LIST: MinimumSize
            property bool           mSorted:                false                   // <=> CONTROL LIST: Sorted
            property int            mItemHeight:            40                      // <=> CONTROL LIST: ItemHeight
            property int            mColumnWidth:           rectList.width-20       // <=> CONTROL LIST: ColumnWidth
            property bool           mMultiColumn:           false                   // <=> CONTROL LIST: MultiColumn
            property bool           mFormattingEnabled:     true                    // <=> CONTROL LIST: FormattingEnabled
            property bool           mRightToLeft:           false                   // <=> CONTROL LIST: RightToLeft


            //AddNew
            property alias          mDataSource:            rpt.model               //DataSource
            property int            mIndex:                 0                       //Index of Item when click CheckedListBox
            property bool           mState:                 false                   //State of Item when click CheckedListBox
            property string         mColorHightlight:       '#f79642'               //Color hightlight when select item

            signal selectedIndexChanged()
            signal openCalculator()
            signal validating()



            width: 500
            height:500
            color:"white"
            border.width:
            {
                switch(rectList.mBorderStyle)
                {
                case 0:0;break;
                case 1:
                case 2:1;break;
                }
            }
            border.color: "#000000"
            clip: true


            QtObject
            {
                id: objPrivate
                property int            pHEIGHT:                mMultiColumn?(mHeight-20):(rpt.model.count*mItemHeight)
                property int            pIRow:                  Math.floor(objPrivate.pHEIGHT/mItemHeight)
                property int            pIColumn:               mMultiColumn?Math.ceil(rpt.model.count/objPrivate.pIRow):1
                property string         pColor:                 'transparent'
                property int            pCurrentIndex:          0
            }

            QtObject {
                id: objSelectionMode
                property int mNone: 0
                property int mOne: 1
            }
            QtObject {
                id: borderStyle
                property int mNone: 0
                property int mFixedSingle: 1
                property int mFixed3D: 2
            }

            Rectangle
            {
                anchors.fill: parent
                anchors.margins:
                {
                    switch(rectList.mBorderStyle)
                    {
                    case 0:0; break;
                    case 1:
                    case 2:1;break;
                    }
                }
                border.color:
                {
                    switch(rectList.mBorderStyle)
                    {
                    case 0:
                    case 1:"transparent";break;
                    case 2:"#00308f";break;
                    }
                }

                color:"transparent"
                //take it

                Rectangle
                {
                    width:parent.width
                    height: parent.height
                    color:'transparent'
                    Rectangle {
                        anchors.fill: parent
                        color:'transparent'
                        Component.onCompleted: scroll.contentItem = contener


                        function scrollChange(){
                            if ((width > rectList.mColumnWidth) && (height > objPrivate.pHEIGHT)){
                                if((mScrollAlwaysVisible || mHorizontalScrollbar)) return
                                scroll.contentItem = itemNull
                                contener.width = rectList.mColumnWidth*objPrivate.pIColumn;
                                contener.height = (rpt.model.count<=objPrivate.pIRow)?
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

                        onWidthChanged: scrollChange()
                        onHeightChanged: scrollChange()

                        ScrollView {
                            id : scroll
                            anchors.fill : parent
                        }

                        Item{id :itemNull}

                        Rectangle {
                            id: contener
                            width : rectList.mColumnWidth
                            height: objPrivate.pHEIGHT
                            color:'transparent'
                            GridLayout {
                                id: grid
                                columns: objPrivate.pIColumn
                                flow: GridLayout.TopToBottom
                                rows:objPrivate.pIRow
                                anchors.fill :contener
                                Repeater {
                                    id:rpt
                                    model:rectList.mDataSource
                                    Rectangle
                                    {
                                        id:rectFace
                                        Layout.fillWidth: true
//                                        Layout.fillHeight: true
                                        height: mItemHeight - 5
                                        color:'transparent'
                                        MouseArea
                                        {
                                            z:1
                                            anchors.fill: parent
                                            onPressed:
                                            {
                                                if(mSelectionMode === objSelectionMode.mNone) return
                                                grid.children[objPrivate.pCurrentIndex].color = objPrivate.pColor
                                                rectList.mIndex=index;
                                                if(mCheckOnClick || objPrivate.pCurrentIndex === index)
                                                {
                                                    chk.checked = !chk.checked
                                                }
                                                rectList.mState=chk.checked;
                                                objPrivate.pCurrentIndex=rectList.mIndex;
                                                rectFace.color=rectList.mColorHightlight;
                                                selectedIndexChanged();
                                            }

                                        }
                                        CheckBox {
                                            id:chk
                                            anchors.top: parent.top
                                            anchors.topMargin: 10
                                            anchors.left:{
                                               if(!mRightToLeft)
                                                   parent.left
                                            }

                                            anchors.leftMargin:{
                                                if(!mRightToLeft)
                                                    10
                                            }
                                            anchors.right:{
                                                if(mRightToLeft)
                                                    parent.right
                                            }
                                            anchors.rightMargin:{
                                                if(mRightToLeft)
                                                    10
                                            }
                                            anchors.bottom: parent.bottom
                                            anchors.bottomMargin: 10

                                            checked:false
                                            text: strText
                                            style: CheckBoxStyle
                                            {
                                                label: Text {
////                                                                color: control.enabled ? colour.text : colour.disabled
////                                                                Behavior on color { ColorAnimation { duration: 150; } }
////                                                                visible: textOnRight
////                                                                elide: chk.elide
                                                                text:  chk.text
                                                                font: mFont
                                                                color: mForeColor
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

            Label{
                id:lbl
            }
            MouseArea {
                anchors.fill: parent
                cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
                acceptedButtons: Qt.NoButton
            }
            Component.onCompleted:{

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
                if(rectList.mMaximumSize.width!==0){
                    if(rectList.mWidth>rectList.mMaximumSize.width)
                        rectList.mWidth=rectList.mMaximumSize.width;
                }
                if(rectList.mMaximumSize.height!==0){
                    if(rectList.mHeight>rectList.mMaximumSize.height)
                        rectList.mHeight=rectList.mMaximumSize.height;
                }
                //minimumsize
                if(rectList.mMinimumSize.width!==0){
                    if(rectList.mWidth<rectList.mMinimumSize.width)
                        rectList.mWidth=rectList.mMinimumSize.width;
                }
                if(rectList.mMinimumSize.height!==0){
                    if(rectList.mHeight<rectList.mMinimumSize.height)
                        rectList.mHeight=rectList.mMinimumSize.height;
                }
            }

}
