TEMPLATE = lib
TARGET = CommonModule
QT += qml quick
CONFIG += qt plugin c++11

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.mycompany.qmlcomponents

# Input
SOURCES += \
    commonmodule_plugin.cpp \
    myitem.cpp

HEADERS += \
    commonmodule_plugin.h \
    myitem.h

DISTFILES = qmldir \
    Import/Module/CaculatorUc.qml \
    Import/Module/KeyboardComponent.qml \
    Import/Module/KeyboardUc.qml \
    Import/Module/StartSwitchUc.qml \
    Import/Module/SwitchLineUc.qml \
    Import/Module/StartSwitchLineModule.qml \
    Import/Module/GridViewNavigatorModule.qml

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
