#ifndef DRAWCONTROLBASE_VER6_H
#define DRAWCONTROLBASE_VER6_H

#include <QtQuick/QQuickPaintedItem>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QPainter>

class DrawControlBase_ver6 : public QQuickPaintedItem
{
    Q_OBJECT
public:
    DrawControlBase_ver6(QQuickItem* parent = 0);
    ~DrawControlBase_ver6();

    void paint(QPainter *painter);

    bool _isForLine;
    bool _isR;
    bool _isPass;
    int _currentLine;

    Q_INVOKABLE void setNumSelect(int lineNo,int numSelect);
    Q_INVOKABLE void getIsLeft(bool isLeft, int btnID, int screenID);
    Q_INVOKABLE void getCurrentLine(int currentLine);

private:
    QTimer* _timerDrawing;

    void DrawCom1(QPainter*);
    void DrawCom2(QPainter*);
    void DrawCom3(QPainter*);

protected:
    QPen _pen;
    QFont _font;
    QPixmap _pixmap;

    int _lineNo = 12;
    int _numSelect = 0;

    int const _WIDTH_SCREEN = 1024;
    int const _HEIGHT_SCREEN = 640;
    int const _WIDTH_COM = 324;
    int const _HEIGHT_COM = 130;
    int const _x_COM = 10;
    int const _y_COM = 10;

public slots:
    void updateDraw();
};

#endif // DRAWCONTROLBASE_VER6_H
