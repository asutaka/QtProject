#ifndef GETPATHREPLACE_H
#define GETPATHREPLACE_H
#include <QtQuick/QQuickPaintedItem>
#include "imgprovider.h"

class GetPathReplace : public QQuickPaintedItem
{
    Q_OBJECT
public:
    GetPathReplace(QQuickItem* parent = 0);
    void paint(QPainter *painter);
    Q_INVOKABLE void setPath();
};

#endif // GETPATHREPLACE_H
