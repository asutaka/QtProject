#-------------------------------------------------
#
# Project created by QtCreator 2017-03-27T15:35:17
#
#-------------------------------------------------
QT += quick
TARGET = ScreenLayout
TEMPLATE = lib

DEFINES += SCREENLAYOUT_LIBRARY

SOURCES += screenlayout.cpp \
    drawcontrolbase.cpp

HEADERS += screenlayout.h\
        screenlayout_global.h \
    drawcontrolbase.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
