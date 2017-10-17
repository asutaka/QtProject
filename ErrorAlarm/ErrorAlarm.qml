import QtQuick 2.0
import QtQuick.Controls 1.4
import CommonControl 1.0
import ControlApp 1.0

Item {
    id: errorAlarmScreen
    width: 1024
    height: 704
    property string reason:             ""
    property string solution:           ""

    Rectangle{
        anchors.fill: parent
        color: "whitesmoke"
        
        TK_Label {
            id: lbDateTime
            x: 565
            y: 19
            width: 266
            height: 32
            mBackColor: "lightgray"
            mText: qsTr("2017-07-19 17:31:45")
            mFont.pixelSize: 20
            mTextAlignV: Text.AlignVCenter
            mPadding: 2
            mLeftPadding: 20
        }
        
        TK_Label {
            id: lbSNo
            x: 293
            y: 19
            width: 266
            height: 32
            mBackColor: "lightgray"
            mText: qsTr("SN: 123456")
            mFont.pixelSize: 20
            mTextAlignV: Text.AlignVCenter
            mLeftPadding: 2
        }
        
        TK_Label {
            id: rectangle5
            x: 22
            y: 19
            width: 265
            height: 32
            mBackColor: "lightgray"
            mText: qsTr("形名： KWS6033FP06")
            mFont.pixelSize: 20
            mTextAlignV: Text.AlignVCenter
            mLeftPadding: 2
        }
        
        TK_Button {
            id: btnPageUp
            x: 940
            y: 62
            width: 68
            height: 59
            mBackgroundImage: pressed ? "qrc:/Images/scroll_pageup_on.png" : "qrc:/Images/scroll_pageup_off.png"
            mForeColor: "white"
            mBackColor: "transparent"
            mBorderColor: "transparent"
            mBorderWidth: 0

            onClicked: scrollContent.flickableItem.contentY = 0
        }

        TK_Button {
            id: btnLineUp
            x: 940
            y: 127
            width: 68
            height: 59
            mBackgroundImage: pressed ? "qrc:/Images/scroll_lineup_on.png" : "qrc:/Images/scroll_lineup_off.png"
            mForeColor: "white"
            mBackColor: "transparent"
            mBorderColor: "transparent"
            mBorderWidth: 0

            onClicked: {
                if(scrollContent.flickableItem.contentY > 0){
                    scrollContent.flickableItem.contentY -= 10;
                }
            }
        }

        TK_Button {
            id: btnPageDown
            x: 940
            y: 496
            width: 68
            height: 59
            mBackgroundImage: pressed ? "qrc:/Images/scroll_pagedown_on.png" : "qrc:/Images/scroll_pagedown_off.png"
            mForeColor: "white"
            mBackColor: "transparent"
            mBorderColor: "transparent"
            mBorderWidth: 0

            onClicked: {
                  scrollContent.flickableItem.contentY = scrollContent.contentItem.height - scrollContent.flickableItem.height;
            }
        }

        TK_Button {
            id: btnLineDown
            x: 940
            y: 431
            width: 68
            height: 59
            mBackgroundImage: pressed ? "qrc:/Images/scroll_linedown_on.png" : "qrc:/Images/scroll_linedown_off.png"
            mForeColor: "white"
            mBackColor: "transparent"
            mBorderColor: "transparent"
            mBorderWidth: 0

            onClicked: {
                if(scrollContent.flickableItem.contentY < scrollContent.contentItem.height - scrollContent.flickableItem.height){
                    scrollContent.flickableItem.contentY += 10;
                }
            }
        }

        ScrollView {
            id: scrollContent
            x: 22
            y: 62
            width: 903
            height: 493
            verticalScrollBarPolicy: Qt.ScrollBarAlwaysOff
            horizontalScrollBarPolicy: Qt.ScrollBarAlwaysOff

            Rectangle {
                id: rectContent
                width: col.width + 20
                height: col.height + 20
                radius: 3
                color: "lightgray"

                Column {
                    id: col
                    x: 10
                    y: 10
                    spacing: 10

                    TK_Label {
                        id: lbReason
                        mText: qsTr("発生原因：")
                        mFont.pixelSize: 20
                        mAutoSize: true
                        mBackColor: "transparent"
                    }

                    Rectangle {
                        id: rectReason
                        width: 866
                        height: childrenRect.height
                        color: "#ffffff"

                        TK_Label {
                            id: txtReason
                            mText: reason
                            mWrap: Text.WordWrap
                            mFont.pixelSize: 20
                            mAutoSize: true
                            mMinimumSize: Qt.size(484, 159)
                            mMaximumSize: Qt.size(484, 999)
                            mPadding: 10
                        }

                        TK_PictureBox {
                            id: imgReason
                            x: 498
                            y: 8
                            width: 360
                            height: 159
                            mImage: "qrc:/Images/ErrorImage.png"
                            mBackgroundImageLayout: Image.Stretch
                        }
                    }

                    TK_Label {
                        id: lbSolution
                        mAutoSize: true
                        mText: qsTr("対処方法：")
                        mFont.pixelSize: 20
                        mBackColor: "transparent"
                    }

                    Rectangle {
                        id: rectSolution
                        width: 866
                        height: childrenRect.height
                        color: "#ffffff"

                        TK_Label {
                            id: txtSolution
                            mBackColor: "transparent"
                            mWrap: Text.WordWrap
                            mText: solution
                            mFont.pixelSize: 20
                            mMinimumSize: Qt.size(484, 207)
                            mMaximumSize: Qt.size(484, 999)
                            mAutoSize: true
                        }

                        TK_PictureBox {
                            id: imgSolution
                            x: 498
                            y: 8
                            width: 360
                            height: 159
                            mBackColor: "transparent"
                        }
                    }
                }
            }
        }

        Rectangle {
            id: rectLineNo
            x: 22
            y: 568
            width: 374
            height: 121
            color: "#c5fef6"
            radius: 15
            border.color: "#ffffff"
            border.width: 5

            TK_Label {
                id: lbLine
                x: 19
                y: 14
                mText: qsTr("異常発生ライン")
                mFont.pixelSize: 20
                mFont.family: "Arial"
            }

            Row{
                anchors.left: parent.left
                anchors.leftMargin: 35
                anchors.top: parent.top
                anchors.topMargin: 37
                spacing: 33
                TK_PictureBox {mImage: "qrc:/Images/Number_w21h27_01_Er.png"; width: 21; height: 27; mBackColor: "transparent"}
                TK_PictureBox {mImage: "qrc:/Images/Number_w21h27_02_Er.png"; width: 21; height: 27; mBackColor: "transparent"}
                TK_PictureBox {mImage: "qrc:/Images/Number_w21h27_03_Er.png"; width: 21; height: 27; mBackColor: "transparent"}
                TK_PictureBox {mImage: "qrc:/Images/Number_w21h27_04_Er.png"; width: 21; height: 27; mBackColor: "transparent"}
                TK_PictureBox {mImage: "qrc:/Images/Number_w21h27_05_Er.png"; width: 21; height: 27; mBackColor: "transparent"}
                TK_PictureBox {mImage: "qrc:/Images/Number_w21h27_06_Er.png"; width: 21; height: 27; mBackColor: "transparent"}
            }
        }

        TK_Button {
            id: buttonMute
            x: 690
            y: 629
            width: 151
            height: 60
            mText: qsTr("音消し")
            mBackgroundImage: pressed ? "qrc:/Images/btn_touched_180_40.png" : "qrc:/Images/btn_180_40.png"
            mForeColor: "white"
            mBackColor: "transparent"
            mBorderColor: "transparent"
            mBorderWidth: 0
            mFont.pixelSize: 20
            mTextAlign: 4
//            mTextAlignH: Text.AlignHCenter
//            mTextAlignV: Text.AlignVCenter
            mImage: "qrc:/Images/buzzer.png"
            mImageAlign: 3
            mLeftPadding: 10
        }

        TK_Button {
            id: buttonClose
            x: 859
            y: 629
            width: 151
            height: 60
            mText: qsTr("閉じる")
            mBackgroundImage: pressed ? "qrc:/Images/btn_touched_180_40.png" : "qrc:/Images/btn_180_40.png"
            mForeColor: "white"
            mBackColor: "transparent"
            mBorderColor: "transparent"
            mBorderWidth: 0
            mFont.pixelSize: 20
//            mTextAlignH: Text.AlignHCenter
//            mTextAlignV: Text.AlignVCenter
            mTextAlign: 4

            onClicked: {
                appWindow.closeDialog()
            }
        }
    }

    Component.onCompleted: {
        reason = qsTr("累積ゼロ補正量がゼロNG1パラメータの設定値を超えました。\n以下の要因が考えられます。\n①秤量台が汚れている。あるいは、粉体の体積がある。\n②秤ユニットが故障している。
                        \n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。
                        \n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。
                        \n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。\n②秤ユニットが故障している。")
        solution = "以下の対処によりエラーを解除できない場合は、サービスマンを呼んでください。\n①秤量台が汚れていないか確認する。また、粉体が堆積していないか確認する。"

    }
}
