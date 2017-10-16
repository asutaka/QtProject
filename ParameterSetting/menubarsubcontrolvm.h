#ifndef MENUBARSUBCONTROLVM_H
#define MENUBARSUBCONTROLVM_H

#include <QObject>
#include <QString>

#include "../Lang/lang.h"
#include "globals.h"
#include "mainwindow.h"

class MenuBarSubControlVM : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString txtAddress1 READ txtAddress1 WRITE setTxtAddress1 NOTIFY txtAddress1Changed)
    Q_PROPERTY(QString txtAddress2 READ txtAddress2 WRITE setTxtAddress2 NOTIFY txtAddress1Changed)
    Q_PROPERTY(QString txtAddress3 READ txtAddress3 WRITE setTxtAddress3 NOTIFY txtAddress1Changed)
    Q_PROPERTY(QString txtAddress4 READ txtAddress4 WRITE setTxtAddress4 NOTIFY txtAddress1Changed)
    Q_PROPERTY(float fontSizeDefault READ fontSizeDefault WRITE setFontSizeDefault NOTIFY fontSizeDefaultChanged)
    Q_PROPERTY(QString fontNameDefault READ fontNameDefault WRITE setFontNameDefault NOTIFY fontNameDefaultChanged)
    Q_PROPERTY(QString fontColorDefault READ fontColorDefault WRITE setFontColorDefault NOTIFY fontColorDefaultChanged)
public:
    explicit MenuBarSubControlVM(QObject *parent = 0);
    Q_INVOKABLE int onUpdateLang();
public:
    void setTxtAddress1(const QString &arg);
    QString txtAddress1() const;

    void setTxtAddress2(const QString &arg);
    QString txtAddress2() const;

    void setTxtAddress3(const QString &arg);
    QString txtAddress3() const;

    void setTxtAddress4(const QString &arg);
    QString txtAddress4() const;

    void setFontSizeDefault(const float &arg);
    float fontSizeDefault() const;

    void setFontNameDefault(const QString &arg);
    QString fontNameDefault() const;

    void setFontColorDefault(const QString &arg);
    QString fontColorDefault() const;
private:
    QString m_txtAddress1;
    QString m_txtAddress2;
    QString m_txtAddress3;
    QString m_txtAddress4;
    float m_fontSizeDefault;
    QString m_fontNameDefault;
    QString m_fontColorDefault;
private:
    Lang* langInstance;
signals:
    void txtAddress1Changed(QString &arg);
    void txtAddress2Changed(QString &arg);
    void txtAddress3Changed(QString &arg);
    void txtAddress4Changed(QString &arg);
    void fontSizeDefaultChanged(float &arg);
    void fontNameDefaultChanged(QString &arg);
    void fontColorDefaultChanged(QString &arg);
};

#endif // MENUBARSUBCONTROLVM_H
