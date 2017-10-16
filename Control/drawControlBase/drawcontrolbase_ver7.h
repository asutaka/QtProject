#ifndef DRAWCONTROLBASE_VER7_H
#define DRAWCONTROLBASE_VER7_H

#include <QtQuick/QQuickPaintedItem>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QPainter>

class DrawControlBase_ver7 : public QQuickItem
{
    Q_OBJECT
public:
    DrawControlBase_ver7(QQuickItem* parent = 0);
    ~DrawControlBase_ver7();

    void paint(QPainter *painter);

    bool _isForLine;
    bool _isR;
    bool _isPass;
    int _currentLine;

    Q_INVOKABLE void setNumSelect(int lineNo,int numSelect);
    Q_INVOKABLE void getIsLeft(bool isLeft, int btnID, int screenID);
    Q_INVOKABLE void getCurrentLine(int currentLine);

protected:
    QPen _pen;
    QFont _font;

    int _lineNo = 12;
    int _numSelect = 0;

    int const _WIDTH_SCREEN = 1024;
    int const _HEIGHT_SCREEN = 640;
    int const _WIDTH_COM = 324;
    int const _HEIGHT_COM = 130;
    int const _x_COM = 10;
    int const _y_COM = 10;

    void DrawCom1(QPainter *painter);
    void DrawCom2(QPainter *painter);
    void DrawCom3(QPainter *painter);
};

#endif // DRAWCONTROLBASE_VER7_H
