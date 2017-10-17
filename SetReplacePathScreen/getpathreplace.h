#ifndef GETPATHREPLACE_H
#define GETPATHREPLACE_H
#include <QtQuick/QQuickPaintedItem>
#include "imgprovider.h"
#include "QSysInfo"

class GetPathReplace : public QQuickPaintedItem {
    Q_OBJECT
public:
    GetPathReplace(QQuickItem* parent = 0);
    void paint(QPainter *painter);
    Q_INVOKABLE void setPath();
    Q_INVOKABLE void settingApp(QString dir);
    Q_INVOKABLE bool isAndroid();
    bool _isAndroid;
};

#endif // GETPATHREPLACE_H
