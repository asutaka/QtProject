/****************************************************************************
** Meta object code from reading C++ file 'integartionvm.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../Integration/integartionvm.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'integartionvm.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_IntegartionVM_t {
    QByteArrayData data[9];
    char stringdata0[118];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_IntegartionVM_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_IntegartionVM_t qt_meta_stringdata_IntegartionVM = {
    {
QT_MOC_LITERAL(0, 0, 13), // "IntegartionVM"
QT_MOC_LITERAL(1, 14, 6), // "onLoad"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 12), // "onUpdateData"
QT_MOC_LITERAL(4, 35, 15), // "listSourceImage"
QT_MOC_LITERAL(5, 51, 14), // "QList<QPixmap>"
QT_MOC_LITERAL(6, 66, 25), // "listSourceBackgroundImage"
QT_MOC_LITERAL(7, 92, 14), // "listColumnType"
QT_MOC_LITERAL(8, 107, 10) // "QList<int>"

    },
    "IntegartionVM\0onLoad\0\0onUpdateData\0"
    "listSourceImage\0QList<QPixmap>\0"
    "listSourceBackgroundImage\0listColumnType\0"
    "QList<int>"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_IntegartionVM[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       2,   14, // methods
       3,   26, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    0,   24,    2, 0x02 /* Public */,
       3,    0,   25,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
       4, 0x80000000 | 5, 0x0009510b,
       6, 0x80000000 | 5, 0x0009510b,
       7, 0x80000000 | 8, 0x0009510b,

       0        // eod
};

void IntegartionVM::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        IntegartionVM *_t = static_cast<IntegartionVM *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->onLoad(); break;
        case 1: _t->onUpdateData(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QPixmap> >(); break;
        case 2:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<int> >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        IntegartionVM *_t = static_cast<IntegartionVM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QList<QPixmap>*>(_v) = _t->listSourceImage(); break;
        case 1: *reinterpret_cast< QList<QPixmap>*>(_v) = _t->listSourceBackgroundImage(); break;
        case 2: *reinterpret_cast< QList<int>*>(_v) = _t->listColumnType(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        IntegartionVM *_t = static_cast<IntegartionVM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setListSourceImage(*reinterpret_cast< QList<QPixmap>*>(_v)); break;
        case 1: _t->setListSourceBackgroundImage(*reinterpret_cast< QList<QPixmap>*>(_v)); break;
        case 2: _t->setListColumnType(*reinterpret_cast< QList<int>*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject IntegartionVM::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_IntegartionVM.data,
      qt_meta_data_IntegartionVM,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *IntegartionVM::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *IntegartionVM::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_IntegartionVM.stringdata0))
        return static_cast<void*>(const_cast< IntegartionVM*>(this));
    return QObject::qt_metacast(_clname);
}

int IntegartionVM::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
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
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
