/****************************************************************************
** Meta object code from reading C++ file 'drawcontrolbase_ver2.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Control/drawControlBase/drawcontrolbase_ver2.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'drawcontrolbase_ver2.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_DrawControlBase_Ver2_t {
    QByteArrayData data[9];
    char stringdata0[96];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DrawControlBase_Ver2_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DrawControlBase_Ver2_t qt_meta_stringdata_DrawControlBase_Ver2 = {
    {
QT_MOC_LITERAL(0, 0, 20), // "DrawControlBase_Ver2"
QT_MOC_LITERAL(1, 21, 10), // "updateDraw"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 9), // "getIsLeft"
QT_MOC_LITERAL(4, 43, 7), // "_isLeft"
QT_MOC_LITERAL(5, 51, 6), // "_btnID"
QT_MOC_LITERAL(6, 58, 9), // "_screenID"
QT_MOC_LITERAL(7, 68, 14), // "getCurrentLine"
QT_MOC_LITERAL(8, 83, 12) // "_currentLine"

    },
    "DrawControlBase_Ver2\0updateDraw\0\0"
    "getIsLeft\0_isLeft\0_btnID\0_screenID\0"
    "getCurrentLine\0_currentLine"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DrawControlBase_Ver2[] = {

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

 // slots: name, argc, parameters, tag, flags
       1,    0,   29,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
       3,    3,   30,    2, 0x02 /* Public */,
       7,    1,   37,    2, 0x02 /* Public */,

 // slots: parameters
    QMetaType::Void,

 // methods: parameters
    QMetaType::Void, QMetaType::Bool, QMetaType::Int, QMetaType::Int,    4,    5,    6,
    QMetaType::Void, QMetaType::Int,    8,

       0        // eod
};

void DrawControlBase_Ver2::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        DrawControlBase_Ver2 *_t = static_cast<DrawControlBase_Ver2 *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->updateDraw(); break;
        case 1: _t->getIsLeft((*reinterpret_cast< bool(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3]))); break;
        case 2: _t->getCurrentLine((*reinterpret_cast< int(*)>(_a[1]))); break;
        default: ;
        }
    }
}

const QMetaObject DrawControlBase_Ver2::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_DrawControlBase_Ver2.data,
      qt_meta_data_DrawControlBase_Ver2,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *DrawControlBase_Ver2::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DrawControlBase_Ver2::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_DrawControlBase_Ver2.stringdata0))
        return static_cast<void*>(const_cast< DrawControlBase_Ver2*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int DrawControlBase_Ver2::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
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
