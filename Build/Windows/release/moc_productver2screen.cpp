/****************************************************************************
** Meta object code from reading C++ file 'productver2screen.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Production/productver2screen.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'productver2screen.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ProductVer2Screen_t {
    QByteArrayData data[12];
    char stringdata0[164];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ProductVer2Screen_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ProductVer2Screen_t qt_meta_stringdata_ProductVer2Screen = {
    {
QT_MOC_LITERAL(0, 0, 17), // "ProductVer2Screen"
QT_MOC_LITERAL(1, 18, 24), // "getBackGroundColorFromVM"
QT_MOC_LITERAL(2, 43, 0), // ""
QT_MOC_LITERAL(3, 44, 6), // "OnLoad"
QT_MOC_LITERAL(4, 51, 6), // "isXBar"
QT_MOC_LITERAL(5, 58, 12), // "measureValue"
QT_MOC_LITERAL(6, 71, 14), // "QList<QString>"
QT_MOC_LITERAL(7, 86, 11), // "measureUnit"
QT_MOC_LITERAL(8, 98, 15), // "arrPixmapLineNo"
QT_MOC_LITERAL(9, 114, 14), // "QList<QPixmap>"
QT_MOC_LITERAL(10, 129, 18), // "arrMassbarBargraph"
QT_MOC_LITERAL(11, 148, 15) // "arrStatusLineNo"

    },
    "ProductVer2Screen\0getBackGroundColorFromVM\0"
    "\0OnLoad\0isXBar\0measureValue\0QList<QString>\0"
    "measureUnit\0arrPixmapLineNo\0QList<QPixmap>\0"
    "arrMassbarBargraph\0arrStatusLineNo"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ProductVer2Screen[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       6,   26, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   24,    2, 0x02 /* Public */,
       3,    0,   25,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QString,
    QMetaType::Void,

 // properties: name, type, flags
       4, QMetaType::Bool, 0x00095103,
       5, 0x80000000 | 6, 0x0009510b,
       7, QMetaType::QString, 0x00095103,
       8, 0x80000000 | 9, 0x0009510b,
      10, 0x80000000 | 9, 0x0009510b,
      11, 0x80000000 | 9, 0x0009510b,

       0        // eod
};

void ProductVer2Screen::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        ProductVer2Screen *_t = static_cast<ProductVer2Screen *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QString _r = _t->getBackGroundColorFromVM();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = _r; }  break;
        case 1: _t->OnLoad(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 5:
        case 4:
        case 3:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QPixmap> >(); break;
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QString> >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        ProductVer2Screen *_t = static_cast<ProductVer2Screen *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< bool*>(_v) = _t->isXBar(); break;
        case 1: *reinterpret_cast< QList<QString>*>(_v) = _t->getMeasureValue(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->getMeasureUnit(); break;
        case 3: *reinterpret_cast< QList<QPixmap>*>(_v) = _t->getArrPixmapLineNo(); break;
        case 4: *reinterpret_cast< QList<QPixmap>*>(_v) = _t->getArrMassbarBargraph(); break;
        case 5: *reinterpret_cast< QList<QPixmap>*>(_v) = _t->getArrStatusLineNo(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        ProductVer2Screen *_t = static_cast<ProductVer2Screen *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setIsXBar(*reinterpret_cast< bool*>(_v)); break;
        case 1: _t->setMeasureValue(*reinterpret_cast< QList<QString>*>(_v)); break;
        case 2: _t->setMeasureUnit(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setArrPixmapLineNo(*reinterpret_cast< QList<QPixmap>*>(_v)); break;
        case 4: _t->setArrMassbarBargraph(*reinterpret_cast< QList<QPixmap>*>(_v)); break;
        case 5: _t->setArrStatusLineNo(*reinterpret_cast< QList<QPixmap>*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject ProductVer2Screen::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_ProductVer2Screen.data,
      qt_meta_data_ProductVer2Screen,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ProductVer2Screen::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ProductVer2Screen::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ProductVer2Screen.stringdata0))
        return static_cast<void*>(const_cast< ProductVer2Screen*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int ProductVer2Screen::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 2)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 2;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 2)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 2;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
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
