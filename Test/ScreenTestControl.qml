import QtQuick 2.0
import QtQuick.Controls 2.0
import CommonControl 1.0
import EnumControl 1.0
//import "qrc:/Control"

Rectangle {
    x:0
    y:0
    width: 1024
    height: 640
    color: "#ffffff"
    property alias objTestAccordionListVM: testAccordionListVM
    TestVM {
        id:testAccordionListVM
    }

    Component.onCompleted: {
        objTestAccordionListVM.onLoad();
    }
    TK_FlowLayoutPanel
    {
        id: flowLayout
        mSize:Qt.size(500,300)
        mX:200
        mY:100
        z:1
        mEnabled: true
        mFlowDirection:EnumControl.FLOW_DIRECTION_LEFT_TO_RIGHT

        mRightToLeft:false

        Rectangle
        {
            id:rect
            z:1
            width: 70
            height: 70
            color:"#000000"

        }

        Text {
            id: txt
            z:1
            color: "#ff0000"
            text: qsTr("text")
        }
        ToolButton
        {
            id: btn
            z:1
            width: 75
            height: 75
            text: "vt"
        }
        CheckBox
        {
            id:chk
            z:1
            width: 75
            height: 75
            text: "checkbox"
        }
        ComboBox
        {
            id: cmb
            z:1
            width: 75
            height: 75
        }
        Rectangle
        {
            id:rect1
            z:1
            width: 70
            height: 70
            color:"#696969"
        }
        Rectangle
        {
            id:rect2
            z:1
            width: 70
            height: 70
            color:"#000000"
        }
        Rectangle
        {
            id:rect3
            z:1
            width: 70
            height: 70
            color:"#000000"
        }
        Rectangle
        {
            id:rect4
            z:1
            width: 70
            height: 70
            color:"#000000"
        }
        Rectangle
        {
            id:rect5
            z:1
            width: 70
            height: 70
            color:"#000000"
        }
        Rectangle
        {
            id:rect6
            z:1
            width: 70
            height: 70
            color:"#000000"
        }
        Rectangle
        {
            id:rect7
            z:1
            width: 70
            height: 70
            color:"#000000"
        }
        Rectangle
        {
            id:rect8
            z:1
            width: 70
            height: 70
            color:"#000000"
        }

        Component.onCompleted:
        {
            addControl(rect);
            addControl(txt);
            addControl(btn);
            addControl(chk);
            addControl(cmb);
             addControl(rect1);
             addControl(rect2);
             addControl(rect3);
             addControl(rect4);
             addControl(rect5);
             addControl(rect6);
             addControl(rect7);
             addControl(rect8);
        }
    }

    MouseArea
    {
        anchors.fill: parent
        onClicked:
        {
//            flowLayout.getText();
//            flowLayout.mBackColor="#ff0000"
        }

    }
}
