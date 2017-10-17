#include "parametersetting_listmodel.h"
#include <QDebug>
#include "mainwindow.h"
#include "globals.h"

ParameterSettingListModel::ParameterSettingListModel(QObject *parent)
    : QAbstractListModel(parent) {
    paramVM = new ParameterSettingVM();
    paramVM->UpdateLangParam();
    CreateData();
}

void ParameterSettingListModel::addParam(const ParameterSettingModel &m_model) {
    beginInsertRows(QModelIndex(), rowCount(), rowCount());
    m_models << m_model;
    endInsertRows();
}

int ParameterSettingListModel::rowCount(const QModelIndex &parent) const {
    Q_UNUSED(parent);
    return m_models.count();
}

QVariant ParameterSettingListModel::data(const QModelIndex & index, int role) const {
    if (index.row() < 0 || index.row() >= m_models.count())
        return QVariant();

    const ParameterSettingModel &model = m_models[index.row()];

    switch (role) {
        case SerialRoles:
            return model.GetSerial();
        case ParameterRoles:
            return model.GetParameter();
        case ValueRoles:
            return model.GetValue();
        case InfomationRoles:
            return model.GetInfomation();
        case TypeRoles:
            return model.GetType();
        default:
            break;
    }

    return QVariant();
}

QVariantMap ParameterSettingListModel::get(int i) const{
    QHash<int,QByteArray> data = roleNames();
    QHashIterator <int, QByteArray> a(data);
    QVariantMap res;
    while(a.hasNext()){
        a.next();
        QModelIndex idx = index(i, 0);

        QVariant data = idx.data(a.key());
        res[a.value()] = data;
        //qDebug() << a.key() << ": " << a.value() <<  endl;
    }
    return res;
}


QHash<int, QByteArray> ParameterSettingListModel::roleNames() const {
    QHash<int, QByteArray> roles;
    roles[SerialRoles] = SERIAL_COLUMN_NAME;
    roles[ParameterRoles] = PARAM_COLUMN_NAME;
    roles[ValueRoles] = VALUE_COLUMN_NAME;
    roles[InfomationRoles] = INFO_COLUMN_NAME;
    roles[TypeRoles] = TYPE_COLUMN_NAME;
    return roles;
}

bool ParameterSettingListModel::setData(const QModelIndex &index, const QVariant &value, int role)
{
    if(index.isValid()) {
        switch (role) {
            case SerialRoles:
                m_models[index.row()].SetSerial(value.toInt());
                break;
            case ParameterRoles:
                m_models[index.row()].SetParameter(value.toString());
                break;
            case ValueRoles:
                m_models[index.row()].SetValue(value.toString());
                break;
            case InfomationRoles:
                m_models[index.row()].SetInfomation(value.toString());
                break;
            case TypeRoles:
                m_models[index.row()].SetType(value.toInt());
                break;
            default:
                break;
        }
        emit dataChanged(index, index);
        return true;
    }
    return false;
}

void ParameterSettingListModel::setValue(const int &i, const QString &value) {
    QVariant tmp(value);
    setData(index(i, 0), tmp, ValueRoles);
}

QVariant ParameterSettingListModel::getValue(int i) const {
    return data(index(i, 0), ValueRoles);
}

QVariant ParameterSettingListModel::getType(int i) const {
    return data(index(i, 0), TypeRoles);
}

QVariant ParameterSettingListModel::getInfomation(int i) const {
    return data(index(i, 0), InfomationRoles);
}

void ParameterSettingListModel::CreateData() {
    addParam(ParameterSettingModel(
        paramVM->getR1SerialTitle(),
        paramVM->getR1ParameterTitle(),
        paramVM->getR1ValueTitle(),
        paramVM->getR1InfoTitle(),
        paramVM->getR1TypeTitle()
    ));
    addParam(ParameterSettingModel(
        paramVM->getR2SerialTitle(),
        paramVM->getR2ParameterTitle(),
        paramVM->getR2ValueTitle(),
        paramVM->getR2InfoTitle(),
        paramVM->getR2TypeTitle()
    ));
    addParam(ParameterSettingModel(
        paramVM->getR3SerialTitle(),
        paramVM->getR3ParameterTitle(),
        paramVM->getR3ValueTitle(),
        paramVM->getR3InfoTitle(),
        paramVM->getR3TypeTitle()
    ));
    addParam(ParameterSettingModel(
        paramVM->getR4SerialTitle(),
        paramVM->getR4ParameterTitle(),
        paramVM->getR4ValueTitle(),
        paramVM->getR4InfoTitle(),
        paramVM->getR4TypeTitle()
    ));
    addParam(ParameterSettingModel(
        paramVM->getR5SerialTitle(),
        paramVM->getR5ParameterTitle(),
        paramVM->getR5ValueTitle(),
        paramVM->getR5InfoTitle(),
        paramVM->getR5TypeTitle()
    ));
    addParam(ParameterSettingModel(
        paramVM->getR6SerialTitle(),
        paramVM->getR6ParameterTitle(),
        paramVM->getR6ValueTitle(),
        paramVM->getR6InfoTitle(),
        paramVM->getR6TypeTitle()
    ));
}

void ParameterSettingListModel::updateData() {
    paramVM->UpdateLangParam();
    setData(index(0, 0), paramVM->getR1ParameterTitle(), ParameterRoles);
    setData(index(1, 0), paramVM->getR2ParameterTitle(), ParameterRoles);
    setData(index(2, 0), paramVM->getR3ParameterTitle(), ParameterRoles);
    setData(index(3, 0), paramVM->getR4ParameterTitle(), ParameterRoles);
    setData(index(4, 0), paramVM->getR5ParameterTitle(), ParameterRoles);
    setData(index(5, 0), paramVM->getR6ParameterTitle(), ParameterRoles);
}
