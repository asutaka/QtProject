/****************************************************************************
** Meta object code from reading C++ file 'inputmasterwork.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../DynamicCorrection/inputmasterwork.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'inputmasterwork.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_InputMasterWork_t {
    QByteArrayData data[12];
    char stringdata0[131];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_InputMasterWork_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_InputMasterWork_t qt_meta_stringdata_InputMasterWork = {
    {
QT_MOC_LITERAL(0, 0, 15), // "InputMasterWork"
QT_MOC_LITERAL(1, 16, 8), // "getValue"
QT_MOC_LITERAL(2, 25, 0), // ""
QT_MOC_LITERAL(3, 26, 8), // "txtInput"
QT_MOC_LITERAL(4, 35, 14), // "getCurrentLine"
QT_MOC_LITERAL(5, 50, 4), // "line"
QT_MOC_LITERAL(6, 55, 12), // "getIsForLine"
QT_MOC_LITERAL(7, 68, 10), // "_isForLine"
QT_MOC_LITERAL(8, 79, 18), // "sendValueToDynamic"
QT_MOC_LITERAL(9, 98, 14), // "QList<QString>"
QT_MOC_LITERAL(10, 113, 12), // "getListValue"
QT_MOC_LITERAL(11, 126, 4) // "list"

    },
    "InputMasterWork\0getValue\0\0txtInput\0"
    "getCurrentLine\0line\0getIsForLine\0"
    "_isForLine\0sendValueToDynamic\0"
    "QList<QString>\0getListValue\0list"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_InputMasterWork[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   39,    2, 0x02 /* Public */,
       4,    1,   42,    2, 0x02 /* Public */,
       6,    1,   45,    2, 0x02 /* Public */,
       8,    0,   48,    2, 0x02 /* Public */,
      10,    1,   49,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Void, QMetaType::QString,    3,
    QMetaType::Int, QMetaType::Int,    5,
    QMetaType::Void, QMetaType::Bool,    7,
    0x80000000 | 9,
    QMetaType::Void, 0x80000000 | 9,   11,

       0        // eod
};

void InputMasterWork::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        InputMasterWork *_t = static_cast<InputMasterWork *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->getValue((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 1: { int _r = _t->getCurrentLine((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 2: _t->getIsForLine((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 3: { QList<QString> _r = _t->sendValueToDynamic();
            if (_a[0]) *reinterpret_cast< QList<QString>*>(_a[0]) = _r; }  break;
        case 4: _t->getListValue((*reinterpret_cast< QList<QString>(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 4:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QString> >(); break;
            }
            break;
        }
    }
}

const QMetaObject InputMasterWork::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_InputMasterWork.data,
      qt_meta_data_InputMasterWork,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *InputMasterWork::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *InputMasterWork::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_InputMasterWork.stringdata0))
        return static_cast<void*>(const_cast< InputMasterWork*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int InputMasterWork::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    }
    return _id;
}
QT_END_MOC_NAMESPACE