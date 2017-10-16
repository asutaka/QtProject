#ifndef PRODUCTION_H
#define PRODUCTION_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include <QQuickItem>
//#include "Control/lineImage/lineimage.h"

class Production : public QQuickPaintedItem
{
    Q_OBJECT

public:
    Production(QQuickItem* parent = 0);
    ~Production();
    void paint(QPainter *painter);
    static void qmlRegisterType();
    Q_INVOKABLE void updateView(QString weight);
private:
    QPixmap pixmap1;
    QPixmap pixmap2;
    QPixmap pixmap3;
    QPixmap pixmap4;
    QPixmap pixmap5;
    QPixmap pixmap6;
    QPixmap pixmap7;
    QString strWeight= "0";
    void DrawMainContent(QPainter *qp);
    void LoadImages();
signals:
public slots:
protected:
};
#endif // PRODUCTION_H
