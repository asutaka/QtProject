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
    QByteArrayData data[11];
    char stringdata0[96];
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
QT_MOC_LITERAL(6, 60, 3), // "get"
QT_MOC_LITERAL(7, 64, 8), // "setValue"
QT_MOC_LITERAL(8, 73, 5), // "value"
QT_MOC_LITERAL(9, 79, 10), // "updateData"
QT_MOC_LITERAL(10, 90, 5) // "count"

    },
    "ParameterSettingListModel\0getType\0\0i\0"
    "getInfomation\0getValue\0get\0setValue\0"
    "value\0updateData\0count"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_ParameterSettingListModel[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       1,   62, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // methods: name, argc, parameters, tag, flags
       1,    1,   44,    2, 0x02 /* Public */,
       4,    1,   47,    2, 0x02 /* Public */,
       5,    1,   50,    2, 0x02 /* Public */,
       6,    1,   53,    2, 0x02 /* Public */,
       7,    2,   56,    2, 0x02 /* Public */,
       9,    0,   61,    2, 0x02 /* Public */,

 // methods: parameters
    QMetaType::QVariant, QMetaType::Int,    3,
    QMetaType::QVariant, QMetaType::Int,    3,
    QMetaType::QVariant, QMetaType::Int,    3,
    QMetaType::QVariantMap, QMetaType::Int,    3,
    QMetaType::Void, QMetaType::Int, QMetaType::QString,    3,    8,
    QMetaType::Void,

 // properties: name, type, flags
      10, QMetaType::Int, 0x00095401,

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
        case 3: { QVariantMap _r = _t->get((*reinterpret_cast< int(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QVariantMap*>(_a[0]) = _r; }  break;
        case 4: _t->setValue((*reinterpret_cast< const int(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2]))); break;
        case 5: _t->updateData(); break;
        default: ;
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        ParameterSettingListModel *_t = static_cast<ParameterSettingListModel *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->rowCount(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
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
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 6;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}
QT_END_MOC_NAMESPACE
