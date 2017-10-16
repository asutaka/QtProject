#ifndef PARAMETERSETTING_H
#define PARAMETERSETTING_H

#include <QObject>
#include <QString>

#include "../Lang/lang.h"
#include "globals.h"
#include "mainwindow.h"
#include "bottombarparamsettingvm.h"

class ParameterSettingVM : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString txtHSerial READ txtHSerial WRITE setTxtHSerial NOTIFY txtHSerialChanged)
    Q_PROPERTY(QString txtHParam READ txtHParam WRITE setTxtHParam NOTIFY txtHParamChanged)
    Q_PROPERTY(QString txtHValue READ txtHValue WRITE setTxtHValue NOTIFY txtHValueChanged)
    Q_PROPERTY(QString txtHType READ txtHType WRITE setTxtHType NOTIFY txtHTypeChanged)
    Q_PROPERTY(QString txtCSerial READ txtCSerial WRITE setTxtCSerial NOTIFY txtCSerialChanged)
    Q_PROPERTY(QString txtCParam READ txtCParam WRITE setTxtCParam NOTIFY txtCParamChanged)
    Q_PROPERTY(QString txtCValue READ txtCValue WRITE setTxtCValue NOTIFY txtCValueChanged)
    Q_PROPERTY(QString txtForline READ txtForline WRITE setTxtForline NOTIFY txtForlineChanged)
public:
    explicit ParameterSettingVM(QObject *parent = 0);
    ~ParameterSettingVM();
    Q_INVOKABLE void OnLoad();
    Q_INVOKABLE int onUpdateLang();
    Q_INVOKABLE int onUpdateColumnName();
    void UpdateLangParam();
public:
    void setTxtHSerial(const QString &arg);
    QString txtHSerial() const;

    void setTxtHParam(const QString &arg);
    QString txtHParam() const;

    void setTxtHValue(const QString &arg);
    QString txtHValue() const;

    void setTxtHType(const QString &arg);
    QString txtHType() const;

    void setTxtCSerial(const QString &arg);
    QString txtCSerial() const;

    void setTxtCParam(const QString &arg);
    QString txtCParam() const;

    void setTxtCValue(const QString &arg);
    QString txtCValue() const;

    void setTxtForline(const QString &arg);
    QString txtForline() const;
public:
    int getR1SerialTitle() const;
    int getR2SerialTitle() const;
    int getR3SerialTitle() const;
    int getR4SerialTitle() const;
    int getR5SerialTitle() const;
    int getR6SerialTitle() const;
    QString getR1ParameterTitle() const;
    QString getR2ParameterTitle() const;
    QString getR3ParameterTitle() const;
    QString getR4ParameterTitle() const;
    QString getR5ParameterTitle() const;
    QString getR6ParameterTitle() const;
    QString getR1ValueTitle() const;
    QString getR2ValueTitle() const;
    QString getR3ValueTitle() const;
    QString getR4ValueTitle() const;
    QString getR5ValueTitle() const;
    QString getR6ValueTitle() const;
    QString getR1InfoTitle() const;
    QString getR2InfoTitle() const;
    QString getR3InfoTitle() const;
    QString getR4InfoTitle() const;
    QString getR5InfoTitle() const;
    QString getR6InfoTitle() const;
    int getR1TypeTitle() const;
    int getR2TypeTitle() const;
    int getR3TypeTitle() const;
    int getR4TypeTitle() const;
    int getR5TypeTitle() const;
    int getR6TypeTitle() const;
private:
    QString m_txtHSerial;
    QString m_txtHParameter;
    QString m_txtHValue;
    QString m_txtHType;
    QString m_txtCSerial;
    QString m_txtCParam;
    QString m_txtCValue;
    QString m_txtForLine;
private:
    int m_txtR1SerialTitle;
    int m_txtR2SerialTitle;
    int m_txtR3SerialTitle;
    int m_txtR4SerialTitle;
    int m_txtR5SerialTitle;
    int m_txtR6SerialTitle;
    QString m_txtR1ParameterTitle;
    QString m_txtR2ParameterTitle;
    QString m_txtR3ParameterTitle;
    QString m_txtR4ParameterTitle;
    QString m_txtR5ParameterTitle;
    QString m_txtR6ParameterTitle;
    QString m_txtR1ValueTitle;
    QString m_txtR2ValueTitle;
    QString m_txtR3ValueTitle;
    QString m_txtR4ValueTitle;
    QString m_txtR5ValueTitle;
    QString m_txtR6ValueTitle;
    QString m_txtR1InfoTitle;
    QString m_txtR2InfoTitle;
    QString m_txtR3InfoTitle;
    QString m_txtR4InfoTitle;
    QString m_txtR5InfoTitle;
    QString m_txtR6InfoTitle;
    int m_txtR1TypeTitle;
    int m_txtR2TypeTitle;
    int m_txtR3TypeTitle;
    int m_txtR4TypeTitle;
    int m_txtR5TypeTitle;
    int m_txtR6TypeTitle;
private:
    Lang* langInstance;

signals:
    void txtHSerialChanged(QString &arg);
    void txtHParamChanged(QString &arg);
    void txtHValueChanged(QString &arg);
    void txtHTypeChanged(QString &arg);
    void txtCSerialChanged(QString &arg);
    void txtCParamChanged(QString &arg);
    void txtCValueChanged(QString &arg);
    void txtForlineChanged(QString &arg);
};

#endif // PARAMETERSETTING_H
