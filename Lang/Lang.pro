#-------------------------------------------------
#
# Project created by QtCreator 2017-02-08T10:50:22
#
#-------------------------------------------------

QT       -= gui
QT += sql

TARGET = Lang
TEMPLATE = lib

DEFINES += LANG_LIBRARY

SOURCES += lang.cpp \
    langid.cpp

HEADERS += lang.h\
        lang_global.h \
    langid.h

unix {
    target.path = /usr/lib
    INSTALLS += target
}
