#ifndef DRAWCONTROLBASE_VER3_H
#define DRAWCONTROLBASE_VER3_H
#include <QtQuick/QQuickPaintedItem>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QPainter>

class DrawControlBase_Ver3 : public QQuickPaintedItem
{
    Q_OBJECT
public:
    DrawControlBase_Ver3(QQuickItem* parent = 0);
    ~DrawControlBase_Ver3();

    void paint(QPainter *painter);

    bool isForLine;
    bool isR;
    bool isPass;
    int currentLine;

    // _screenID = 4 with XBarRS screen
    // _btnID = 0: switch All/ForLine, = 1: switch R/S; =2: switch All/Pass
    Q_INVOKABLE void getIsLeft(bool _isLeft, int _btnID, int _screenID);
    Q_INVOKABLE void getCurrentLine(int _currentLine);
    Q_INVOKABLE QList <int> setValueToDraw();

private:
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
    void updateDraw();
};
#endif // DRAWCONTROLBASE_VER3_H
