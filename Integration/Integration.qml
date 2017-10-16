import QtQuick 2.0
import QtQuick.Window 2.2
import QtQuick.Layouts 1.2
import QtQuick.Controls 1.3
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.3
import ControlApp 1.0

Item {
    id: integration
    width: 1024
    height: 640

    Integration{
        id: drawContent
        width: 1024
        height: 640
    }
}
