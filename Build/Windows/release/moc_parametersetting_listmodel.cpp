/****************************************************************************
** Meta object code from reading C++ file 'parametersetting_listmodel.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.7.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../../ParameterSetting/parametersetting_listmodel.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'parametersetting_listmodel.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.7.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
struct qt_meta_stringdata_ParameterSettingListModel_t {
    QByteArrayData data[9];
    char stringdata0[86];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_ParameterSettingListModel_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_ParameterSettingListModel_t qt_meta_stringdata_ParameterSettingListModel = {
    {
QT_MOC_LITERAL(0, 0, 25), // "ParameterSettingListModel"
QT_MOC_LITERAL(1, 26, 7), // "getType"
QT_MOC_LITERAL(2, 34, 0), // ""
QT_MOC_LITERAL(3, 35, 1), // "i"
QT_MOC_LITERAL(4, 37, 13), // "getInfomation"
QT_MOC_LITERAL(5, 51, 8), // "getValue"
QT_MOC_LITERAL(6, 60, 8), // "setValue"
QT_MOC_LITERAL(7, 69, 5), // "value"
QT_MOC_LITERAL(8, 75, 10) // "updateData"

    },
    "ParameterSettingListModel\0getType\0\0i\0"
    "getInfomation\0getValue\0setValue\0value\0"
    "updateData"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ParameterSettingListModel[] = {

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
       5,    1,   45,    2, 0x02 /* Public */,
       6,    2,   48,    2, 0x02 /* Public */,
       8,    0,   53,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QVariant, QMetaType::Int,    3,
    QMetaType::QVariant, QMetaType::Int,    3,
    QMetaType::QVariant, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int, QMetaType::QString,    3,    7,
    QMetaType::Void,

       0        // eod
};

void ParameterSettingListModel::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        ParameterSettingListModel *_t = static_cast<ParameterSettingListModel *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { QVariant _r = _t->getType((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariant*>(_a[0]) = _r; }  break;
        case 1: { QVariant _r = _t->getInfomation((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariant*>(_a[0]) = _r; }  break;
        case 2: { QVariant _r = _t->getValue((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariant*>(_a[0]) = _r; }  break;
        case 3: _t->setValue((*reinterpret_cast< const int(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 4: _t->updateData(); break;
        default: ;
        }
    }
}

const QMetaObject ParameterSettingListModel::staticMetaObject = {
    { &QAbstractListModel::staticMetaObject, qt_meta_stringdata_ParameterSettingListModel.data,
      qt_meta_data_ParameterSettingListModel,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *ParameterSettingListModel::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *ParameterSettingListModel::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_ParameterSettingListModel.stringdata0))
        return static_cast<void*>(const_cast< ParameterSettingListModel*>(this));
    return QAbstractListModel::qt_metacast(_clname);
}

int ParameterSettingListModel::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QAbstractListModel::qt_metacall(_c, _id, _a);
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
    return _id;
}
QT_END_MOC_NAMESPACE