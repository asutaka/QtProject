#ifndef SWITCHCONTROLVER5_H
#define SWITCHCONTROLVER5_H
#include <QtQuick/QQuickPaintedItem>
#include <QPainter>
#include <../Lang/lang.h>

class SwitchControlVer5 :public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString isProd READ isProd CONSTANT)
    Q_PROPERTY(QString isXbar READ isXbar CONSTANT)

public:
    explicit SwitchControlVer5(QObject*parent = 0);
    QString isProd();
    void isProd(QString &value);
    QString isXbar();
    void isXbar(QString &value);
    Q_INVOKABLE int OnChangeLanguage();

private:
    QString m_isProd;
    QString m_isXbar;
};

#endif // SWITCHCONTROLVER5_H
