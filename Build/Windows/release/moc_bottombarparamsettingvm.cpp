/****************************************************************************
** Meta object code from reading C++ file 'bottombarparamsettingvm.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../ParameterSetting/bottombarparamsettingvm.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'bottombarparamsettingvm.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_BottomBarParamSettingVM_t {
    QByteArrayData data[13];
    char stringdata0[173];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_BottomBarParamSettingVM_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_BottomBarParamSettingVM_t qt_meta_stringdata_BottomBarParamSettingVM = {
    {
QT_MOC_LITERAL(0, 0, 23), // "BottomBarParamSettingVM"
QT_MOC_LITERAL(1, 24, 17), // "txtBtnBackChanged"
QT_MOC_LITERAL(2, 42, 0), // ""
QT_MOC_LITERAL(3, 43, 8), // "QString&"
QT_MOC_LITERAL(4, 52, 3), // "arg"
QT_MOC_LITERAL(5, 56, 19), // "txtBtnSwitchChanged"
QT_MOC_LITERAL(6, 76, 17), // "txtBtnInfoChanged"
QT_MOC_LITERAL(7, 94, 18), // "txtBtnInputChanged"
QT_MOC_LITERAL(8, 113, 12), // "onUpdateLang"
QT_MOC_LITERAL(9, 126, 10), // "txtBtnBack"
QT_MOC_LITERAL(10, 137, 12), // "txtBtnSwitch"
QT_MOC_LITERAL(11, 150, 10), // "txtBtnInfo"
QT_MOC_LITERAL(12, 161, 11) // "txtBtnInput"

    },
    "BottomBarParamSettingVM\0txtBtnBackChanged\0"
    "\0QString&\0arg\0txtBtnSwitchChanged\0"
    "txtBtnInfoChanged\0txtBtnInputChanged\0"
    "onUpdateLang\0txtBtnBack\0txtBtnSwitch\0"
    "txtBtnInfo\0txtBtnInput"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_BottomBarParamSettingVM[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       4,   52, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    1,   39,    2, 0x06 /* Public */,
       5,    1,   42,    2, 0x06 /* Public */,
       6,    1,   45,    2, 0x06 /* Public */,
       7,    1,   48,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       8,    0,   51,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    4,
    QMetaType::Void, 0x80000000 | 3,    4,

 // methods: parameters
    QMetaType::Int,

 // properties: name, type, flags
       9, QMetaType::QString, 0x00495103,
      10, QMetaType::QString, 0x00495103,
      11, QMetaType::QString, 0x00495103,
      12, QMetaType::QString, 0x00495103,

 // properties: notify_signal_id
       0,
       1,
       2,
       3,

       0        // eod
};

void BottomBarParamSettingVM::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        BottomBarParamSettingVM *_t = static_cast<BottomBarParamSettingVM *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->txtBtnBackChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: _t->txtBtnSwitchChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 2: _t->txtBtnInfoChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 3: _t->txtBtnInputChanged((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: { int _r = _t->onUpdateLang();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (BottomBarParamSettingVM::*_t)(QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&BottomBarParamSettingVM::txtBtnBackChanged)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (BottomBarParamSettingVM::*_t)(QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&BottomBarParamSettingVM::txtBtnSwitchChanged)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (BottomBarParamSettingVM::*_t)(QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&BottomBarParamSettingVM::txtBtnInfoChanged)) {
                *result = 2;
                return;
            }
        }
        {
            typedef void (BottomBarParamSettingVM::*_t)(QString & );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&BottomBarParamSettingVM::txtBtnInputChanged)) {
                *result = 3;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        BottomBarParamSettingVM *_t = static_cast<BottomBarParamSettingVM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->txtBtnBack(); break;
        case 1: *reinterpret_cast< QString*>(_v) = _t->txtBtnSwitch(); break;
        case 2: *reinterpret_cast< QString*>(_v) = _t->txtBtnInfo(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->txtBtnInput(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        BottomBarParamSettingVM *_t = static_cast<BottomBarParamSettingVM *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setTxtBtnBack(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setTxtBtnSwitch(*reinterpret_cast< QString*>(_v)); break;
        case 2: _t->setTxtBtnInfo(*reinterpret_cast< QString*>(_v)); break;
        case 3: _t->setTxtBtnInput(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject BottomBarParamSettingVM::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_BottomBarParamSettingVM.data,
      qt_meta_data_BottomBarParamSettingVM,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *BottomBarParamSettingVM::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *BottomBarParamSettingVM::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_BottomBarParamSettingVM.stringdata0))
        return static_cast<void*>(const_cast< BottomBarParamSettingVM*>(this));
    return QObject::qt_metacast(_clname);
}

int BottomBarParamSettingVM::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 4;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 4;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void BottomBarParamSettingVM::txtBtnBackChanged(QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 0, _a);
}

// SIGNAL 1
void BottomBarParamSettingVM::txtBtnSwitchChanged(QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void BottomBarParamSettingVM::txtBtnInfoChanged(QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void BottomBarParamSettingVM::txtBtnInputChanged(QString & _t1)
{
    void *_a[] = { Q_NULLPTR, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}
QT_END_MOC_NAMESPACE
