/****************************************************************************
** Meta object code from reading C++ file 'dynamiccorrection.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../DynamicCorrection/dynamiccorrection.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'dynamiccorrection.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_DynamicCorrection_t {
    QByteArrayData data[21];
    char stringdata0[209];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_DynamicCorrection_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_DynamicCorrection_t qt_meta_stringdata_DynamicCorrection = {
    {
QT_MOC_LITERAL(0, 0, 17), // "DynamicCorrection"
QT_MOC_LITERAL(1, 18, 13), // "onClickScreen"
QT_MOC_LITERAL(2, 32, 0), // ""
QT_MOC_LITERAL(3, 33, 1), // "x"
QT_MOC_LITERAL(4, 35, 1), // "y"
QT_MOC_LITERAL(5, 37, 14), // "getCurrentLine"
QT_MOC_LITERAL(6, 52, 12), // "_currentLine"
QT_MOC_LITERAL(7, 65, 13), // "enablebtnBack"
QT_MOC_LITERAL(8, 79, 15), // "enablebtnFinish"
QT_MOC_LITERAL(9, 95, 13), // "enablebtnRedo"
QT_MOC_LITERAL(10, 109, 8), // "getValue"
QT_MOC_LITERAL(11, 118, 14), // "QList<QString>"
QT_MOC_LITERAL(12, 133, 4), // "list"
QT_MOC_LITERAL(13, 138, 9), // "clearData"
QT_MOC_LITERAL(14, 148, 14), // "changeProdMode"
QT_MOC_LITERAL(15, 163, 6), // "status"
QT_MOC_LITERAL(16, 170, 4), // "Wait"
QT_MOC_LITERAL(17, 175, 3), // "End"
QT_MOC_LITERAL(18, 179, 6), // "NotEnd"
QT_MOC_LITERAL(19, 186, 11), // "ErrorFinish"
QT_MOC_LITERAL(20, 198, 10) // "Initialize"

    },
    "DynamicCorrection\0onClickScreen\0\0x\0y\0"
    "getCurrentLine\0_currentLine\0enablebtnBack\0"
    "enablebtnFinish\0enablebtnRedo\0getValue\0"
    "QList<QString>\0list\0clearData\0"
    "changeProdMode\0status\0Wait\0End\0NotEnd\0"
    "ErrorFinish\0Initialize"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_DynamicCorrection[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       1,   74, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    2,   54,    2, 0x02 /* Public */,
       5,    1,   59,    2, 0x02 /* Public */,
       7,    0,   62,    2, 0x02 /* Public */,
       8,    0,   63,    2, 0x02 /* Public */,
       9,    1,   64,    2, 0x02 /* Public */,
      10,    1,   67,    2, 0x02 /* Public */,
      13,    1,   70,    2, 0x02 /* Public */,
      14,    0,   73,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::Int, QMetaType::Float, QMetaType::Float,    3,    4,
    QMetaType::Void, QMetaType::Int,    6,
    QMetaType::Bool,
    QMetaType::Bool,
    QMetaType::Bool, QMetaType::Int,    6,
    QMetaType::Void, 0x80000000 | 11,   12,
    QMetaType::Void, QMetaType::Int,    6,
    QMetaType::Bool,

 // enums: name, flags, count, data
      15, 0x0,    5,   78,

 // enum data: key, value
      16, uint(DynamicCorrection::Wait),
      17, uint(DynamicCorrection::End),
      18, uint(DynamicCorrection::NotEnd),
      19, uint(DynamicCorrection::ErrorFinish),
      20, uint(DynamicCorrection::Initialize),

       0        // eod
};

void DynamicCorrection::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        DynamicCorrection *_t = static_cast<DynamicCorrection *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { int _r = _t->onClickScreen((*reinterpret_cast< float(*)>(_a[1])),(*reinterpret_cast< float(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = _r; }  break;
        case 1: _t->getCurrentLine((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 2: { bool _r = _t->enablebtnBack();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 3: { bool _r = _t->enablebtnFinish();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 4: { bool _r = _t->enablebtnRedo((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        case 5: _t->getValue((*reinterpret_cast< QList<QString>(*)>(_a[1]))); break;
        case 6: _t->clearData((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 7: { bool _r = _t->changeProdMode();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = _r; }  break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 5:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QString> >(); break;
            }
            break;
        }
    }
}

const QMetaObject DynamicCorrection::staticMetaObject = {
    { &QQuickPaintedItem::staticMetaObject, qt_meta_stringdata_DynamicCorrection.data,
      qt_meta_data_DynamicCorrection,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *DynamicCorrection::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *DynamicCorrection::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_DynamicCorrection.stringdata0))
        return static_cast<void*>(const_cast< DynamicCorrection*>(this));
    return QQuickPaintedItem::qt_metacast(_clname);
}

int DynamicCorrection::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickPaintedItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    return _id;
}
QT_END_MOC_NAMESPACE
