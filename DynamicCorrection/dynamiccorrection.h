#ifndef DYNAMICCORRECTION_H
#define DYNAMICCORRECTION_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QList>
#include "Control/lineImage/lineimage.h"
#include <QPainter>

class DynamicCorrection : public QQuickPaintedItem
{
    Q_OBJECT
    Q_ENUMS(status)
public:
    DynamicCorrection(QQuickItem* parrent = 0);
    ~DynamicCorrection();

    enum status {Wait = 0,
                 End = 1,
                 NotEnd = 2,
                 ErrorFinish = 3,
                 Initialize = 4};
    void paint(QPainter *painter);

    Q_INVOKABLE int onClickScreen(float x, float y);
    Q_INVOKABLE void getCurrentLine(int _currentLine);
    Q_INVOKABLE bool enablebtnBack();
    Q_INVOKABLE bool enablebtnFinish();
    Q_INVOKABLE bool enablebtnRedo(int _currentLine);
    Q_INVOKABLE void getValue(QList<QString> list);
    Q_INVOKABLE void clearData(int _currentLine);
    Q_INVOKABLE bool changeProdMode();

private:
    int maxLine;
    bool prodMod; //if Ordinary mode, return prodMode = false.
    bool isValid;
    int machineState;
    QString listValue[12];

    int isStatus[12];
    int leftTableHeight;
    int sampleMax = 10;
    int currentLine;
    int sampleCount[12];

    QString titleStr1;
    QString titleStr2;

    QPixmap arrayPixmapLineNo[12];
    QPixmap arrayPixmapLineNo_out[12];
    QPixmap arrayPixmapLineNo_on[12];
    QPixmap pixmapLineNo;

    QPen orangePen;
    QPen whitePen;
    QPen grayPen;
    QPen bluePen;
\
    int getCurrentWeight(int line);
    int getWeightBuff(int line);
    float getCoeffic(int line);
    void DrawTitle(QPainter *qp);
    void DrawContent(QPainter *qp);
    void DrawOneRow(int line, QPoint pos, QPainter *qp, int _maxHeight);
    void GetImageLineNo(int line);
    void LoadImages();
    void updateDraw();

public slots:

};
#endif // DYNAMICCORRECTION_H
