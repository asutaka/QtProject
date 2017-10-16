import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Controls.Styles 1.4

CheckBox {
    id: checkBox

    //    property	alias	id:                     Not customize   <=> CONTROL LIST: Name
    //    property	alias	enabled:                Not customize   <=> CONTROL LIST: Enabled
    //    property	alias	visible:                Not customize   <=> CONTROL LIST: Visibled
    //    property	alias	checked:                Not customize   <=> CONTROL LIST: Checked
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
    //    property  alias   checkState              Not customize   <=> CONTROL LIST: CheckState
    //    property  alias   tristate                Not customize   <=> CONTROL LIST: ThreeState

    //    property	bool 	mGeneratemember         Not used        <=> CONTROL LIST: Generatemember
    //    property	bool	mLocked                 Not used        <=> CONTROL LIST: Locked
    //    property	var 	mModifiers              Not used        <=> CONTROL LIST: Modifiers
    //    property	bool	mCausesValidation       Not used        <=> CONTROL LIST: CausesValidation
    //    property	bool	mAllowDrop              Not used        <=> CONTROL LIST: AllowDrop
    //    property	bool	mAutoCheck              Not used        <=> CONTROL LIST: AutoCheck
    //    property	bool	mAutoSize               Not used        <=> CONTROL LIST: AutoSize
    //    property	int 	mDock                   Not used        <=> CONTROL LIST: Dock
    //    property	var 	mImageKey               Not used        <=> CONTROL LIST: ImageKey
    //    property	var 	mImageList              Not used        <=> CONTROL LIST: ImageList
    //    property	var 	mPadding                Not used        <=> CONTROL LIST: Padding
    //    property	alias	mFlatAppearance         Not used        <=> CONTROL LIST: FlatAppearance
    //    property	alias	mUseWaitCursor          Not used        <=> CONTROL LIST: UseWaitCursor
    //    property	alias	mRightToLeft            Not used        <=> CONTROL LIST: RightToLeft
    //    property	alias	mImageIndex             Not used        <=> CONTROL LIST: ImageIndex
    //    property	var     mCheckAlign             Not used        <=> CONTROL LIST: CheckAlign
    //    property	var     mTextImageRelation      Not used        <=> CONTROL LIST: TextImageRelation

    property	var         mMaximumSize:           Qt.size(0, 0)                           // <=> CONTROL LIST: MaximumSize
    property	var         mMinimumSize:           Qt.size(0, 0)                           // <=> CONTROL LIST: MinimumSize
    property	bool        mAppearance:            false                                   // <=> CONTROL LIST: Appearance
    property	alias       mBackColor:             backRect.color                          // <=> CONTROL LIST: BackColor
    property	alias       mBackgroundImage:       backImage.source                        // <=> CONTROL LIST: BackgroundImage
    property	alias       mBackgroundImageLayout: backImage.fillMode                      // <=> CONTROL LIST: BackgroundImageLayout
    property	bool        mFlatStyle:             true                                    // <=> CONTROL LIST: FlatStyle
    property	alias       mFont:                  name.font                               // <=> CONTROL LIST: Font
    property	alias       mForeColor:             name.color                              // <=> CONTROL LIST: ForeColor
    property	alias       mText:                  name.text                               // <=> CONTROL LIST: Text
    property	alias       mTextAlignH:            name.horizontalAlignment                // <=> CONTROL LIST: TextAlign
    property	alias       mTextAlignV:            name.verticalAlignment                  // <=> CONTROL LIST: TextAlign
    property	alias       mImage:                 contentImg.source                       // <=> CONTROL LIST: Image
    property	alias       mImageAlignH:           contentImg.horizontalAlignment          // <=> CONTROL LIST: ImageAlign
    property	alias       mImageAlignV:           contentImg.verticalAlignment            // <=> CONTROL LIST: ImageAlign
    property    string      imgCheckOffSrc:         "checkBox_off.png"                      // create newly
    property    string      imgCheckOnSrc:          "checkBox_on.png"                       // create newly
    property    string      imgCheckBarSrc:         "checkBox_bar.png"                      // create newly
    property    alias       wrapText:               name.wrapMode                           // create newly
    property    alias       mAutoEllipsis:          name.elide                              // <=> CONTROL LIST: AutoEllipsis

    indicator: Item {
        id: indicatorItem
        width: parent.height
        height: parent.height
        visible: !mAppearance

        Rectangle {
            id: indicatorRect
            anchors.fill: parent
            anchors.margins: 2
            border.color: "gray"
            border.width: 2
            visible: mFlatStyle

            Text {
                id: check
                anchors.fill: parent
                anchors.margins: 5
                text: qsTr("✓")
                visible: (((checkBox.tristate === false) && (checkBox.checked))|| ((checkBox.tristate === true)  && (checkBox.checkState === Qt.Checked)))
                color: "#555"
            }

            Text {
                id: bar
                anchors.fill: parent
                anchors.margins: 5
                text: qsTr("―")
                visible: ((checkBox.tristate === true) && (checkBox.checkState === Qt.PartiallyChecked))
                color: "#555"
            }
        }

        Image {
            id: indicatorImage_noChecked
            anchors.fill: parent
            visible: !mFlatStyle
            source: imgCheckOffSrc
        }

        Image {
            id: indicatorImage_checked
            anchors.fill: parent
            visible: (!mFlatStyle &&
                      (((checkBox.tristate === false) && (checkBox.checked))
                    || ((checkBox.tristate === true)  && (checkBox.checkState === Qt.Checked))))
            source: imgCheckOnSrc
        }

        Image {
            id: indicatorImage_partiallyChecked
            anchors.fill: parent
            visible: (!mFlatStyle &&
                      ((checkBox.tristate === true) && (checkBox.checkState === Qt.PartiallyChecked)))
            source: imgCheckBarSrc
        }
    }

    contentItem: Text {
        id: name
        anchors.fill: parent
        anchors.rightMargin: 5
        anchors.leftMargin: indicator.width
        text: "Check Box"

        Image {
            id: contentImg
            anchors.fill: parent
        }
    }

    background: Rectangle {
        id: backRect
        anchors.fill: parent

        Image {
            id: backImage
            anchors.fill: parent
        }

        ToolButton {
            id: backButton
            anchors.fill: parent
            visible: mAppearance
        }
    }

}

