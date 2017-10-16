/****************************************************************************
** Meta object code from reading C++ file 'productioninfo_com3.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../CommonControl/ProductionInfo/productioninfo_com3.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'productioninfo_com3.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ProductionInfo_com3_t {
    QByteArrayData data[7];
    char stringdata0[92];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ProductionInfo_com3_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ProductionInfo_com3_t qt_meta_stringdata_ProductionInfo_com3 = {
    {
QT_MOC_LITERAL(0, 0, 19), // "ProductionInfo_com3"
QT_MOC_LITERAL(1, 20, 13), // "txtTotalTitle"
QT_MOC_LITERAL(2, 34, 10), // "txtOKTitle"
QT_MOC_LITERAL(3, 45, 10), // "txtNGTitle"
QT_MOC_LITERAL(4, 56, 13), // "txtTotalValue"
QT_MOC_LITERAL(5, 70, 10), // "txtOKValue"
QT_MOC_LITERAL(6, 81, 10) // "txtNGValue"

    },
    "ProductionInfo_com3\0txtTotalTitle\0"
    "txtOKTitle\0txtNGTitle\0txtTotalValue\0"
    "txtOKValue\0txtNGValue"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ProductionInfo_com3[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       6,   14, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // properties: name, type, flags
       1, QMetaType::QString, 0x00095103,
       2, QMetaType::QString, 0x00095103,
       3, QMetaType::QString, 0x00095103,
       4, QMetaType::QString, 0x00095103,
       5, QMetaType::QString, 0x00095103,
       6, QMetaType::QString, 0x00095103,

       0        // eod
};

void ProductionInfo_com3::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{

#ifndef QT_NO_PROPERTIES
    if (_c == QMetaObject::ReadProperty) {
        ProductionInfo_com3 *_t = static_cast<ProductionInfo_com3 *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->txtTotalTitle(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->txtOKTitle(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->txtNGTitle(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->txtTotalValue(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->txtOKValue(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->txtNGValue(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        ProductionInfo_com3 *_t = static_cast<ProductionInfo_com3 *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setTxtTotalTitle(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setTxtOKTitle(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setTxtNGTitle(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setTxtTotalValue(*reinterpret_cast< QString*>(_v)); break;
        case 4: _t->setTxtOKValue(*reinterpret_cast< QString*>(_v)); break;
        case 5: _t->setTxtNGValue(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
    Q_UNUSED(_o);
    Q_UNUSED(_id);
    Q_UNUSED(_c);
    Q_UNUSED(_a);
}

const QMetaObject ProductionInfo_com3::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_ProductionInfo_com3.data,
      qt_meta_data_ProductionInfo_com3,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ProductionInfo_com3::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ProductionInfo_com3::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ProductionInfo_com3.stringdata0))
        return static_cast<void*>(const_cast< ProductionInfo_com3*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int ProductionInfo_com3::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    
#ifndef QT_NO_PROPERTIES
   if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
