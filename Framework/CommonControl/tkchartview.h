#ifndef TKCHARTVIEW_H
#define TKCHARTVIEW_H

#include <QtQuick/QQuickItem>
#include <QSGTexture>
#include <QQuickWindow>
#include <QPainter>
#include <list>

using namespace std;

class TKChartView : public QQuickItem {
    Q_OBJECT
    Q_PROPERTY(qreal max READ getMax WRITE setMax)
    Q_PROPERTY(qreal min READ getMin WRITE setMin)
    Q_PROPERTY(qreal tickCountX READ getTickCountX WRITE setTickCountX)
    Q_PROPERTY(qreal tickCountY READ getTickCountY WRITE setTickCountY)
    Q_PROPERTY(QString pointColor READ getPointColor WRITE setPointColor)
    Q_PROPERTY(QString axisColor READ getAxisColor WRITE setAxisColor)
    Q_PROPERTY(QString backgroundColor READ getBackgroundColor WRITE setBackgroundColor)
    Q_PROPERTY(int pointWidth READ pointWidth WRITE setPointWidth)
    Q_PROPERTY(int labelSize READ labelSize WRITE setLabelSize)
    Q_PROPERTY(int labelSpace READ labelSpace WRITE setLabelSpace)
    Q_PROPERTY(int segmentCount READ getSegmentCount WRITE setSegmentCount)
    Q_PROPERTY(QRectF axisArea READ axisArea)
    Q_PROPERTY(int dividingLine READ dividingLine WRITE setDividingLine)
    Q_PROPERTY(int axisPenWidth READ axisPenWidth WRITE setAxisPenWidth )
    Q_ENUMS(COORDINATES_TYPE)

public:
    //type of coordinates
    enum COORDINATES_TYPE {COORDINATES_HORIZONTAL, COORDINATES_VERTICAL};
    TKChartView(QQuickItem * parent = 0);
    ~TKChartView();
    QSGNode *updatePaintNode(QSGNode *, UpdatePaintNodeData *);
public:
    Q_INVOKABLE void append(qreal x, qreal y);
    Q_INVOKABLE void appendLabelAxis(QString &string, COORDINATES_TYPE type);

    Q_INVOKABLE void removeAt(int i);
    Q_INVOKABLE void removeFont();
    Q_INVOKABLE void removeBack();


    Q_INVOKABLE void removeLabelAt(int i, COORDINATES_TYPE type);
    Q_INVOKABLE void removeLabelAxisFont(COORDINATES_TYPE type);
    Q_INVOKABLE void removeLabelAxisBack(COORDINATES_TYPE type);
    Q_INVOKABLE QPointF at(int i);

public:
    qreal& getMax() { return m_max; }
    qreal& getMin() { return m_min; }
    qreal& getTickCountX() {return m_tickCountX;}
    qreal& getTickCountY() {return m_tickCountY;}
    QString& getPointColor() {return m_pointColor;}
    QString& getAxisColor() {return m_axisColor;}
    int& getSegmentCount() {return m_segmentCount;}
    QString& getBackgroundColor() {return m_backgroundColor;}
    int& pointWidth() {return m_pointWidth;}
    int& labelSize() {return m_labelSize;}
    int& labelSpace() {return m_labelSpace;}
    QRectF& axisArea() {return m_axisArea;}
    int& dividingLine() {return m_dividingLine;}
    int& axisPenWidth() {return m_axisPenWidth;}
    QQuickWindow::CreateTextureOptions getTextureOption() { return m_textureOptions;}

    void setMax (qreal& _max) {m_max = _max;}
    void setMin (qreal& _min) {m_min = _min;}

    void setTickCountX (qreal& _tickCountX) {
        m_tickCountX = _tickCountX;
    }

    void setTickCountY (qreal& _tickCountY) {
        m_tickCountY = _tickCountY;
    }

    void setPointColor (QString& _pointColor) {
        m_pointColor = _pointColor;
        m_penPoint.setBrush(QBrush(m_pointColor, Qt::SolidPattern));
    }

    void setAxisColor (QString& _axisColor) {
        m_axisColor = _axisColor;
        m_penAxis.setBrush(QBrush(m_axisColor, Qt::SolidPattern));
    }

    void setSegmentCount (int _segmentCount) {
        m_segmentCount = _segmentCount;
    }

    void setBackgroundColor(QString& _backgroundColor) {
        m_backgroundColor = _backgroundColor;
        m_painter.setBackground(QBrush(QColor(m_backgroundColor)));
    }

    void setPointWidth(int _pointWidth) {
        m_pointWidth = _pointWidth;
        m_penPoint.setWidth(m_pointWidth);
    }

    void setAxisPenWidth(int _axisPenWidth) {
        m_axisPenWidth = _axisPenWidth;
        m_penAxis.setWidth(m_axisPenWidth);
    }

    void setTextureOption (QQuickWindow::CreateTextureOptions _textureOption) {
        m_textureOptions = _textureOption;
    }

    void setLabelSize (int _labelSize) {
        m_labelSize = _labelSize;
        m_font.setPixelSize(m_labelSize);
    }

    void setLabelSpace (int _labelSpace) {
        m_labelSpace = _labelSpace;
    }

    void setDividingLine (int _dividingLine) {
        m_dividingLine = _dividingLine;
    }

private:
    void createTextureFromImage (const QImage& image);
    void render();
    void caculateAxisArea();

private:
    QImage* m_image;

    QList<QPointF> m_listPoint;

    // label
    QList<QString> m_labelaxisX;
    QList<QString> m_labelaxisY;
    int m_labelSize;
    int m_labelSpace;

    // range
    qreal m_max;
    qreal m_min;

    // tickCount
    qreal m_tickCountX;
    qreal m_tickCountY;

    // color
    QString m_pointColor;
    QString m_axisColor;
    QString m_backgroundColor;

    // texture
    QSGTexture* m_texture;
    QSizeF m_textureSize;
    QPen m_penPoint;
    QPen m_penAxis;
    QQuickWindow::CreateTextureOptions m_textureOptions;

    // render scene
    bool m_imageDirty;
    int m_segmentCount;

    // Painter
    QPainter m_painter;

    // width of line
    int m_pointWidth;

    // axisArea
    QRectF m_axisArea;
    int m_axisPenWidth;

    // font
    QFont m_font;

    int m_countPoint;
    int m_dividingLine;
};
#endif // TKCHARTVIEW_H
