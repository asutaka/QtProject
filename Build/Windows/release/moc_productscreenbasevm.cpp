/****************************************************************************
** Meta object code from reading C++ file 'productscreenbasevm.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../ProdScreenBase/productscreenbasevm.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'productscreenbasevm.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ProductScreenBaseVM_t {
    QByteArrayData data[26];
    char stringdata0[334];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ProductScreenBaseVM_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ProductScreenBaseVM_t qt_meta_stringdata_ProductScreenBaseVM = {
    {
QT_MOC_LITERAL(0, 0, 19), // "ProductScreenBaseVM"
QT_MOC_LITERAL(1, 20, 16), // "onChangeLanguage"
QT_MOC_LITERAL(2, 37, 0), // ""
QT_MOC_LITERAL(3, 38, 15), // "txtProductTitle"
QT_MOC_LITERAL(4, 54, 13), // "txtLotNoTitle"
QT_MOC_LITERAL(5, 68, 12), // "txtProductNo"
QT_MOC_LITERAL(6, 81, 14), // "txtProductName"
QT_MOC_LITERAL(7, 96, 13), // "txtLotNoValue"
QT_MOC_LITERAL(8, 110, 11), // "txtRefTitle"
QT_MOC_LITERAL(9, 122, 14), // "txtLowLmtTitle"
QT_MOC_LITERAL(10, 137, 13), // "txtUpLmtTitle"
QT_MOC_LITERAL(11, 151, 10), // "txtNoTitle"
QT_MOC_LITERAL(12, 162, 10), // "txtRefUnit"
QT_MOC_LITERAL(13, 173, 13), // "txtLowLmtUnit"
QT_MOC_LITERAL(14, 187, 12), // "txtUpLmtUnit"
QT_MOC_LITERAL(15, 200, 9), // "txtNoUnit"
QT_MOC_LITERAL(16, 210, 11), // "txtRefValue"
QT_MOC_LITERAL(17, 222, 14), // "txtLowLmtValue"
QT_MOC_LITERAL(18, 237, 13), // "txtUpLmtValue"
QT_MOC_LITERAL(19, 251, 10), // "txtNoValue"
QT_MOC_LITERAL(20, 262, 13), // "txtTotalTitle"
QT_MOC_LITERAL(21, 276, 10), // "txtOKTitle"
QT_MOC_LITERAL(22, 287, 10), // "txtNGTitle"
QT_MOC_LITERAL(23, 298, 13), // "txtTotalValue"
QT_MOC_LITERAL(24, 312, 10), // "txtOKValue"
QT_MOC_LITERAL(25, 323, 10) // "txtNGValue"

    },
    "ProductScreenBaseVM\0onChangeLanguage\0"
    "\0txtProductTitle\0txtLotNoTitle\0"
    "txtProductNo\0txtProductName\0txtLotNoValue\0"
    "txtRefTitle\0txtLowLmtTitle\0txtUpLmtTitle\0"
    "txtNoTitle\0txtRefUnit\0txtLowLmtUnit\0"
    "txtUpLmtUnit\0txtNoUnit\0txtRefValue\0"
    "txtLowLmtValue\0txtUpLmtValue\0txtNoValue\0"
    "txtTotalTitle\0txtOKTitle\0txtNGTitle\0"
    "txtTotalValue\0txtOKValue\0txtNGValue"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ProductScreenBaseVM[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       1,   14, // methods
      23,   20, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   19,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Int,

 // properties: name, type, flags
       3, QMetaType::QString, 0x00095401,
       4, QMetaType::QString, 0x00095401,
       5, QMetaType::QString, 0x00095401,
       6, QMetaType::QString, 0x00095401,
       7, QMetaType::QString, 0x00095401,
       8, QMetaType::QString, 0x00095401,
       9, QMetaType::QString, 0x00095401,
      10, QMetaType::QString, 0x00095401,
      11, QMetaType::QString, 0x00095401,
      12, QMetaType::QString, 0x00095401,
      13, QMetaType::QString, 0x00095401,
      14, QMetaType::QString, 0x00095401,
      15, QMetaType::QString, 0x00095401,
      16, QMetaType::QString, 0x00095401,
      17, QMetaType::QString, 0x00095401,
      18, QMetaType::QString, 0x00095401,
      19, QMetaType::QString, 0x00095401,
      20, QMetaType::QString, 0x00095401,
      21, QMetaType::QString, 0x00095401,
      22, QMetaType::QString, 0x00095401,
      23, QMetaType::QString, 0x00095401,
      24, QMetaType::QString, 0x00095401,
      25, QMetaType::QString, 0x00095401,

       0        // eod
};

void ProductScreenBaseVM::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        ProductScreenBaseVM *_t = static_cast<ProductScreenBaseVM *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { int _r = _t->onChangeLanguage();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        ProductScreenBaseVM *_t = static_cast<ProductScreenBaseVM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->txtProductTitle(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->txtLotNoTitle(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->txtProductNo(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->txtProductName(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->txtLotNoValue(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->txtRefTitle(); break;
        case 6: *reinterpret_cast< QString*>(_v) = _t->txtLowLmtTitle(); break;
        case 7: *reinterpret_cast< QString*>(_v) = _t->txtUpLmtTitle(); break;
        case 8: *reinterpret_cast< QString*>(_v) = _t->txtNoTitle(); break;
        case 9: *reinterpret_cast< QString*>(_v) = _t->txtRefUnit(); break;
        case 10: *reinterpret_cast< QString*>(_v) = _t->txtLowLmtUnit(); break;
        case 11: *reinterpret_cast< QString*>(_v) = _t->txtUpLmtUnit(); break;
        case 12: *reinterpret_cast< QString*>(_v) = _t->txtNoUnit(); break;
        case 13: *reinterpret_cast< QString*>(_v) = _t->txtRefValue(); break;
        case 14: *reinterpret_cast< QString*>(_v) = _t->txtLowLmtValue(); break;
        case 15: *reinterpret_cast< QString*>(_v) = _t->txtUpLmtValue(); break;
        case 16: *reinterpret_cast< QString*>(_v) = _t->txtNoValue(); break;
        case 17: *reinterpret_cast< QString*>(_v) = _t->txtTotalTitle(); break;
        case 18: *reinterpret_cast< QString*>(_v) = _t->txtOKTitle(); break;
        case 19: *reinterpret_cast< QString*>(_v) = _t->txtNGTitle(); break;
        case 20: *reinterpret_cast< QString*>(_v) = _t->txtTotalValue(); break;
        case 21: *reinterpret_cast< QString*>(_v) = _t->txtOKValue(); break;
        case 22: *reinterpret_cast< QString*>(_v) = _t->txtNGValue(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject ProductScreenBaseVM::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_ProductScreenBaseVM.data,
      qt_meta_data_ProductScreenBaseVM,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ProductScreenBaseVM::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ProductScreenBaseVM::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ProductScreenBaseVM.stringdata0))
        return static_cast<void*>(const_cast< ProductScreenBaseVM*>(this));
    return QObject::qt_metacast(_clname);
}

int ProductScreenBaseVM::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 1)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 1)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 1;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 23;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 23;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 23;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 23;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 23;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 23;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
