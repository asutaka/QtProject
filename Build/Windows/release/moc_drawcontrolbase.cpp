/****************************************************************************
** Meta object code from reading C++ file 'drawcontrolbase.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Control/drawControlBase/drawcontrolbase.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'drawcontrolbase.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_DrawControlBase_t {
    QByteArrayData data[20];
    char stringdata0[212];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DrawControlBase_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DrawControlBase_t qt_meta_stringdata_DrawControlBase = {
    {
QT_MOC_LITERAL(0, 0, 15), // "DrawControlBase"
QT_MOC_LITERAL(1, 16, 10), // "updateTime"
QT_MOC_LITERAL(2, 27, 0), // ""
QT_MOC_LITERAL(3, 28, 10), // "updateDraw"
QT_MOC_LITERAL(4, 39, 12), // "setNumSelect"
QT_MOC_LITERAL(5, 52, 6), // "lineNo"
QT_MOC_LITERAL(6, 59, 9), // "numSelect"
QT_MOC_LITERAL(7, 69, 9), // "getIsLeft"
QT_MOC_LITERAL(8, 79, 7), // "_isLeft"
QT_MOC_LITERAL(9, 87, 6), // "_btnID"
QT_MOC_LITERAL(10, 94, 9), // "_screenID"
QT_MOC_LITERAL(11, 104, 14), // "getCurrentLine"
QT_MOC_LITERAL(12, 119, 12), // "_currentLine"
QT_MOC_LITERAL(13, 132, 16), // "getIntervalValue"
QT_MOC_LITERAL(14, 149, 9), // "_interval"
QT_MOC_LITERAL(15, 159, 8), // "setInDiv"
QT_MOC_LITERAL(16, 168, 5), // "value"
QT_MOC_LITERAL(17, 174, 9), // "setRelVal"
QT_MOC_LITERAL(18, 184, 13), // "setUpperValue"
QT_MOC_LITERAL(19, 198, 13) // "setLowerValue"

    },
    "DrawControlBase\0updateTime\0\0updateDraw\0"
    "setNumSelect\0lineNo\0numSelect\0getIsLeft\0"
    "_isLeft\0_btnID\0_screenID\0getCurrentLine\0"
    "_currentLine\0getIntervalValue\0_interval\0"
    "setInDiv\0value\0setRelVal\0setUpperValue\0"
    "setLowerValue"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DrawControlBase[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
      10,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    0,   64,    2, 0x0a /* Public */,
       3,    0,   65,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       4,    2,   66,    2, 0x02 /* Public */,
       7,    3,   71,    2, 0x02 /* Public */,
      11,    1,   78,    2, 0x02 /* Public */,
      13,    1,   81,    2, 0x02 /* Public */,
      15,    1,   84,    2, 0x02 /* Public */,
      17,    1,   87,    2, 0x02 /* Public */,
      18,    1,   90,    2, 0x02 /* Public */,
      19,    1,   93,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Int, QMetaType::Int,    5,    6,
    QMetaType::Void, QMetaType::Bool, QMetaType::Int, QMetaType::Int,    8,    9,   10,
    QMetaType::Void, QMetaType::Int,   12,
    QMetaType::Void, QMetaType::Int,   14,
    QMetaType::Void, QMetaType::Bool,   16,
    QMetaType::Void, QMetaType::Bool,   16,
    QMetaType::Void, QMetaType::Int,   16,
    QMetaType::Void, QMetaType::Int,   16,

       0        // eod
};

void DrawControlBase::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        DrawControlBase *_t = static_cast<DrawControlBase *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->updateTime(); break;
        case 1: _t->updateDraw(); break;
        case 2: _t->setNumSelect((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2]))); break;
        case 3: _t->getIsLeft((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3]))); break;
        case 4: _t->getCurrentLine((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 5: _t->getIntervalValue((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->setInDiv((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 7: _t->setRelVal((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 8: _t->setUpperValue((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 9: _t->setLowerValue((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject DrawControlBase::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_DrawControlBase.data,
      qt_meta_data_DrawControlBase,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *DrawControlBase::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DrawControlBase::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_DrawControlBase.stringdata0))
        return static_cast<void*>(const_cast< DrawControlBase*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int DrawControlBase::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 10)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 10;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 10)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 10;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
