#include "parametersettingmodel.h"

ParameterSettingModel::ParameterSettingModel() {
    m_serial = 0;
    m_parameter = "";
    m_value = "";
    m_infomation = "";
    m_type = 0;
}

ParameterSettingModel::ParameterSettingModel(const int &_serial, const QString &_param, const QString &_value, const QString &_info, const int &_type) {
    m_serial = _serial;
    m_parameter = _param;
    m_value = _value;
    m_infomation = _info;
    m_type = _type;
}

void ParameterSettingModel::SetSerial(const int &arg) {
    m_serial = arg;
}

int ParameterSettingModel::GetSerial() const {
    return m_serial;
}

void ParameterSettingModel::SetParameter(const QString &arg) {
    m_parameter = arg;
}

QString ParameterSettingModel::GetParameter() const {
    return m_parameter;
}

void ParameterSettingModel::SetValue(const QString &arg) {
    m_value = arg;
}

QString ParameterSettingModel::GetValue() const {
    return m_value;
}

void ParameterSettingModel::SetInfomation(const QString &arg) {
    m_infomation = arg;
}

QString ParameterSettingModel::GetInfomation() const {
    return m_infomation;
}

void ParameterSettingModel::SetType(const int &arg) {
    m_type = arg;
}

int ParameterSettingModel::GetType() const {
    return m_type;
}
