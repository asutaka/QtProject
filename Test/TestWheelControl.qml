import QtQuick 2.0
import "../Control/wheelControl"
import ControlApp 1.0
Item {
    property alias objTestWheelControlVM: testWheelControlVM
    TestVM {
        id:testWheelControlVM
    }
    Rectangle{
        x: 0
        y: 0
        width: 1024
        height: 640
        color: "#5a6469"
        // Wheels control style 1
        WheelControl
        {
            id:wheelControl
            x: 100
            y: 255
//            onGetCurrentValue: {
//                zoomlineObj.getCurrentValue(parseInt(wheelControl.value))
//            }
        }
        // Wheels control style 2
        WheelControl2
        {
            id:wheelControl2
            x: 300
            y: 235
            wheelDiameter: 100
        }

        // Wheels control style 3
        WheelControl3
        {
            id:wheelControl3
            x:500
            y:255
        }
    }
    Component.onCompleted: {
        objTestWheelControlVM.onLoad();
    }
}
