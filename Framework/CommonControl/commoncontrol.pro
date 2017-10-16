TEMPLATE = lib
TARGET = CommonControl
QT += qml quick
CONFIG += qt plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.mycompany.qmlcomponents

# Input
SOURCES += \
    commoncontrol_plugin.cpp \
    myitem.cpp \
    ProductionInfo/productioninfo_com1.cpp \
    ProductionInfo/productioninfo_com2.cpp \
    ProductionInfo/productioninfo_com3.cpp

HEADERS += \
    commoncontrol_plugin.h \
    myitem.h \
    productioninfo_com1.h \
    ProductionInfo/productioninfo_com1.h \
    ProductionInfo/productioninfo_com2.h \
    ProductionInfo/productioninfo_com3.h

DISTFILES = qmldir \
    imports/Control/SlideControl.qml \
    imports/Control/SlideControlVer2.qml \
    imports/Control/SlideControlVer3.qml \
    imports/Control/SlideControlVer4.qml \
    imports/Control/ImageButtonControl.qml \
    imports/Control/KeyButtonControl.qml \
    imports/Control/LabelControl.qml \
    imports/Control/WheelControlVer1.qml \
    imports/Control/WheelControlVer2.qml \
    imports/Control/WheelControlVer3.qml \
    imports/Control/SwipeControl.qml \
    imports/Control/SpinnerControlVer1.qml \
    imports/Control/SpinnerControlVer2.qml \
    imports/Control/VirtualKey.js \
    imports/Control/QuickMenuControl.qml \
    imports/Control/ButtonControl.qml \
    imports/Control/DataGridView.qml \
    imports/Control/ProductionInfo_com1.qml \
    imports/Control/ProductionInfo/ProductionInfo_com1.qml \
    imports/Control/ProductionInfo/ProductionInfo_com2.qml \
    imports/Control/ProductionInfo/ProductionInfo_com3.qml \
    imports/Control/TK_DataGridView.qml \
    imports/Control/TK_SwitchControl.qml \
    imports/Control/Layout/TK_FlowLayoutPanel.qml \
    imports/Control/TK_Navigator.qml \
    imports/Control/TK_Label.qml \
    imports/Control/TK_DomainUpDown.qml \
    imports/Control/TK_RadioButton.qml \
    imports/Control/TK_GroupBox.qml \
    imports/Control/TK_SwitchLineUC.qml \
    imports/Control/TK_TextBox.qml \
    imports/Control/TK_ListBox.qml \
    imports/Control/TK_DateTimePicker.qml \
    imports/Control/TK_PictureBox.qml \
    imports/Control/TK_CheckedListBox.qml \
    imports/Control/TK_Panel.qml \
    imports/Control/TK_TabControl.qml \
    imports/Control/TK_TableLayoutPanel.qml \
    imports/Control/TK_ComboBox.qml \
    imports/Control/TK_ListView.qml \
    imports/Control/TK_TreeView.qml \
    imports/Control/TK_MonthCalendar.qml \
    imports/Control/TK_Button.qml \
    imports/Control/TK_NumericUpDown.qml  \
    imports/Control/checkBox_bar.png \
    imports/Control/checkBox_off.png \
    imports/Control/checkBox_on.png \
    imports/Control/TK_CheckBox.qml \
    imports/Control/TK_ProgressBar.qml

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

qmldir.files = qmldir
unix {
    installPath = $$[QT_INSTALL_QML]/$$replace(uri, \\., /)
    qmldir.path = $$installPath
    target.path = $$installPath
    INSTALLS += target qmldir
}
