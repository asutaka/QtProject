#ifndef TKLINE_H
#define TKLINE_H

#include <QtQuick/QQuickPaintedItem>
#include <QSGTexture>
#include <QQuickWindow>
#include <QPainter>

using namespace std;

class TK_Line : public QQuickPaintedItem {
    Q_OBJECT
    Q_PROPERTY(bool useCaching READ useCaching WRITE setUseCaching)
    Q_PROPERTY(QRect plotArea READ plotArea)
    Q_PROPERTY(QString lineColor READ lineColor WRITE setLineColor)
    Q_PROPERTY(int lineWidth READ lineWidth WRITE setLineWidth)
    Q_PROPERTY(DIRECTION_TYPE directionType READ directionType WRITE setDirectionType)
public:
    // types of chart direction
    enum DIRECTION_TYPE {
        LEFTTORIGHT,
        BOTTOMTOTOP,
        TOPTOBOTTOM,
        RIGHTTOLEFT
    };
    Q_ENUM(DIRECTION_TYPE)

    explicit TK_Line(QQuickItem * parent = 0);
    ~TK_Line();
    void paint(QPainter * painter) override;

public:
    Q_INVOKABLE void append(qreal x, qreal y);
    Q_INVOKABLE QPointF at(quint64 index);
    Q_INVOKABLE void removeBack();
    Q_INVOKABLE void clearAll();

    Q_INVOKABLE quint64 pointNum() {return m_listPoint.size();}
    Q_INVOKABLE void update();

public:
    QString& lineColor() {return m_lineColor;}
    int& lineWidth() {return m_lineWidth;}
    DIRECTION_TYPE& directionType() {return m_directionType;}

    void setLineColor (QString& _lineColor) {
        m_lineColor = _lineColor;
        m_penLine.setBrush(QBrush(m_lineColor, Qt::SolidPattern));
        m_drawAllPoints = true;
    }

    void setLineWidth(int _lineWidth) {
        m_lineWidth = _lineWidth;
        m_penLine.setWidth(m_lineWidth);
        m_drawAllPoints = true;
    }

    void setDirectionType(DIRECTION_TYPE _directionType) {
            m_directionType = _directionType;
    }

    const QPen& getPen() {return m_penLine;}

    bool& useCaching() {return m_useCacheImg;}

    void setUseCaching (bool _useCaching) {
        m_useCacheImg = _useCaching;
    }

    QRect plotArea() {return m_plotArea;}
private:
    void renderUseCache(QPainter*);
    void renderNotUseCache(QPainter*);
    void updatePointPosition(QPointF offset);

private:
    // cache image
    QImage* m_image;
    bool m_useCacheImg;

    // list points
    QMap<quint64, QPointF> m_listPoint;

    // style of line
    QString m_lineColor;
    int m_lineWidth;
    QPen m_penLine;

    // draw line options
    bool m_drawAllPoints;

    // area of graph
    QRect m_plotArea;
    QRect m_cacheArea;

    // other
    QPainter m_painter;
    quint64 m_maxPointIndex;
    DIRECTION_TYPE m_directionType;
    quint64 m_anchorPointIndex;
};

#endif // TKLINE_H
