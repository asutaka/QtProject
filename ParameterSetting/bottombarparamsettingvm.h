#ifndef BOTTOMBARPARAMSETTINGVM_H
#define BOTTOMBARPARAMSETTINGVM_H

#include <QObject>
#include <QString>

#include "../Lang/lang.h"
#include "globals.h"
#include "mainwindow.h"

class BottomBarParamSettingVM : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString txtBtnBack READ txtBtnBack WRITE setTxtBtnBack NOTIFY txtBtnBackChanged)
    Q_PROPERTY(QString txtBtnSwitch READ txtBtnSwitch WRITE setTxtBtnSwitch NOTIFY txtBtnSwitchChanged)
    Q_PROPERTY(QString txtBtnInfo READ txtBtnInfo WRITE setTxtBtnInfo NOTIFY txtBtnInfoChanged)
    Q_PROPERTY(QString txtBtnInput READ txtBtnInput WRITE setTxtBtnInput NOTIFY txtBtnInputChanged)
public:
    BottomBarParamSettingVM();
    Q_INVOKABLE int onUpdateLang();
public:
    void setTxtBtnBack(const QString &arg);
    QString txtBtnBack() const;

    void setTxtBtnSwitch(const QString &arg);
    QString txtBtnSwitch() const;

    void setTxtBtnInfo(const QString &arg);
    QString txtBtnInfo() const;

    void setTxtBtnInput(const QString &arg);
    QString txtBtnInput() const;
private:
    QString m_txtBtnBack;
    QString m_txtBtnSwitch;
    QString m_txtBtnInfo;
    QString m_txtBtnInput;
private:
    Lang* langInstance;
signals:
    void txtBtnBackChanged(QString &arg);
    void txtBtnSwitchChanged(QString &arg);
    void txtBtnInfoChanged(QString &arg);
    void txtBtnInputChanged(QString &arg);
};

#endif // BOTTOMBARPARAMSETTINGVM_H
