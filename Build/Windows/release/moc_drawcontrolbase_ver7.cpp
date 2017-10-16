/****************************************************************************
** Meta object code from reading C++ file 'drawcontrolbase_ver7.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Control/drawControlBase/drawcontrolbase_ver7.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'drawcontrolbase_ver7.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_DrawControlBase_ver7_t {
    QByteArrayData data[11];
    char stringdata0[111];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DrawControlBase_ver7_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DrawControlBase_ver7_t qt_meta_stringdata_DrawControlBase_ver7 = {
    {
QT_MOC_LITERAL(0, 0, 20), // "DrawControlBase_ver7"
QT_MOC_LITERAL(1, 21, 12), // "setNumSelect"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 6), // "lineNo"
QT_MOC_LITERAL(4, 42, 9), // "numSelect"
QT_MOC_LITERAL(5, 52, 9), // "getIsLeft"
QT_MOC_LITERAL(6, 62, 6), // "isLeft"
QT_MOC_LITERAL(7, 69, 5), // "btnID"
QT_MOC_LITERAL(8, 75, 8), // "screenID"
QT_MOC_LITERAL(9, 84, 14), // "getCurrentLine"
QT_MOC_LITERAL(10, 99, 11) // "currentLine"

    },
    "DrawControlBase_ver7\0setNumSelect\0\0"
    "lineNo\0numSelect\0getIsLeft\0isLeft\0"
    "btnID\0screenID\0getCurrentLine\0currentLine"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DrawControlBase_ver7[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       3,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   29,    2, 0x02 /* Public */,
       5,    3,   34,    2, 0x02 /* Public */,
       9,    1,   41,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::Int, QMetaType::Int,    3,    4,
    QMetaType::Void, QMetaType::Bool, QMetaType::Int, QMetaType::Int,    6,    7,    8,
    QMetaType::Void, QMetaType::Int,   10,

       0        // eod
};

void DrawControlBase_ver7::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        DrawControlBase_ver7 *_t = static_cast<DrawControlBase_ver7 *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->setNumSelect((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 1: _t->getIsLeft((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3]))); break;
        case 2: _t->getCurrentLine((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject DrawControlBase_ver7::staticMetaObject = {
    { &QQuickItem::staticMetaObject, qt_meta_stringdata_DrawControlBase_ver7.data,
      qt_meta_data_DrawControlBase_ver7,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *DrawControlBase_ver7::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DrawControlBase_ver7::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_DrawControlBase_ver7.stringdata0))
        return static_cast<void*>(const_cast< DrawControlBase_ver7*>(this));
    return QQuickItem::qt_metacast(_clname);
}

int DrawControlBase_ver7::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 3)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 3)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 3;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
