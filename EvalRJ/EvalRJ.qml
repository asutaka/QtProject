import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import ControlApp 1.0
import CommonControl 1.0

Rectangle {
    id: evalRJ
    property alias objEvalRJVM: evalRJVM
    property int numID: 1

    width: 1024
    height: 640
    color: "black"
    EvalRJVM {
        id:evalRJVM
    }
    Text {
        id: text1
        x: 22
        y: 21
        width: 311
        height: 75
        text: "下記サンプルを流してください。"
        font.pixelSize: 20
        color:"white"
    }

    TK_TabControl {
        id: tabControl1
        x: 352
        y: 21
        mTabWidth: 606
        mTabHeight: 580
        mItemSize: Qt.size(100,20)
        mPadding: [5, 5]
        Component.onCompleted: {
            addTab("確認項目", tab1)
            addTab("透過画像", tab2)
            objPrivate.gridView = tabControl1.objTabView.getTab(0).item
        }
        Component {
            id: tab2
            Rectangle{
                color:"white"
                Image{
                    source: "qrc:/Images/NG1.png"
                }
            }
        }

        Component {
            id: tab1

            TK_DataGridView {
                id: grid

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
                onItemOutput: {
                    objPrivate.itemOutput = item
                }
            }
        }

    }

    Rectangle {
        id: rectangle1
        x: 22
        y: 60
        width: 311
        height: 100
        color: "gray"
        border.width: 3
        border.color: "lightgrey"

        Text {
            id: text2
            anchors.centerIn: parent
            text:(objPrivate.itemOutput.length > 0)?qsTr(objPrivate.itemOutput[2]+"品"):""
            font.family: "Arial"
            font.pixelSize: 45
            color: "powderblue"
        }
    }

    ListModel {
        id: modelItem
        ListElement {
            strText:'1'
            strText1:'1'
            strText2:'OK'
            strText3:''
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'2'
            strText1:'1'
            strText2:'＋NG'
            strText3:'+0.5g'
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'3'
            strText1:'1'
            strText2:'－NG'
            strText3:'-0.5g'
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'4'
            strText1:'1'
            strText2:'異物NG'
            strText3:'Φ 0.5'
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'5'
            strText1:'1'
            strText2:'異物NG'
            strText3:'Φ 0.7'
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'6'
            strText1:'1'
            strText2:'かみこみNG'
            strText3:'テスト品1'
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'7'
            strText1:'1'
            strText2:'割れNG'
            strText3:'テスト品2'
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'8'
            strText1:'1'
            strText2:'欠けNG'
            strText3:'テスト品3'
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'9'
            strText1:'1'
            strText2:'欠品NG'
            strText3:'テスト品4'
            strText4:''
            strText5:''
        }
        ListElement {
            strText:'10'
            strText1:'1'
            strText2:'領域外NG'
            strText3:'テスト品5'
            strText4:''
            strText5:''
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

    QtObject {
        id: objPrivate
        property bool isNextScreen: false
        property Item gridView
        property var itemOutput: []
        property int count: 0
    }
    Component.onCompleted: {
        evalRJVM.onLoad();
    }
    function nextRow(){
        //        if(objPrivate.gridView.mCurrentRow < modelItem.count-1){
        if(objPrivate.gridView.mCurrentRow < 9){
            objPrivate.gridView.mCurrentRow++
        }
        //        else if(objPrivate.gridView.mCurrentRow === modelItem.count-1){
        else if(objPrivate.gridView.mCurrentRow === 9){
            objPrivate.gridView.mCurrentRow = -1
            objPrivate.isNextScreen = true
        }
        return objPrivate.isNextScreen
    }
}
