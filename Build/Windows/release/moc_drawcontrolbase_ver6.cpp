/****************************************************************************
** Meta object code from reading C++ file 'drawcontrolbase_ver6.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Control/drawControlBase/drawcontrolbase_ver6.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'drawcontrolbase_ver6.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_DrawControlBase_ver6_t {
    QByteArrayData data[12];
    char stringdata0[122];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DrawControlBase_ver6_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DrawControlBase_ver6_t qt_meta_stringdata_DrawControlBase_ver6 = {
    {
QT_MOC_LITERAL(0, 0, 20), // "DrawControlBase_ver6"
QT_MOC_LITERAL(1, 21, 10), // "updateDraw"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 12), // "setNumSelect"
QT_MOC_LITERAL(4, 46, 6), // "lineNo"
QT_MOC_LITERAL(5, 53, 9), // "numSelect"
QT_MOC_LITERAL(6, 63, 9), // "getIsLeft"
QT_MOC_LITERAL(7, 73, 6), // "isLeft"
QT_MOC_LITERAL(8, 80, 5), // "btnID"
QT_MOC_LITERAL(9, 86, 8), // "screenID"
QT_MOC_LITERAL(10, 95, 14), // "getCurrentLine"
QT_MOC_LITERAL(11, 110, 11) // "currentLine"

    },
    "DrawControlBase_ver6\0updateDraw\0\0"
    "setNumSelect\0lineNo\0numSelect\0getIsLeft\0"
    "isLeft\0btnID\0screenID\0getCurrentLine\0"
    "currentLine"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DrawControlBase_ver6[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       4,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   34,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       3,    2,   35,    2, 0x02 /* Public */,
       6,    3,   40,    2, 0x02 /* Public */,
      10,    1,   47,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Int, QMetaType::Int,    4,    5,
    QMetaType::Void, QMetaType::Bool, QMetaType::Int, QMetaType::Int,    7,    8,    9,
    QMetaType::Void, QMetaType::Int,   11,

       0        // eod
};

void DrawControlBase_ver6::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        DrawControlBase_ver6 *_t = static_cast<DrawControlBase_ver6 *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->updateDraw(); break;
        case 1: _t->setNumSelect((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 2: _t->getIsLeft((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3]))); break;
        case 3: _t->getCurrentLine((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject DrawControlBase_ver6::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_DrawControlBase_ver6.data,
      qt_meta_data_DrawControlBase_ver6,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *DrawControlBase_ver6::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DrawControlBase_ver6::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_DrawControlBase_ver6.stringdata0))
        return static_cast<void*>(const_cast< DrawControlBase_ver6*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int DrawControlBase_ver6::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 4)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 4)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 4;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
