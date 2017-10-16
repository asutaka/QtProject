#ifndef DRAWCONTROLBASE_H
#define DRAWCONTROLBASE_H

#include <QtQuick/QQuickPaintedItem>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QPainter>

class DrawControlBase : public QQuickPaintedItem
{
    Q_OBJECT
public:
    DrawControlBase(QQuickItem* parent = 0);
    ~DrawControlBase();

    void paint(QPainter *painter);

    bool isForLine;
    bool isR;
    bool isPass;
    int currentLine;

    Q_INVOKABLE void setNumSelect(int lineNo,int numSelect);
    // _screenID = 4 with XBarRS screen
    // _btnID = 0: switch All/ForLine, = 1: switch R/S; =2: switch All/Pass
    Q_INVOKABLE void getIsLeft(bool _isLeft, int _btnID, int _screenID);
    Q_INVOKABLE void getCurrentLine(int _currentLine);
    Q_INVOKABLE void getIntervalValue(int _interval);

private:

    QElapsedTimer startLoadTimer;
    QElapsedTimer drawTimer;
    int nMilliseconds;
    QTimer* timerDateTime;
    QTimer* timerDrawing;

    void DrawCom1(QPainter*);
    void DrawCom2(QPainter*);
    void DrawCom3(QPainter*);

protected:
    QPen pen;
    QFont font;
    QPixmap pixmap;

    //variable
    int lineNo=12;
    int numSelect=0;

signals:

public slots:
    void updateTime();
    void updateDraw();
};

#endif // DRAWCONTROLBASE_H
