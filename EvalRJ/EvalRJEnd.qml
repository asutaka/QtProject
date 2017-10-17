import QtQuick 2.0
import ControlApp 1.0
import CommonControl 1.0


Rectangle {
    id: evalRJEnd
    property alias objEvalRJEndVM: evalRJEndVM
    property int numID: 2

    width: 1024
    height: 640
    color: "black"
    border.width: 3
    EvalRJVM {
        id:evalRJEndVM
    }
    Text {
        id: text1
        x: 22
        y: 21
        width: 311
        height: 29
        text: "判定・選別確認が完了しました。"
        font.pixelSize: 20
        color:"white"
    }

    Rectangle {
        width: 606
        height: 540
        x: 352
        y: 60

        TK_DataGridView {
            anchors.fill: parent
            mReadOnly: true
            mEnabled: false
            mRowHeight: 25
            mRowFont.pixelSize: 13
            mHeaderFont.pixelSize: 15
            mColHeaderWidth: 0
            mSelectionMode: EnumControl.SELECTION_MODE_FULL_ROW_SELECT
            mHorizontalScrollBar: Qt.ScrollBarAlwaysOff
            mVerticalScrollBar: Qt.ScrollBarAlwaysOff
            mArrColWidth: [46,50,170,170,70,100]
            mArrColName: ["No.","ライン","判定基準","詳細","結果","測定値"]
            mDataSource: modelItem
        }
    }

    ListModel {
        id: modelItem
        ListElement {
            strText:'1'
            strText1:'1'
            strText2:'OK'
            strText3:''
            strText4:'✓'
            strText5:'30.01g'
        }
        ListElement {
            strText:'2'
            strText1:'1'
            strText2:'＋NG'
            strText3:'+0.5g'
            strText4:'✓'
            strText5:'35.53g'
        }
        ListElement {
            strText:'3'
            strText1:'1'
            strText2:'－NG'
            strText3:'-0.5g'
            strText4:'✓'
            strText5:'29.04g'
        }
        ListElement {
            strText:'4'
            strText1:'1'
            strText2:'異物NG'
            strText3:'Φ 0.5'
            strText4:'✓'
            strText5:'1.23'
        }
        ListElement {
            strText:'5'
            strText1:'1'
            strText2:'異物NG'
            strText3:'Φ 0.7'
            strText4:'✓'
            strText5:'1.45'
        }
        ListElement {
            strText:'6'
            strText1:'1'
            strText2:'かみこみNG'
            strText3:'テスト品1'
            strText4:'✓'
            strText5:'-'
        }
        ListElement {
            strText:'7'
            strText1:'1'
            strText2:'割れNG'
            strText3:'テスト品2'
            strText4:'✓'
            strText5:'-'
        }
        ListElement {
            strText:'8'
            strText1:'1'
            strText2:'欠けNG'
            strText3:'テスト品3'
            strText4:'✓'
            strText5:'-'
        }
        ListElement {
            strText:'9'
            strText1:'1'
            strText2:'欠品NG'
            strText3:'テスト品4'
            strText4:'✓'
            strText5:'-'
        }
        ListElement {
            strText:'10'
            strText1:'1'
            strText2:'領域外NG'
            strText3:'テスト品5'
            strText4:'✓'
            strText5:'-'
        }
        ListElement {
            strText:'11'
            strText1:''
            strText2:''
            strText3:''
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'12'
            strText1:''
            strText2:''
            strText3:''
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'13'
            strText1:''
            strText2:''
            strText3:''
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'14'
            strText1:''
            strText2:''
            strText3:''
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'15'
            strText1:''
            strText2:''
            strText3:''
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'16'
            strText1:''
            strText2:''
            strText3:''
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'17'
            strText1:''
            strText2:''
            strText3:''
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'18'
            strText1:''
            strText2:''
            strText3:''
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'19'
            strText1:''
            strText2:''
            strText3:''
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'20'
            strText1:''
            strText2:''
            strText3:''
            strText4:''
            strText5:''
        }
    }

    Rectangle {
        id: rectangle1
        x: 22
        y: 60
        width: 311
        height: 100
        color: "limegreen"
        border.width: 1
        border.color: "white"

        Text {
            id: text2
            x: 91
            y: 14
            text: qsTr("成功")
            font.family: "Arial"
            font.pixelSize: 65
            color: "white"
        }
    }
    Component.onCompleted: {
        evalRJEndVM.onLoad();
    }
}

