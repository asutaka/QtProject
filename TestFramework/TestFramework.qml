import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import ControlApp 1.0
import CommonControl 1.0
import CommonModule 1.0
import QtQml.Models 2.2

Item {
    property alias testFramework : testFrameworkItem
    property alias directConnection: directConnectionObject
    property alias drawableControl: testDrawableControl

    id: testFrameworkScreen
    x: 0
    y: 0
    width: 1024
    height: 640

    DirectConnection {
        id: directConnectionObject
    }

    TestFramework {
        id: testFrameworkItem
    }

    ListModel {
        id: modelItem
        ListElement {
            strText:'Item0'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item1'
            strText2:'Item2'
        }
        ListElement {
            strText:'Item1'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item2'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item3'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item4'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item5'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item6'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item7'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item8'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item8'
            strText2:'Item8'
        }
        ListElement {
            strText:'Item0'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item1'
            strText2:'Item2'
        }
        ListElement {
            strText:'Item1'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item2'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item3'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item4'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item5'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
        ListElement {
            strText:'Item6'
            imgSrc:"image://MyProvider/zeroset_discrmark.png"
            strText1:'Item0'
            strText2:'Item0'
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "lightblue"

//        TK_DataGridView {
//            id: dataGridView

//            mWidth:  500
//            mHeight: 400
//            mRowHeight: 100
////            mArrColWidth: [150, 250]
////            mArrColName: ["col1","col2"]
//            mShowCellErrors: true
//            mShowRowErrors: true
//            mShowCellToolTips: false
//            mShowEditingIcon: false
//            mDataSource: modelItem

//            onToolTipEvent:
//            {

//            }
//            onErrorEvent:
//            {
//                if(item0.text.length > 50)
//                {
//                    msgError = "string too long"
//                    traceError(item0,item1,item2,msgError)
//                }
//                if(item0.text.length === 0 && dataGridView.currentColumn !== 0)
//                {
//                    msgError = "string not null"
//                    traceError(item0,item1,item2,msgError)
//                }
//            }
//        }


//        TK_ListView {
//            id: listView1
//            x: 100
//            y: 100
//            width: 500
//            height: 400
//            mItems: modelItem
//            mView: typeView.mLargeIcon
//        }

        DrawableControl {
            id: testDrawableControl
            x: 100
            y: 100
            width: 400
            height: 400
        }
    }

    Component.onCompleted: {
        directConnectionObject.source = drawableControl
        directConnectionObject.signal = "onPaintHandle(QQuickItem*,QPainter*)"
        directConnectionObject.destination = testFrameworkItem
        directConnectionObject.slot = "DrawControl(QQuickItem*,QPainter*)"
        directConnectionObject.isConnect = true
    }
}
