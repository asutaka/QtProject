/****************************************************************************
** Meta object code from reading C++ file 'mainwindow.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../mainwindow.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'mainwindow.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_MainWindow_t {
    QByteArrayData data[22];
    char stringdata0[284];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_MainWindow_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_MainWindow_t qt_meta_stringdata_MainWindow = {
    {
QT_MOC_LITERAL(0, 0, 10), // "MainWindow"
QT_MOC_LITERAL(1, 11, 14), // "onChangeScreen"
QT_MOC_LITERAL(2, 26, 0), // ""
QT_MOC_LITERAL(3, 27, 6), // "source"
QT_MOC_LITERAL(4, 34, 17), // "onChangeStatusBar"
QT_MOC_LITERAL(5, 52, 17), // "onChangeBottomBar"
QT_MOC_LITERAL(6, 70, 12), // "onBackScreen"
QT_MOC_LITERAL(7, 83, 5), // "count"
QT_MOC_LITERAL(8, 89, 16), // "onChangeLanguage"
QT_MOC_LITERAL(9, 106, 13), // "onChangeTheme"
QT_MOC_LITERAL(10, 120, 8), // "guiEvent"
QT_MOC_LITERAL(11, 129, 7), // "eventId"
QT_MOC_LITERAL(12, 137, 10), // "OnGuiEvent"
QT_MOC_LITERAL(13, 148, 17), // "InnerChangeScreen"
QT_MOC_LITERAL(14, 166, 2), // "id"
QT_MOC_LITERAL(15, 169, 20), // "InnerChangeBottomBar"
QT_MOC_LITERAL(16, 190, 20), // "InnerChangeStatusBar"
QT_MOC_LITERAL(17, 211, 18), // "InnerRefreshScreen"
QT_MOC_LITERAL(18, 230, 12), // "GoBackScreen"
QT_MOC_LITERAL(19, 243, 8), // "language"
QT_MOC_LITERAL(20, 252, 21), // "EnumControl::LangCode"
QT_MOC_LITERAL(21, 274, 9) // "errorMode"

    },
    "MainWindow\0onChangeScreen\0\0source\0"
    "onChangeStatusBar\0onChangeBottomBar\0"
    "onBackScreen\0count\0onChangeLanguage\0"
    "onChangeTheme\0guiEvent\0eventId\0"
    "OnGuiEvent\0InnerChangeScreen\0id\0"
    "InnerChangeBottomBar\0InnerChangeStatusBar\0"
    "InnerRefreshScreen\0GoBackScreen\0"
    "language\0EnumControl::LangCode\0errorMode"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_MainWindow[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      13,   14, // methods
       2,  110, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       7,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   79,    2, 0x06 /* Public */,
       4,    1,   82,    2, 0x06 /* Public */,
       5,    1,   85,    2, 0x06 /* Public */,
       6,    1,   88,    2, 0x06 /* Public */,
       8,    0,   91,    2, 0x06 /* Public */,
       9,    0,   92,    2, 0x06 /* Public */,
      10,    1,   93,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      12,    1,   96,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      13,    1,   99,    2, 0x02 /* Public */,
      15,    1,  102,    2, 0x02 /* Public */,
      16,    1,  105,    2, 0x02 /* Public */,
      17,    0,  108,    2, 0x02 /* Public */,
      18,    0,  109,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Void, QMetaType::Int,    7,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Int,   11,

 // slots: parameters
    QMetaType::Void, QMetaType::Int,   11,

 // methods: parameters
    QMetaType::Void, QMetaType::Int,   14,
    QMetaType::Void, QMetaType::Int,   14,
    QMetaType::Void, QMetaType::Int,   14,
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
      19, 0x80000000 | 20, 0x0009510b,
      21, QMetaType::Bool, 0x00095003,

       0        // eod
};

void MainWindow::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        MainWindow *_t = static_cast<MainWindow *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onChangeScreen((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->onChangeStatusBar((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->onChangeBottomBar((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->onBackScreen((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 4: _t->onChangeLanguage(); break;
        case 5: _t->onChangeTheme(); break;
        case 6: _t->guiEvent((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: _t->OnGuiEvent((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 8: _t->InnerChangeScreen((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 9: _t->InnerChangeBottomBar((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 10: _t->InnerChangeStatusBar((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 11: _t->InnerRefreshScreen(); break;
        case 12: _t->GoBackScreen(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (MainWindow::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MainWindow::onChangeScreen)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (MainWindow::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MainWindow::onChangeStatusBar)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (MainWindow::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MainWindow::onChangeBottomBar)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (MainWindow::*_t)(int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MainWindow::onBackScreen)) {
                *result = 3;
                return;
            }
        }
        {
            typedef void (MainWindow::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MainWindow::onChangeLanguage)) {
                *result = 4;
                return;
            }
        }
        {
            typedef void (MainWindow::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MainWindow::onChangeTheme)) {
                *result = 5;
                return;
            }
        }
        {
            typedef void (MainWindow::*_t)(int );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&MainWindow::guiEvent)) {
                *result = 6;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        MainWindow *_t = static_cast<MainWindow *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< EnumControl::LangCode*>(_v) = _t->language(); break;
        case 1: *reinterpret_cast< bool*>(_v) = _t->getErrorAlarmMode(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        MainWindow *_t = static_cast<MainWindow *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setLanguage(*reinterpret_cast< EnumControl::LangCode*>(_v)); break;
        case 1: _t->setErrorAlarmMode(*reinterpret_cast< bool*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

static const QMetaObject * const qt_meta_extradata_MainWindow[] = {
        &EnumControl::staticMetaObject,
    Q_NULLPTR
};

const QMetaObject MainWindow::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_MainWindow.data,
      qt_meta_data_MainWindow,  qt_static_metacall, qt_meta_extradata_MainWindow, Q_NULLPTR}
};


const QMetaObject *MainWindow::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *MainWindow::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_MainWindow.stringdata0))
        return static_cast<void*>(const_cast< MainWindow*>(this));
    return QObject::qt_metacast(_clname);
}

int MainWindow::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 13)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 13;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 13)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 13;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 2;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 2;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void MainWindow::onChangeScreen(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void MainWindow::onChangeStatusBar(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void MainWindow::onChangeBottomBar(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void MainWindow::onBackScreen(int _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void MainWindow::onChangeLanguage()
{
    QMetaObject::activate(this, &staticMetaObject, 4, Q_NULLPTR);
}

// SIGNAL 5
void MainWindow::onChangeTheme()
{
    QMetaObject::activate(this, &staticMetaObject, 5, Q_NULLPTR);
}

// SIGNAL 6
void MainWindow::guiEvent(int _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 6, _a);
}
QT_END_MOC_NAMESPACE
