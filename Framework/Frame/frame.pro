TEMPLATE = lib
TARGET = Frame
QT += qml quick
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = com.mycompany.qmlcomponents

# Input
SOURCES += \
    frame_plugin.cpp

HEADERS += \
    frame_plugin.h

DISTFILES = qmldir \
    Import/Frame/TK_ProductionFrame.qml \
    Import/Frame/TK_MenuList.qml
	
qmldir.files = qmldir
