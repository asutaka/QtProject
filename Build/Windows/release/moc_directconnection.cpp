/****************************************************************************
** Meta object code from reading C++ file 'directconnection.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../directconnection.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'directconnection.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_DirectConnection_t {
    QByteArrayData data[6];
    char stringdata0[58];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DirectConnection_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DirectConnection_t qt_meta_stringdata_DirectConnection = {
    {
QT_MOC_LITERAL(0, 0, 16), // "DirectConnection"
QT_MOC_LITERAL(1, 17, 6), // "source"
QT_MOC_LITERAL(2, 24, 11), // "destination"
QT_MOC_LITERAL(3, 36, 6), // "signal"
QT_MOC_LITERAL(4, 43, 4), // "slot"
QT_MOC_LITERAL(5, 48, 9) // "isConnect"

    },
    "DirectConnection\0source\0destination\0"
    "signal\0slot\0isConnect"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DirectConnection[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       5,   14, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // properties: name, type, flags
       1, QMetaType::QObjectStar, 0x00095103,
       2, QMetaType::QObjectStar, 0x00095103,
       3, QMetaType::QString, 0x00095103,
       4, QMetaType::QString, 0x00095103,
       5, QMetaType::Bool, 0x00095103,

       0        // eod
};

void DirectConnection::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{

#ifndef QT_NO_PROPERTIES
    if (_c == QMetaObject::ReadProperty) {
        DirectConnection *_t = static_cast<DirectConnection *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QObject**>(_v) = _t->getSource(); break;
        case 1: *reinterpret_cast< QObject**>(_v) = _t->getDestination(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->getSignal(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->getSlot(); break;
        case 4: *reinterpret_cast< bool*>(_v) = _t->getIsConnect(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        DirectConnection *_t = static_cast<DirectConnection *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setSource(*reinterpret_cast< QObject**>(_v)); break;
        case 1: _t->setDestination(*reinterpret_cast< QObject**>(_v)); break;
        case 2: _t->setSignal(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setSlot(*reinterpret_cast< QString*>(_v)); break;
        case 4: _t->setIsConnect(*reinterpret_cast< bool*>(_v)); break;
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

const QMetaObject DirectConnection::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_DirectConnection.data,
      qt_meta_data_DirectConnection,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *DirectConnection::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DirectConnection::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_DirectConnection.stringdata0))
        return static_cast<void*>(const_cast< DirectConnection*>(this));
    return QObject::qt_metacast(_clname);
}

int DirectConnection::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    
#ifndef QT_NO_PROPERTIES
   if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 5;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
