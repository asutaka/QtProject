/****************************************************************************
** Meta object code from reading C++ file 'statusbar.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../StatusBar/statusbar.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'statusbar.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_StatusBar_t {
    QByteArrayData data[10];
    char stringdata0[91];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_StatusBar_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_StatusBar_t qt_meta_stringdata_StatusBar = {
    {
QT_MOC_LITERAL(0, 0, 9), // "StatusBar"
QT_MOC_LITERAL(1, 10, 12), // "sendResponse"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 3), // "sms"
QT_MOC_LITERAL(4, 28, 10), // "connectQml"
QT_MOC_LITERAL(5, 39, 9), // "readyRead"
QT_MOC_LITERAL(6, 49, 12), // "disconnected"
QT_MOC_LITERAL(7, 62, 12), // "bytesWritten"
QT_MOC_LITERAL(8, 75, 5), // "bytes"
QT_MOC_LITERAL(9, 81, 9) // "getWeight"

    },
    "StatusBar\0sendResponse\0\0sms\0connectQml\0"
    "readyRead\0disconnected\0bytesWritten\0"
    "bytes\0getWeight"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_StatusBar[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       1,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   44,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       4,    0,   47,    2, 0x0a /* Public */,
       5,    0,   48,    2, 0x0a /* Public */,
       6,    0,   49,    2, 0x0a /* Public */,
       7,    1,   50,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       9,    0,   53,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, QMetaType::QString,    3,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QByteArray,    8,

 // methods: parameters
    QMetaType::QString,

       0        // eod
};

void StatusBar::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        StatusBar *_t = static_cast<StatusBar *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sendResponse((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->connectQml(); break;
        case 2: _t->readyRead(); break;
        case 3: _t->disconnected(); break;
        case 4: _t->bytesWritten((*reinterpret_cast< QByteArray(*)>(_a[1]))); break;
        case 5: { QString _r = _t->getWeight();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (StatusBar::*_t)(QString );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&StatusBar::sendResponse)) {
                *result = 0;
                return;
            }
        }
    }
}

const QMetaObject StatusBar::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_StatusBar.data,
      qt_meta_data_StatusBar,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *StatusBar::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *StatusBar::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_StatusBar.stringdata0))
        return static_cast<void*>(const_cast< StatusBar*>(this));
    return QObject::qt_metacast(_clname);
}

int StatusBar::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void StatusBar::sendResponse(QString _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}
QT_END_MOC_NAMESPACE
