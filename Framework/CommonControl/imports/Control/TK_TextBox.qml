import QtQuick 2.5
import QtGraphicalEffects 1.0
//import QtQuick.Controls 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: textBox

    //    property	alias	id:                             Not customize   <=> CONTROL LIST: Name
    //    property	alias	enabled:                        Not customize   <=> CONTROL LIST: Enabled
    //    property	alias	visible:                        Not customize   <=> CONTROL LIST: Visibled
    //    property	alias	anchors.top:                    Not customize   <=> CONTROL LIST: Anchors(Top)
    //    property	alias	anchors.bottom:                 Not customize   <=> CONTROL LIST: Anchors(Bottom)
    //    property	alias	anchors.right:                  Not customize   <=> CONTROL LIST: Anchors(Right)
    //    property	alias	anchors.left:                   Not customize   <=> CONTROL LIST: Anchors(Left)
    //    property	alias	x:                              Not customize   <=> CONTROL LIST: Location(x)
    //    property	alias	y:                              Not customize   <=> CONTROL LIST: Location(y)
    //    property	alias	width:                          Not customize   <=> CONTROL LIST: Size(Width)
    //    property	alias	height:                         Not customize   <=> CONTROL LIST: Size(Height)
    //    property	alias	anchors.margins:                Not customize   <=> CONTROL LIST: Margin(All)
    //    property	alias	anchors.leftMargin:             Not customize   <=> CONTROL LIST: Margin(Left)
    //    property	alias	anchors.rightMargin:            Not customize   <=> CONTROL LIST: Margin(Right)
    //    property	alias	anchors.topMargin:              Not customize   <=> CONTROL LIST: Margin(Top)
    //    property	alias	anchors.bottomMargin:           Not customize   <=> CONTROL LIST: Margin(Bottom)

    //    property	bool 	mAutoCompleteCustomSource       Not used        <=> CONTROL LIST: AutoCompleteCustomSource
    //    property	bool	mGeneratemember                 Not used        <=> CONTROL LIST: Generatemember
    //    property	bool	mLocked                         Not used        <=> CONTROL LIST: Locked
    //    property  alias   mModifiers                      Not used        <=> CONTROL LIST: Modifiers
    //    property  alias   mAllowDrop                      Not used        <=> CONTROL LIST: AllowDrop
    //    property  alias   mImeMode                        Not used        <=> CONTROL LIST: ImeMode
    //    property  alias   mDock                           Not used        <=> CONTROL LIST: Dock
    //    proprerty alias   mCalendarDimensions             Not used        <=> CONTROL LIST: CalendarDimensions

    property    color   mBackColor:             "#fff"                          //  <=> CONTROL LIST: BackColor
    property    bool    mReadOnly:              false                           //  <=> CONTROL LIST: ReadOnly
    property    bool    mUseSystemPasswordChar: false                           //  <=> CONTROL LIST: UseSystemPasswordChar
    property    string  mPasswordChar:          ''                              //  <=> CONTROL LIST: PasswordChar
    property    bool    mMultiline:             false                           //  <=> CONTROL LIST: Multiline

    property    bool    mWordWrap:              false                           //  <=> CONTROL LIST: WordWrap
    property    size    mMaximumSize:           Qt.size(1000, 1000)             //  <=> CONTROL LIST: MaximumSize
    property    size    mMinimumSize:           Qt.size(0, 0)                   //  <=> CONTROL LIST: MinimumSize
    property    int     mMaxLength:             999                             //  <=> CONTROL LIST: MaxLenght
    property    size    mSize:                  Qt.size(10, 10)                 //  <=> CONTROL LIST: Size
    property    string  mText:                  ""                              //  <=> CONTROL LIST: Text
    property    font    mFont                                                   //  <=> CONTROL LIST: Font
    property    color   mForeColor:             "#000"                          //  <=> CONTROL LIST: ForeColor
    property    var     mLines:                 []                              //  <=> CONTROL LIST: Lines
    property    int     mCursor:                Qt.ArrowCursor                          //  <=> CONTROL LIST: Cursor
    property    bool    mUseWaitCursor:         false                                   //  <=> CONTROL LIST: UseWaitCursor
    property    int     mBorderStyle:           borderStyle.mFixed3D                    //  <=> CONTROL LIST: BorderStyle
    property    var     mCausesValidation:      RegExpValidator { regExp: /.*/ }        //  <=> CONTROL LIST: CausesValidation
    property    bool    mAcceptsReturn:         false                                   //  <=> CONTROL LIST: AcceptsReturn
    property    int mCharacterCasing:               objCharacterCasing.mNormal          //  <=> CONTROL LIST: CharacterCasing
    property	int     mAutoCompleteMode:          autoCompleteMode.mNone              //  <=> CONTROL LIST: AutoCompleteMode
    property	int 	mAutoCompleteSource:        autoCompleteSource.mNone            //  <=> CONTROL LIST: AutoCompleteSource
    property    var     mAutoCompleteCustomSource:  []                                  //  <=> CONTROL LIST: AutoCompleteCustomSource

    property    int     mScrollBarVPolicy:          Qt.ScrollBarAsNeeded                //  <=> Create newly
    property    int     mScrollBarHPolicy:          Qt.ScrollBarAsNeeded                //  <=> Create newly
    property    color   mScrollbarColor:            "#F69642"                           //  <=> Create newly
    property    real    mScrollBarLeftMargin:       5                                   //  <=> Create newly
    property    real    mScrollBarRightMargin:      0                                   //  <=> Create newly
    property    real    mScrollBarTopMargin:        2                                   //  <=> Create newly
    property    real    mScrollBarBottomMargin:     2                                   //  <=> Create newly
    property    bool    mDecrementScrollBar:        false                               //  <=> Create newly
    property    bool    mIncrementScrollBar:        false                               //  <=> Create newly
    property    int     mTextAlignH:                Qt.AlignLeft | Qt.AlignHCenter      //  <=> Create newly
    property    int     mTextAlignV:                Qt.AlignTop | Qt.AlignVCenter       //  <=> Create newly
    property    color   mBorderColor:               "black"                             //  <=> Create newly
    property    int     mBorderWidth:               1                                   //  <=> Create newly
    property    var     mResultFilter:              []
    property    string  textAutoComplete
    readonly property   int  mLineCount:            textField.visible ? 1 : textArea.lineCount  //  <=> Create newly



    signal textInputChanged()
    color: mBackColor

    // Border Style Option
    QtObject {
        id: borderStyle
        property int mNone: 1
        property int mFixedSingle: 2
        property int mFixed3D: 3
    }

    QtObject {
        id: autoCompleteMode
        property int mNone:             1
        property int mSuggest:          2
        property int mAppend:           3
        property int mSuggestAppend:    4
    }

    QtObject {
        id: autoCompleteSource
        property int mNone:             1
        property int mCustomSource:     2
    }

    QtObject {
        id: objCharacterCasing
        property int mNormal: 0
        property int mUpper: 1
        property int mLower: 2
    }

    // Singleline TextBox
    TextField  {
        id: textField
        font: mFont
        readOnly: mReadOnly
        anchors.fill: parent
        visible: !mMultiline
        maximumLength : mMaxLength
        validator: mCausesValidation
        verticalAlignment: mTextAlignV
        horizontalAlignment: mTextAlignH
        text: mLines.length > 0 ? linesToString() : mText


        // Single Line TextBox Background
        style: TextFieldStyle {
            textColor: mForeColor
            passwordCharacter: {
                if(mUseSystemPasswordChar){ return '' }
                (mPasswordChar !== '')?mPasswordChar:''
            }
            background: Rectangle {
                id: __rect
                color: mBackColor
                anchors.fill: parent
                border.color: mBorderColor

                layer.effect: DropShadow {
                    verticalOffset: -1
                    horizontalOffset: -1
                    transparentBorder: true
                }

                Component.onCompleted: {
                    switch (mBorderStyle) {
                        case borderStyle.mNone:
                            __rect.border.width = 0
                            __rect.layer.enabled = false
                            break
                        case borderStyle.mFixedSingle:
                            __rect.layer.enabled = false
                            __rect.border.width = mBorderWidth
                            break
                        case borderStyle.mFixed3D:
                            __rect.border.width = 0
                            __rect.layer.enabled = true
                            break
                        default:
                            break
                    }
                }
            }
        }

        // Single Line TextBox Display Mode
        echoMode: {
            if (mUseSystemPasswordChar || mPasswordChar !== '') {
                return TextInput.Password
            }
            else {
                return TextInput.Normal
            }
        }

        onTextChanged: {
            textInputChanged()
            filter(textField.text)
            if(textField.text == ""){
                suggestView.visible = false
            } else if(suggestView !== null){
                suggestView.model = mResultFilter
                suggestView.visible = true
            }
        }

        Keys.onPressed: {
            if(event.key === Qt.Key_Down) {
                suggestView.focus = true
            }
        }

        // Add Lines to String
        function linesToString() {
            return mLines.join(" ")
        }

        //Filter of autoComplete suggest
        function filter(value) {
            mResultFilter.length = 0
            for(var i = 0; i < mAutoCompleteCustomSource.length; i ++) {
                if(mAutoCompleteCustomSource[i].indexOf(value) === 0) {
                    mResultFilter.push(mAutoCompleteCustomSource[i])
                }
            }
        }
    }

Rectangle{
    id: tmp
    width: !tmp.children ? 0 : childrenRect.width
    height: !tmp.children ? 0:childrenRect.height
    color:"white"
    anchors.top: textField.bottom
    anchors.left: textField.left
    border.color: "gray"

    ListView {
        id: suggestView

        z: 100
        width: textField.width
        height: Math.min(childrenRect.height, 300)
        clip: true
        model: mResultFilter
        highlightFollowsCurrentItem: true
        highlight: Rectangle {
            color: "lightsteelblue"
            Behavior on y { SpringAnimation { spring: 3; damping: 0.2} }
        }

        delegate: Text {
            anchors.margins: 2
            elide: Text.ElideRight
            color: "black"
            text: modelData
            width: parent.width

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    suggestView.currentIndex = index
                    textAutoComplete = suggestView.currentItem.text
                }
            }
            Keys.onPressed: {
                if(event.key === Qt.Key_Down) {
                    console.log("CurrentIndex: Down: " + suggestView.currentIndex)
                } else if(event.key === Qt.Key_Up) {
                    console.log("CurrentIndex: Up: " + suggestView.currentIndex)
                } else if(event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                    suggestView.currentIndex = index
                    textAutoComplete = suggestView.currentItem.text
                }
            }
        }


    }
}

    onTextAutoCompleteChanged: {
        textField.text = textAutoComplete
        suggestView.model = null
    }

    // Multiline TextBox
    TextArea {
        id: textArea
        font: mFont
        readOnly: mReadOnly
        visible: mMultiline
        anchors.fill: parent
        verticalAlignment: mTextAlignV
        horizontalAlignment: mTextAlignH
        text: mLines.length > 0 ? linesToString() : mText

        layer.effect: DropShadow {
            verticalOffset: -1
            horizontalOffset: -1
            transparentBorder: true
        }


        Keys.onPressed: {
            if (event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                event.accepted = !mAcceptsReturn
            }
        }

        // Multi Line TextBox Background
        style: TextAreaStyle  {
            backgroundColor: mBackColor

            // Scrollbar Styles
            handle: Item {
                implicitWidth: mSize.width
                implicitHeight: mSize.height

                Rectangle {
                    color: mScrollbarColor
                    anchors.fill: parent
                    anchors.leftMargin: mScrollBarLeftMargin
                    anchors.topMargin: mScrollBarTopMargin
                    anchors.bottomMargin: mScrollBarBottomMargin
                    anchors.rightMargin: mScrollBarRightMargin
                }
            }

            // Visible Decrement Control
            decrementControl: Rectangle {
                visible: mDecrementScrollBar
            }

            // Visible Increment Control
            incrementControl: Rectangle {
                visible: mIncrementScrollBar
            }
        }

        // Set Max Length Text in TextBox
        onTextChanged: {
            textInputChanged()
            if (textArea.text.length > mMaxLength) {
                textArea.text = textArea.text.substring(0, mMaxLength)
                textArea.cursorPosition = mMaxLength
            }
        }

        Component.onCompleted: {
            wrapMode = mWordWrap ? TextEdit.WordWrap : TextEdit.NoWrap
            switch (mBorderStyle) {
                case borderStyle.mNone:
                case borderStyle.mFixedSingle:
                    textArea.layer.enabled = false
                    break
                case borderStyle.mFixed3D:
                    textArea.layer.enabled = true
                    break
                default:
                    break
            }
        }

        // Add Lines to String
        function linesToString() {
            return mLines.join("\n")
        }
    }

    // Set TextBox Width, Height
    Component.onCompleted: {
        textBox.width = getComponentWidth()
        textBox.height = getComponentHeight()
        //CharacterCasing
        characterCasing()
    }

    //CharacterCasing
    function characterCasing(){
        switch(mCharacterCasing){
            case objCharacterCasing.mUpper:
                mFont.capitalization = Font.AllUppercase
                break
            case objCharacterCasing.mLower:
                mFont.capitalization = Font.AllLowercase
                break
            default:
                break
        }
    }

    // Get TextBox Width
    function getComponentWidth() {
        if (textBox.width > mMaximumSize[0]) return mMaximumSize[0]
        if (textBox.width < mMinimumSize[0]) return mMinimumSize[0]
        return textBox.width
    }

    // Get TextBox Height
    function getComponentHeight() {
        if (textBox.height > mMaximumSize[1]) return mMaximumSize[1]
        if (textBox.height < mMinimumSize[1]) return mMinimumSize[1]
        return textBox.height
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: mUseWaitCursor ? Qt.WaitCursor : mCursor
        acceptedButtons: Qt.NoButton
    }
}
