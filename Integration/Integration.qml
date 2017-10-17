import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0
import CommonControl 1.0
import CommonModule 1.0

Item {
    id: integration
    width: 1024
    height: 640
    property alias integrationVM: objIntegrationVM

    Integartion_VM{
        id:objIntegrationVM

    }

    Component.onCompleted: {
        integrationVM.onLoad();
    }

    Component.onDestruction: {

    }

    Integration{
        id: drawContent
        width: 1024
        height: 640

        Timer{
            id: timer
            running: true
            interval: 100
            repeat: true
            onTriggered: {
                integrationVM.onUpdateData();
                mainChart.mListSourceImage = integrationVM.listSourceImage
                mainChart.updateColumnChart()
            }
        }
        TK_ColumnChart {
            id: mainChart
            x: 100
            y: 180
            mNumberColumn : 10
            mTypeChart : true
            mColumnWidth : 32
            mColumnHeight : 209
            padding: [60,0,0,0]
            margin: [30,0,0,0]

            Component.onCompleted: {
                mainChart.mListColumnType = integrationVM.listColumnType
                mainChart.mListSourceImage = integrationVM.listSourceImage
                mainChart.mListSourceBackgroundImage = integrationVM.listSourceBackgroundImage
                mainChart.creatQmlObj()
            }
        }
    }
}
