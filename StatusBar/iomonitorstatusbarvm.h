#ifndef STATUSBARIOMONITORVM_H
#define STATUSBARIOMONITORVM_H
#include <QObject>

class IOMonitorStatusBarVM: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString txtTrigerConditionTitle READ txtTrigerConditionTitle CONSTANT)
    Q_PROPERTY(QString txtTrigerNoTitle READ txtTrigerNoTitle CONSTANT)
    Q_PROPERTY(QString txtSignalTypeTitle READ txtSignalTypeTitle CONSTANT)
    Q_PROPERTY(QString txtDisplayTitle READ txtDisplayTitle CONSTANT)
    Q_PROPERTY(QString txtScreenName2 READ txtScreenName2 CONSTANT)
    Q_PROPERTY(QString txtScreenName READ txtScreenName CONSTANT)
    Q_PROPERTY(QString txtStart READ txtStart CONSTANT)
    Q_PROPERTY(QString txtStop READ txtStop CONSTANT)
    Q_PROPERTY(QString valueDisplay READ valueDisplay CONSTANT)
    Q_PROPERTY(QString valueTrigerCondition READ valueTrigerCondition CONSTANT)
    Q_PROPERTY(QString valueTrigerNo READ valueTrigerNo CONSTANT)
    Q_PROPERTY(QString valueSignalType READ valueSignalType CONSTANT)

public:
    explicit IOMonitorStatusBarVM(QObject*parent = 0);
    QString txtTrigerConditionTitle();
    void setTxtTrigerConditionTitle(QString &value);
    QString txtTrigerNoTitle();
    void setTxtTrigerNoTitle(QString &value);
    QString txtSignalTypeTitle();
    void setTxtSignalTypeTitle(QString &value);
    QString txtDisplayTitle();
    void setTxtDisplayTitle(QString &value);
    QString txtScreenName2();
    void setTxtScreenName2(QString &value);
    QString txtScreenName();
    void setTxtScreenName(QString &value);
    QString txtStart();
    void setTxtStart(QString &value);
    QString txtStop();
    void setTxtStop(QString &value);
    QString valueDisplay();
    void setValueDisplay(QString &value);
    QString valueTrigerCondition();
    void setValueTrigerCondition(QString &value);
    QString valueTrigerNo();
    void setValueTrigerNo(QString &value);
    QString valueSignalType();
    void setValueSignalType(QString &value);

    Q_INVOKABLE void onLoad();
    Q_INVOKABLE int onChangeLanguage();

private:
    QString m_TxtDisplayTitle;
    QString m_TxtTrigerConditionTitle;
    QString m_TxtTrigerNoTitle;
    QString m_TxtSignalTypeTitle;
    QString m_TxtScreenName2;
    QString m_TxtScreenName;
    QString m_TxtStart;
    QString m_TxtStop;
    QString m_ValueDisplay;
    QString m_ValueTrigerCondition;
    QString m_ValueTrigerNo;
    QString m_ValueSignalType;

};

#endif // STATUSBARIOMONITORVM_H
