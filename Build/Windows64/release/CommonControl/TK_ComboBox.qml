import QtQuick 2.5
import QtQuick.Controls 2.0

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
    //    property	int	    mDrawMode:              Not used        <=> CONTROL LIST: DrawMode

    property	alias	mEnabled:           cbm.enabled                 //  <=> CONTROL LIST: Enabled
    property	alias	mVisible:           cbm.visible                 //   <=> CONTROL LIST: Visibled
    property	alias	mX:                 cbm.x                       //   <=> CONTROL LIST: Location(x)
    property	alias	mY:                 cbm.y                       //   <=> CONTROL LIST: Location(y)
    property	alias	mWidth:             cbm.width                   //   <=> CONTROL LIST: Size(Width)
    property	alias	mHeight:            cbm.height                  //   <=> CONTROL LIST: Size(Height)
    property	var	    mDataSource:        []                          // <=> CONTROL LIST: DataSource
    property	font	mFont                                           // <=> CONTROL LIST: mFont
    property	int     mDropDownStyle:     objDropDownStyle.mDropDown  // <=> CONTROL LIST: DropDownStyle
    property	int     mDropDownHeight:    200                         // <=> CONTROL LIST: DropDownHeight
    property	int     mItemHeight:        50                          // <=> CONTROL LIST: mItemHeight
    property	color	mBackColor:         'gray'                      // <=> CONTROL LIST: mBackColor
    property	color	mForeColor:         'black'                     // <=> CONTROL LIST: mForeColor
    property	int 	mDropDownWidth:     cbm.width                   // <=> CONTROL LIST:  DropDownWidth
    property	string	mText                                           // <=> CONTROL LIST: Text
    property	bool	mFormattingEnabled: true                        // <=> CONTROL LIST: FormattingEnabled
    property	int     mFormatString:      Text.AutoText               // <=> CONTROL LIST: FormatString
    property	bool	mRightToLeft:       false                       // <=> CONTROL LIST: mRightToLeft
    property	int 	mFlatStyle:         objFlatStyle.mFlat          // <=> CONTROL LIST: FlatStyle
    property	size    mMaximumSize:       Qt.size(0, 0)               // <=> CONTROL LIST: MaximumSize
    property	size    mMinimumSize:       Qt.size(0, 0)               // <=> CONTROL LIST: MinimumSize
    property	bool	mSorted:            false                       // <=> CONTROL LIST: Sorted
    property    int     mCursor:            Qt.ArrowCursor              // <=> CONTROL LIST: Cursor
    property	bool 	mUseWaitCursor:     false                       // <=> CONTROL LIST: UseWaitCursor
    property	bool    mCausesValidation:  true                        // <=> CONTROL LIST: CausesValidation
    property	int     mMaxLength:         8                           // <=> CONTROL LIST: MaxLength
    property	int 	mMaxDropDownItems:  0                           // <=> CONTROL LIST: MaxDropDownItems
    property	bool	mIntegralHeight:    true                        // <=> CONTROL LIST: IntegralHeight
    property	int     mAutoCompleteMode:          objAutoCompleteMode.mNone               //  <=> CONTROL LIST: AutoCompleteMode
    property	int 	mAutoCompleteSource:        objAutoCompleteSource.mNone             //  <=> CONTROL LIST: AutoCompleteSource
    property    var     mAutoCompleteCustomSource:  []                                      //  <=> CONTROL LIST: AutoCompleteCustomSource


    property    var     mItemHeightArray:           []                  //CreateNew : array Item Height
    property    var     mFontArray:                 []                  //CreateNew: array Font
    property    var     mForeColorArray:            []                  //CreateNew: array ForeColor
    property    var     mBackgroundArray:           []                  //CreateNew: array background

    signal validating()

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
              property bool isKeyPress: false

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
                  isKeyPress = true
              }
              onTextChanged: {
                  if(objPrivate.isComplete && isKeyPress){
                      //set max length
                      if(txtTextEdit.length > mMaxLength) {
                          txtTextEdit.maximumLength = mMaxLength
                      }

                      filter(txtTextEdit.text)
                      if(txtTextEdit.text !== '' && objPrivate.mResultFilter.length >0){
                          //Append
                          txtAppend.text = objPrivate.mResultFilter[0]
                          txtAppend.visible = true && objPrivate.isEnabledTextAppend
                          //Suggest
                          if(!objPrivate.isEnabledTextSuggest) return

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
                          txtAppend.visible = false && objPrivate.isEnabledTextAppend
                          //suggest
                          if(!objPrivate.isEnabledTextSuggest) return

                          pop.close()
                      }
                  }
                  else {
                      txtAppend.visible = false
                  }
                  //Validating
                  if(mCausesValidation){
                      validating()
                  }
                  //set default isKeyPress
                  isKeyPress = false
              }
          }

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
                       && objPrivate.isEnabledTextAppend
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
          height: {
              //set height special
              var tmpSize = mItemHeightArray.length
              var tmpIndex = index
              if(tmpSize >0){
                  while(tmpIndex >= tmpSize){
                      tmpIndex = tmpIndex - tmpSize
                  }
                  return mItemHeightArray[tmpIndex]
              }
              else {
                  return mItemHeight
              }
          }
          contentItem: Rectangle {
              anchors.fill: parent
              anchors.centerIn: parent
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

              Text{
                  text:modelData
                  anchors{
                    right: if(mRightToLeft) parent.right
                    left: if(!mRightToLeft) parent.left
                    verticalCenter: {
                        parent.verticalCenter
                    }
                  }
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
                          return cbm.font
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
                          return mForeColor
                      }
                  }
                  textFormat: cbm.mFormattingEnabled?cbm.mFormatString: undefined
              }
          }


          onClicked:
          {
              txtTextEdit.maximumLength = -1
//              cbm.currentIndex = index
//              lstView.currentIndex = index
          }
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

    MouseArea{
            anchors.fill: parent
            cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
            acceptedButtons: Qt.NoButton
        }

    Component.onCompleted: {
        mAutoCompleteCustomSource = mDataSource
        // MaxDropDownItems
        if(mMaxDropDownItems !== 0){
            mDropDownHeight = mItemHeight *(mMaxDropDownItems)
        }
        //mIntegralHeight
        if(mIntegralHeight){}

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
        property int mNone:             0
        property int mSuggest:          1
        property int mAppend:           2
        property int mSuggestAppend:    3
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
        property bool isEnabledTextAppend: mAutoCompleteMode === objAutoCompleteMode.mAppend
                                        || mAutoCompleteMode === objAutoCompleteMode.mSuggestAppend
        property bool isEnabledTextSuggest: mAutoCompleteMode === objAutoCompleteMode.mSuggest
                                        || mAutoCompleteMode === objAutoCompleteMode.mSuggestAppend
        property bool isKeyEnter: false
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
