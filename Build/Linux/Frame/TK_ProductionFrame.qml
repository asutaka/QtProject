import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0
import CommonControl 1.0

Item {
    property real unitX: width/4.5
    property real unitY: height/10

    property alias com1: _com1
    property alias com2: _com2
    property alias com3A: _com3A
    property alias com3B: _com3B

    ProductionInfo_com1 {
        id: _com1
        x: 0
        y: 0
        width: unitX*1.5
        height: unitY*2.2
        visible: true

        states: [
            State {
                when: _com1.visible
                PropertyChanges {
                    target: _com1; width: unitX*1.5; height: unitY*2.2
                }
            },

            State {
                when: !_com1.visible
                PropertyChanges {
                    target: _com1; width: 0; height: 0
                }
            }
        ]
    }

    ProductionInfo_com2 {
        id: _com2
        x: _com1.x + _com1.width
        y: _com1.y
        width: unitX
        height: unitY*2.2
        visible: true

        states: [
            State {
                when: _com2.visible
                PropertyChanges {
                    target: _com2; width: unitX; height: unitY*2.2
                }
            },

            State {
                when: !_com2.visible
                PropertyChanges {
                    target: _com2; width: 0; height: 0
                }
            }
        ]

    }

    ProductionInfo_com3 {
        id: _com3A
        x: _com2.x + _com2.width
        y: _com2.y
        width: unitX
        height: unitY*2.2
        visible: true

        states: [
            State {
                when: _com3A.visible
                PropertyChanges {
                    target: _com3A; width: unitX; height: unitY*2.2
                }
            },

            State {
                when: !_com3A.visible
                PropertyChanges {
                    target: _com3A; width: 0; height: 0
                }
            }
        ]
    }

    ProductionInfo_com3 {
        id: _com3B
        x: _com3A.x + _com3A.width
        y: _com3A.y
        width: unitX
        height: unitY*2.2
        visible: true

        states: [
            State {
                when: _com3B.visible
                PropertyChanges {
                    target: _com3B; width: unitX; height: unitY*2.2
                }
            },

            State {
                when: !_com3B.visible
                PropertyChanges {
                    target: _com3B; width: 0; height: 0
                }
            }
        ]
    }

    function updateValue(productionVM) {
        // update com1
        if (_com1.visible) {
            _com1.txtLotNoValue = productionVM.txtLotNoValue
            _com1.txtProductName = productionVM.txtProductName
            _com1.txtProductNo = productionVM.txtProductNo
            _com1.update()
        }

        // update com2
        if (_com2.visible) {
            _com2.txtRefValue = productionVM.txtRefValue
            _com2.txtLowLmtValue = productionVM.txtLowLmtValue
            _com2.txtUpLmtValue = productionVM.txtUpLmtValue
            _com2.txtNoValue = productionVM.txtNoValue
            _com2.update()
        }

        // update com3A
        if (_com3A.visible) {
            _com3A.txtTotalValue = productionVM.txtTotalAValue
            _com3A.txtOKValue = productionVM.txtFeValue
            _com3A.txtNGValue = productionVM.txtSUSValue
            _com3A.txtOKValue = productionVM.txtFeValue
            _com3A.txtNGValue = productionVM.txtSUSValue
            _com3A.update()
        }

        // update com3B
        if(_com3B.visible) {
            _com3B.txtTotalValue = productionVM.txtTotalValue
            _com3B.txtOKValue = productionVM.txtOKValue
            _com3B.txtNGValue = productionVM.txtNGValue
            _com3B.txtTotalValue = productionVM.txtTotalValue
            _com3B.txtOKValue = productionVM.txtOKValue
            _com3B.txtNGValue = productionVM.txtNGValue
            _com3B.update()
        }
    }

    function updateText(productionVM) {
        // update com1
        if (_com1.visible) {
            _com1.txtLotNoTitle = productionVM.txtLotNoTitle
            _com1.txtProductTitle = productionVM.txtProductTitle
            _com1.update()
        }

        // update com2
        if (_com2.visible) {
            _com2.txtRefTitle = productionVM.txtRefTitle
            _com2.txtLowLmtTitle = productionVM.txtLowLmtTitle
            _com2.txtUpLmtTitle = productionVM.txtUpLmtTitle
            _com2.txtNoTitle = productionVM.txtNoTitle
            _com2.txtRefUnit = productionVM.txtRefUnit
            _com2.txtLowLmtUnit = productionVM.txtLowLmtUnit
            _com2.txtUpLmtUnit = productionVM.txtUpLmtUnit
            _com2.txtNoUnit = productionVM.txtNoUnit
            _com2.update()
        }

        // update com3A
        if (_com3A.visible) {
            _com3A.txtTotalTitle = productionVM.txtTotalATitle
            _com3A.txtOKTitle = productionVM.txtFeTitle
            _com3A.txtNGTitle = productionVM.txtSUSTitle
            _com3A.update()
        }

        if (_com3B.visible) {
            _com3B.txtTotalTitle = productionVM.txtTotalTitle
            _com3B.txtOKTitle = productionVM.txtOKTitle
            _com3B.txtNGTitle = productionVM.txtNGTitle
            _com3B.update()
        }
    }
}
