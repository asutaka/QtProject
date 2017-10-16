#ifndef ADJUSTLINE_H
#define ADJUSTLINE_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>

class AdjustLine
{
public:
    AdjustLine();
    ~AdjustLine();

    int cellHeight;
    int cellWidth;
    int stepCount;
    int LineNo;
    bool isValid;
    bool isSelected;
    bool selectedSensCorr;

    QString value;
    QString level;
    QString strStep1Kind;

    QPixmap pixmapStep1Kind;
    QPixmap pixmapLineNo;
    QPixmap arrayPixmapLineNo[12];
    QPixmap arrayPixmapLineNo_out[12];

    void DrawControl(QPainter *qp, QPoint pos);

private:
    void LoadImages();
    void DrawValue(QPainter *qp, QPoint pos);
    void GetImageLineNo(int line);

signals:

public slots:

protected:

};

#endif // ADJUSTLINE_H
