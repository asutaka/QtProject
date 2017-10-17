/****************************************************************************
** Meta object code from reading C++ file 'invalidline_ver2.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../InvalidLine/invalidline_ver2.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'invalidline_ver2.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_InvalidLine_ver2_t {
    QByteArrayData data[11];
    char stringdata0[140];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_InvalidLine_ver2_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_InvalidLine_ver2_t qt_meta_stringdata_InvalidLine_ver2 = {
    {
QT_MOC_LITERAL(0, 0, 16), // "InvalidLine_ver2"
QT_MOC_LITERAL(1, 17, 11), // "clickEnable"
QT_MOC_LITERAL(2, 29, 0), // ""
QT_MOC_LITERAL(3, 30, 12), // "clickDisable"
QT_MOC_LITERAL(4, 43, 23), // "onClickInvalidLinePanel"
QT_MOC_LITERAL(5, 67, 1), // "x"
QT_MOC_LITERAL(6, 69, 1), // "y"
QT_MOC_LITERAL(7, 71, 27), // "onLongPressInvalidLinePanel"
QT_MOC_LITERAL(8, 99, 9), // "selectAll"
QT_MOC_LITERAL(9, 109, 14), // "clearSelection"
QT_MOC_LITERAL(10, 124, 15) // "changeSelection"

    },
    "InvalidLine_ver2\0clickEnable\0\0"
    "clickDisable\0onClickInvalidLinePanel\0"
    "x\0y\0onLongPressInvalidLinePanel\0"
    "selectAll\0clearSelection\0changeSelection"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_InvalidLine_ver2[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       7,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   49,    2, 0x02 /* Public */,
       3,    0,   50,    2, 0x02 /* Public */,
       4,    2,   51,    2, 0x02 /* Public */,
       7,    2,   56,    2, 0x02 /* Public */,
       8,    0,   61,    2, 0x02 /* Public */,
       9,    0,   62,    2, 0x02 /* Public */,
      10,    0,   63,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void, QMetaType::Float, QMetaType::Float,    5,    6,
    QMetaType::Void, QMetaType::Float, QMetaType::Float,    5,    6,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

       0        // eod
};

void InvalidLine_ver2::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        InvalidLine_ver2 *_t = static_cast<InvalidLine_ver2 *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->clickEnable(); break;
        case 1: _t->clickDisable(); break;
        case 2: _t->onClickInvalidLinePanel((*reinterpret_cast< float(*)>(_a[1])),(*reinterpret_cast< float(*)>(_a[2]))); break;
        case 3: _t->onLongPressInvalidLinePanel((*reinterpret_cast< float(*)>(_a[1])),(*reinterpret_cast< float(*)>(_a[2]))); break;
        case 4: _t->selectAll(); break;
        case 5: _t->clearSelection(); break;
        case 6: _t->changeSelection(); break;
        default: ;
        }
    }
}

const QMetaObject InvalidLine_ver2::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_InvalidLine_ver2.data,
      qt_meta_data_InvalidLine_ver2,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *InvalidLine_ver2::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *InvalidLine_ver2::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_InvalidLine_ver2.stringdata0))
        return static_cast<void*>(const_cast< InvalidLine_ver2*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int InvalidLine_ver2::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 7)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 7;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 7)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 7;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
