#ifndef PARAMETERSETTINGVM_H
#define PARAMETERSETTINGVM_H

#include <QObject>
#include <QString>
#include <QStringListModel>
#include <QAbstractListModel>

#include "parametersettingmodel.h"
#include "parametersettingvm.h"

class ParameterSettingListModel : public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int count READ rowCount CONSTANT)
public:
    enum ParamRoles {
        SerialRoles = Qt::UserRole,
        ParameterRoles,
        ValueRoles,
        InfomationRoles,
        TypeRoles,
    };
public:
    ParameterSettingListModel(QObject *parent = 0);
    void CreateData();
public:
    Q_INVOKABLE QVariant getType(int i) const;
    Q_INVOKABLE QVariant getInfomation(int i) const;
    Q_INVOKABLE QVariant getValue(int i) const;
    Q_INVOKABLE QVariantMap get(int i) const;
    Q_INVOKABLE void setValue(const int &i, const QString &value);
    Q_INVOKABLE void updateData();
public:
    void addParam(const ParameterSettingModel &m_model);
    int rowCount(const QModelIndex &parent = QModelIndex()) const;
    QVariant data(const QModelIndex &index, int role = Qt::DisplayRole) const;
    bool setData(const QModelIndex &index, const QVariant &value, int role);
protected:
    QHash<int, QByteArray> roleNames() const;
private:
    QList<ParameterSettingModel> m_models;
    ParameterSettingVM *paramVM;
};

#endif // PARAMETERSETTINGVM_H
