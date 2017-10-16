#ifndef INPUTMASTERWORK_H
#define INPUTMASTERWORK_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include "Control/lineImage/lineimage.h"

class InputMasterWork : public QQuickPaintedItem
{
    Q_OBJECT
public:
    InputMasterWork(QQuickItem* parent = 0);
    ~InputMasterWork();

    int currentLine;

    void paint(QPainter *painter);
    void DrawControl(QPainter *painter);
    Q_INVOKABLE void getValue(QString txtInput);
    Q_INVOKABLE int getCurrentLine(int line);
    Q_INVOKABLE void getIsForLine(bool _isForLine);
    Q_INVOKABLE QList<QString> sendValueToDynamic();
    Q_INVOKABLE void getListValue(QList<QString> list);

private:
    int maxline;
    int x_begin;
    int y_begin;
    bool isForLine;
    bool isValid[12];

    QString refVal;
    QString arrayValue[12];
    QString arrayUnit[12];

    QPixmap arrayPixmapLineNo[12];
    QPixmap arrayPixmapLineNo_out[12];
    QPixmap pixmapLineNo;

    void GetImageLineNo(int line);
    void CheckIsValid(int line);
    void LoadImages();
    void updateDraw();
    void GetStrValueInLine(int line);

};

#endif // INPUTMASTERWORK_H
