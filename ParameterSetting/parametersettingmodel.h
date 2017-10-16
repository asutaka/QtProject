#ifndef PARAMSETTINGMODEL_H
#define PARAMSETTINGMODEL_H

#include <QString>

class ParameterSettingModel
{
public:
    ParameterSettingModel();
    ParameterSettingModel(const int &_serial, const QString &_param, const QString &_value, const QString &_info, const int &_type);
private:
    int m_serial;
    QString m_parameter;
    QString m_value;
    QString m_infomation;
    int m_type;
public:
    void SetSerial(const int &arg);
    int GetSerial() const;

    void SetParameter(const QString &arg);
    QString GetParameter() const;

    void SetValue(const QString &arg);
    QString GetValue() const;

    void SetInfomation(const QString &arg);
    QString GetInfomation() const;

    void SetType(const int &arg);
    int GetType() const;
};

#endif // PARAMSETTINGMODEL_H
