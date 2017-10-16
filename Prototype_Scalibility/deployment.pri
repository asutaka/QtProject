unix:!android {
    isEmpty(target.path) {
        qnx {
            target.path = /tmp/$${TARGET}/bin
        } else {
            target.path = /opt/$${TARGET}/bin
        }
        export(target.path)
    }
    INSTALLS += target
}

export(INSTALLS)

include($$PWD/UIScreen/Production/production.pri)
#include($$PWD/UIScreen/BottomBar/bottombar.pri)
#include($$PWD/UIScreen/StatusBar/statusbar.pri)
