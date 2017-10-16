#ifndef CW_H
#define CW_H

#include "Control/drawControlBase/drawcontrolbase_ver6.h"
#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include <QPainter>

class CW : public DrawControlBase_ver6
{
    Q_OBJECT

public:
    CW(QQuickItem* parent = 0);
    ~CW();

    void paint(QPainter *painter);

private:
    QPixmap _arrMassbarBargraph[4];
    QPixmap _arrAverageBarLimit[2];
    QPixmap _arrLine[4];
    QPixmap _arrResult[4];

    void DrawContent(QPainter *painter);
    void LoadImages();
};

#endif // CW_H
