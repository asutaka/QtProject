/****************************************************************************
** Meta object code from reading C++ file 'integartion_ver4.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Integration/integartion_ver4.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'integartion_ver4.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_Integartion_ver4_t {
    QByteArrayData data[8];
    char stringdata0[111];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Integartion_ver4_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Integartion_ver4_t qt_meta_stringdata_Integartion_ver4 = {
    {
QT_MOC_LITERAL(0, 0, 16), // "Integartion_ver4"
QT_MOC_LITERAL(1, 17, 11), // "DrawControl"
QT_MOC_LITERAL(2, 29, 0), // ""
QT_MOC_LITERAL(3, 30, 9), // "QPainter*"
QT_MOC_LITERAL(4, 40, 7), // "painter"
QT_MOC_LITERAL(5, 48, 30), // "connectToBufferedGraphicsPanel"
QT_MOC_LITERAL(6, 79, 22), // "BufferedGraphicsPanel*"
QT_MOC_LITERAL(7, 102, 8) // "buffered"

    },
    "Integartion_ver4\0DrawControl\0\0QPainter*\0"
    "painter\0connectToBufferedGraphicsPanel\0"
    "BufferedGraphicsPanel*\0buffered"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Integartion_ver4[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    1,   24,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       5,    1,   27,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 3,    4,

 // methods: parameters
    QMetaType::Void, 0x80000000 | 6,    7,

       0        // eod
};

void Integartion_ver4::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        Integartion_ver4 *_t = static_cast<Integartion_ver4 *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->DrawControl((*reinterpret_cast< QPainter*(*)>(_a[1]))); break;
        case 1: _t->connectToBufferedGraphicsPanel((*reinterpret_cast< BufferedGraphicsPanel*(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< BufferedGraphicsPanel* >(); break;
            }
            break;
        }
    }
}

const QMetaObject Integartion_ver4::staticMetaObject = {
    { &DrawControlBase_ver7::staticMetaObject, qt_meta_stringdata_Integartion_ver4.data,
      qt_meta_data_Integartion_ver4,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *Integartion_ver4::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Integartion_ver4::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_Integartion_ver4.stringdata0))
        return static_cast<void*>(const_cast< Integartion_ver4*>(this));
    return DrawControlBase_ver7::qt_metacast(_clname);
}

int Integartion_ver4::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = DrawControlBase_ver7::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
