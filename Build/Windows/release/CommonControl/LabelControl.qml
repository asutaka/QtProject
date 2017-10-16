import QtQuick 2.5
import QtQuick.Controls 2.0
//import QtQuick.Controls.Styles 1.4
//import QtQuick.Controls.Private 1.0
ComboBox {
    id: cbm

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

    //    property	alias	mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property	alias	mImeMode                Not used        <=> CONTROL LIST: ImeMode
    //    property	alias	mItems                  Not used        <=> CONTROL LIST: Items
    //    property	bool	mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property	var 	mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property	alias	mValueMember            Not used        <=> CONTROL LIST: ValueMember
    //    property	alias	mDisplayMember          Not used        <=> CONTROL LIST: DisplayMember
    //    property	alias	mSize                   Defined in mFont <=> CONTROL LIST: Size
    //    property	bool	mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property	int 	mDock                   Not used        <=> CONTROL LIST: Dock
    //  property	int	    mDrawMode:          Not used                                 <=> CONTROL LIST: DrawMode

    property	alias	mEnabled:  cbm.enabled                //  <=> CONTROL LIST: Enabled
    property	alias	mVisible:  cbm.visible                //   <=> CONTROL LIST: Visibled
    property	alias	mX:     cbm.x                      //   <=> CONTROL LIST: Location(x)
    property	alias	mY:     cbm.y                      //   <=> CONTROL LIST: Location(y)
    property	alias	mWidth: cbm.width                  //   <=> CONTROL LIST: Size(Width)
    property	alias	mHeight: cbm.height                //   <=> CONTROL LIST: Size(Height)
    property	var	    mDataSource:        []                  // <=> CONTROL LIST: DataSource
    property	font	mFont                                                // <=> CONTROL LIST: mFont
    property	int     mDropDownStyle:     objDropDownStyle.mDropDown                // <=> CONTROL LIST: DropDownStyle
    property	int     mDropDownHeight:    200                              // <=> CONTROL LIST: DropDownHeight
    property	int     mItemHeight:        50                  // <=> CONTROL LIST: mItemHeight
    property	color	mBackColor:         'gray'                       // <=> CONTROL LIST: mBackColor
    property	color	mForeColor:  'black'                                           // <=> CONTROL LIST: mForeColor
    property	int 	mDropDownWidth:     cbm.width                   // <=> CONTROL LIST:  DropDownWidth
    property	string	mText                                                // <=> CONTROL LIST: Text
    property	bool	mFormattingEnabled: true                             // <=> CONTROL LIST: FormattingEnabled
    property	int     mFormatString:      Text.AutoText                    // <=> CONTROL LIST: FormatString
    property	bool	mRightToLeft:       false                             // <=> CONTROL LIST: mRightToLeft
    property	int 	mFlatStyle:         objFlatStyle.mFlat                                // <=> CONTROL LIST: FlatStyle
    property	size    mMaximumSize:       Qt.size(0, 0)                    // <=> CONTROL LIST: MaximumSize
    property	size    mMinimumSize:       Qt.size(0, 0)                    // <=> CONTROL LIST: MinimumSize
    property	bool	mSorted:            false                            // <=> CONTROL LIST: Sorted
    property	int     mAutoCompleteMode:          objAutoCompleteMode.mNone              //  <=> CONTROL LIST: AutoCompleteMode
    property	int 	mAutoCompleteSource:        objAutoCompleteSource.mNone            //  <=> CONTROL LIST: AutoCompleteSource
    property    var     mAutoCompleteCustomSource:  []                                  //  <=> CONTROL LIST: AutoCompleteCustomSource

    QtObject {
        id: objDropDownStyle
        property int mSimple: 0
        property int mDropDown: 1
        property int mDropDownList: 2
    }

    QtObject {
        id: objFlatStyle
        property int mFlat: 0
        property int mPopup: 1
        property int mStandard: 2
        property int mSystem: 3
    }

    QtObject {
        id: objAutoCompleteMode
        property int mNone:             1
        property int mSuggest:          2
        property int mAppend:           3
        property int mSuggestAppend:    4
    }

    QtObject {
        id: objAutoCompleteSource
        property int mNone:             1
        property int mCustomSource:     2
    }


    QtObject {
        id: objPrivate
        property bool isEdittable: mDropDownStyle === objDropDownStyle.mDropDownList
        property bool isComplete: false
        property var  mResultFilter:              []
        property bool isVisibleTextAppend: mAutoCompleteMode === objAutoCompleteMode.mAppend
                                        || mAutoCompleteMode === objAutoCompleteMode.mSuggestAppend
        property bool isKeyEnter: false
    }

    width: 200
    height: mItemHeight
    font: mFont
    clip: true
    model: {
        // mSort
        if(mSorted){
            mDataSource = mDataSource.sort()
        }
        // mText
        if(mText !== ''){
            mDataSource.splice(0,0,mText)
        }
        return mDataSource
    }

      contentItem: Item {
          ///////////////////////
          //DropDown
          TextField{
              id: txtTextEdit
              anchors{
                  verticalCenter: parent.verticalCenter
                  right:{ if(mRightToLeft)  parent.right }
                  rightMargin: { if(mRightToLeft)  24 }
                  left: {if(!mRightToLeft)  parent.left}
                  leftMargin: { if(!mRightToLeft)  -10 }
              }
              width: parent.width - 20
              color : mForeColor
              text: cbm.displayText
              font: cbm.font
              visible: !objPrivate.isEdittable
              verticalAlignment: Text.AlignVCenter;
              horizontalAlignment: mRightToLeft?Text.AlignRight : Text.AlignLeft
              Keys.onPressed: {
                    objPrivate.isKeyEnter = checkKeyPress(event.key)
              }
              onTextChanged: {
                  if(objPrivate.isComplete){
                      filter(txtTextEdit.text)
                      if(txtTextEdit.text !== '' && objPrivate.mResultFilter.length >0){
                          //Append
                          txtAppend.text = objPrivate.mResultFilter[0]
                          txtAppend.visible = true && objPrivate.isVisibleTextAppend
//                          //Suggest
                          if(objPrivate.isKeyEnter){
                              pop.close()
                          }
                          else{
                              pop.open()
                              lstView.currentIndex = getIndex(txtAppend.text)
                          }
                      }
                      else{
                          //append
                          txtAppend.visible = false && objPrivate.isVisibleTextAppend
                          //suggest
                          pop.close()
                      }
                  }
              }
          }
//          //default text
//          TextField{
//              id: txtDefault
//              anchors{
//                  verticalCenter: parent.verticalCenter
//                  right:{ if(mRightToLeft)  parent.right }
//                  rightMargin: { if(mRightToLeft)  24 }
//                  left: {if(!mRightToLeft)  parent.left}
//                  leftMargin: { if(!mRightToLeft)  -10 }
//              }
//              width: parent.width - 20
//              color : mForeColor
//              text: mText
//              font: cbm.font
//              visible: !objPrivate.isEdittable && cbm.currentIndex === -1
//              verticalAlignment: Text.AlignVCenter;
//              horizontalAlignment: mRightToLeft?Text.AlignRight : Text.AlignLeft
////              Keys.onPressed: {
////                  console.log("temp: "+event.key)
////                  objPrivate.isKeyEnter = checkKeyPress(event.key)
////              }
//              onTextChanged: {
//                  if(objPrivate.isComplete){
//                      console.log("txtDefault:"+txtDefault.visible)
//                      filter(txtDefault.text)
//                      if(txtDefault.text !== '' && objPrivate.mResultFilter.length >0){
//                          //Append
//                          txtAppend.text = objPrivate.mResultFilter[0]
//                          txtAppend.visible = true && objPrivate.isVisibleTextAppend
//                          //Suggest
//                          if(objPrivate.isKeyEnter){
//                              pop.close()
//                          }
//                          else{
//                              pop.open()
//                              lstView.currentIndex = getIndex(txtAppend.text)
//                          }
//                      }
//                      else{
//                          //append
//                          txtAppend.visible = false && objPrivate.isVisibleTextAppend
//                          //suggest
//                          pop.close()
//                      }
//                  }
//              }
//          }
          ///////////////////////

          ///////////////////////
          //DropDownList
          Text{
              anchors{
                  verticalCenter: parent.verticalCenter
                  right:{ if(mRightToLeft)  parent.right }
                  rightMargin: { if(mRightToLeft)  30 }
              }
              color : mForeColor
              text: cbm.displayText
              font: cbm.font
              visible: objPrivate.isEdittable
              verticalAlignment: Text.AlignVCenter;
              horizontalAlignment: Text.AlignLeft;
          }
          ///////////////////////

          //text autocomplete append
          Text{
              id: txtAppend
              anchors{
                  verticalCenter: parent.verticalCenter
                  right:{ if(mRightToLeft)  parent.right }
                  rightMargin: { if(mRightToLeft)  30 }
              }
              opacity: 0.3
              color : mForeColor
              text: ''
              font: cbm.font
              visible: objPrivate.isEdittable && cbm.currentIndex !== -1
                       && objPrivate.isVisibleTextAppend
              verticalAlignment: Text.AlignVCenter;
              horizontalAlignment: Text.AlignLeft;
          }
      }

    background: Rectangle{
        id: rectCategory
        color: mBackColor;
        border.width: 1;
        border.color: "#fff"
        Component.onCompleted: {
            if(mFlatStyle === objFlatStyle.mFlat){
                rectCategory.border.color = "Black"
                rectCategory.radius = 0
            }
            else if(mFlatStyle === objFlatStyle.mPopup){
                rectCategory.border.color = "#BBBBBB"
                rectCategory.radius = 0
            }
            else if(mFlatStyle === objFlatStyle.mStandard){
                rectCategory.border.color = "#0081f6"
                rectCategory.radius = 5
            }
            else if(mFlatStyle === objFlatStyle.mSystem){
                rectCategory.border.color = "#0081f6"
                rectCategory.radius = 5
            }
        }
    }


    delegate: ItemDelegate {
          width: cbm.width
          height: mItemHeight
          contentItem: Text{
              text:modelData
              horizontalAlignment: {
                if(mRightToLeft){
                    Text.AlignRight
                }else{
                    Text.AlignLeft
                }
              }
//              verticalAlignment: Text.AlignVCenter
              font: cbm.font
              color: mForeColor
              textFormat: cbm.mFormattingEnabled?cbm.mFormatString: undefined
          }
    //      onClicked:
    //      {
    //          groupSelect.currentIndex = index
    //          listview.currentIndex = index
    //      }
    }

    popup: Popup {
        id: pop
        y: cbm.height
        width: mDropDownWidth
        implicitHeight: Math.min(contentItem.implicitHeight, mDropDownHeight)
        padding: 1
        background: Rectangle { color: mBackColor }
        contentItem: ListView {
            id: lstView
            clip: true
            implicitHeight: contentHeight
            model: cbm.popup.visible ? cbm.delegateModel : null
            currentIndex: cbm.highlightedIndex
            section.property: "modelData"
            highlightFollowsCurrentItem: true
            highlight: Rectangle {
                color: "lightsteelblue"
                opacity: 0.4
                Behavior on y { SpringAnimation { spring: 3; damping: 0.2} }
            }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
    Component.onCompleted: {
        mAutoCompleteCustomSource = mDataSource

        //Maximumsize
        if(cbm.mMaximumSize.width !== 0)
        {
            if(cbm.width > cbm.mMaximumSize.width)
                cbm.width = cbm.mMaximumSize.width;
        }
        if(cbm.mMaximumSize.height !== 0)
        {
            if(cbm.height > cbm.mMaximumSize.height)
                cbm.height = cbm.mMaximumSize.height;
        }
        //Minimumsize
        if(cbm.mMinimumSize.width !== 0)
        {
            if(cbm.width < cbm.mMinimumSize.width)
                cbm.width = cbm.mMinimumSize.width;
        }
        if(cbm.mMinimumSize.height !== 0)
        {
            if(cbm.height < cbm.mMinimumSize.height)
                cbm.height = cbm.mMinimumSize.height;
        }
        //Complete
        objPrivate.isComplete = true
    }
    //Filter of autoComplete suggest
    function filter(value) {
        objPrivate.mResultFilter.length = 0
        for(var i = 0; i < mAutoCompleteCustomSource.length; i ++) {
            if(mAutoCompleteCustomSource[i].indexOf(value) === 0) {
                objPrivate.mResultFilter.push(mAutoCompleteCustomSource[i])
            }
        }
    }
    //get index autocomplete append
    function getIndex(value) {
        if( mAutoCompleteCustomSource.length > 0){
            var index = mAutoCompleteCustomSource.indexOf(value)
            return index
        }
        return -1
    }
    //check keyPress
    function checkKeyPress(obj){
        if(obj === Qt.Key_Enter || obj === Qt.Key_Return){
            return true
        }
        else {
            return false
        }
    }
}
