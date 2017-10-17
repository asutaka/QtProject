#ifndef BOTTOMBARIOMONITORVM_H
#define BOTTOMBARIOMONITORVM_H

#include <QObject>

class BottomBarIOMonitorVM: public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString txtClear READ txtClear CONSTANT)
    Q_PROPERTY(QString txtStartImport READ txtStartImport CONSTANT)
    Q_PROPERTY(QString txtStopImport READ txtStopImport CONSTANT)
    Q_PROPERTY(QString txtSignalSelection READ txtSignalSelection CONSTANT)
    Q_PROPERTY(QString txtSignalCondition READ txtSignalCondition CONSTANT)
    Q_PROPERTY(QString txtBack READ txtBack CONSTANT)
public:
    explicit BottomBarIOMonitorVM(QObject*parent = 0);
    QString txtClear();
    void setTxtClear(QString &value);
    QString txtStartImport();
    void setTxtStartImport(QString &value);
    QString txtStopImport();
    void setTxtStopImport(QString &value);
    QString txtSignalSelection();
    void setTxtSignalSelection(QString &value);
    QString txtSignalCondition();
    void setTxtSignalCondition(QString &value);
    QString txtBack();
    void setTxtBack(QString &value);

    Q_INVOKABLE void onLoad();
    Q_INVOKABLE int onChangeLanguage();

private:
    QString m_TxtClear;
    QString m_TxtStartImport;
    QString m_TxtStopImport;
    QString m_TxtSignalSelection;
    QString m_TxtSignalCondition;
    QString m_TxtBack;
};

#endif // BOTTOMBARIOMONITORVM_H
