#include "tk_line.h"
#include <QSGGeometryNode>
#include <QSGSimpleTextureNode>
#include <QSGSimpleMaterial>
#include <QPainter>
#include <Qt>
#include <math.h>

TK_Line::TK_Line(QQuickItem * parent) : QQuickPaintedItem(parent)
{
    m_image = NULL;
    m_drawAllPoints = false;
    m_maxPointIndex = 0;
    m_anchorPointIndex = 0;
    m_plotArea = QRect(0,0,0,0);
    m_cacheArea = QRect(0,0,0,0);
    m_directionType = LEFTTORIGHT;

    if (antialiasing()) {
        m_painter.setRenderHints(QPainter::Antialiasing | QPainter::TextAntialiasing
                               | QPainter::SmoothPixmapTransform);
    }
}

TK_Line::~TK_Line()
{
    if (m_image) {
        delete m_image;
        m_image = NULL;
    }
}

void TK_Line::paint(QPainter* painter) {
    if (!m_image) {
        m_image = new QImage(QSize(0, 0), QImage::Format_ARGB32);
        m_image->fill(qRgba(0,0,0,0));
    }

    if (m_drawAllPoints)
        renderNotUseCache(painter);
    else
        renderUseCache(painter);
}

/*
 * draw point , axis, label to own image
 */
void TK_Line::renderUseCache(QPainter* painter) {
    // draw cacheImg
    QImage cacheImg(QSize(0, 0), QImage::Format_ARGB32);

    if (m_image) {
        QImage cacheImg = m_image->copy(m_cacheArea);
        delete m_image;
    }

    m_image = new QImage(m_plotArea.size(), QImage::Format_ARGB32);

    m_painter.begin(m_image);
    m_painter.drawImage(QPoint(0,0), cacheImg);

    // draw point
    QPointF beginLinePos, endLinePos;

    m_painter.setPen(m_penLine);

    QMap<quint64, QPointF>::iterator i = m_listPoint.find(m_anchorPointIndex);

    for(; i != m_listPoint.end(); i++) {
        QPointF point = i.value();
        QPointF nextpoint = (i+1).value();

        m_painter.drawLine(point, nextpoint);
    }

    if (m_listPoint.size() != 0) {
        m_anchorPointIndex = (i-1).key();
    }

    m_painter.end();
    m_cacheArea = m_image->rect();

    // draw image to node
    painter->drawImage(QPointF(0,0), *m_image);
}

void TK_Line::renderNotUseCache(QPainter* painter) {
    qint64 pointNum = m_listPoint.size() - 1;

    if (m_image)
    {
        delete m_image;
        m_image = NULL;
    }

    if (pointNum < 1) {
        m_image = new QImage(QSize(1,1), QImage::Format_ARGB32);
        m_image->fill(qRgba(0,0,0,0));
        return;
    }

    m_image = new QImage(m_plotArea.size(), QImage::Format_ARGB32);
    m_image->fill(qRgba(0,0,0,0));

    m_painter.begin(m_image);
    m_painter.setPen(m_penLine);

    QPointF p1, p2;
    QPointF previousPoint, nextPoint;
    QMap<quint64, QPointF>::iterator i = m_listPoint.begin();

    for (; i != m_listPoint.end()-1; i++)
    {
        previousPoint = i.value();
        nextPoint = (i+1).value();

        p1 = QPointF(previousPoint.x(), previousPoint.y());
        p2 = QPointF(nextPoint.x(), nextPoint.y());

        m_painter.drawLine(p1, p2);
    }

    m_drawAllPoints = false;
    m_painter.end();

    painter->drawImage(QPointF(0,0), *m_image);
    m_anchorPointIndex = (i-1).key();
}

void TK_Line::updatePointPosition(QPointF offsetPoint) {
    for (QMap<quint64, QPointF>::iterator i = m_listPoint.begin(); i != m_listPoint.end(); i++) {
        QPointF& point = i.value();
        point.setX(point.x() + offsetPoint.x());
        point.setY(point.y() + offsetPoint.y());
    }
}

void TK_Line::update() {
    // draw point
    QQuickItem::update();
}

QPointF TK_Line::at(quint64 index) {
    return m_listPoint.value(index, QPointF(0,0));
}

void TK_Line::append(qreal x, qreal y) {
    m_listPoint.insert(m_maxPointIndex, QPointF(x, y));

    // check and assign area size for draw points
    x = qAbs(x);
    y = qAbs(y);

    if (m_plotArea.width() < x)
        m_plotArea.setWidth(x);

    if (m_plotArea.height() < y)
        m_plotArea.setHeight(y);

    m_maxPointIndex++;
}

void TK_Line::removeBack() {
    if (m_listPoint.size() < 1) {
        clearAll();
        return;
    }

    // get remove point
    QMap<quint64, QPointF>::iterator i = m_listPoint.begin();
    QPointF point = i.value();
    // update position of all point in list
    QPointF nearestPoint = (i+1).value();

    QPointF offset(0,0);

    // caculate offset
    if (m_directionType == DIRECTION_TYPE::LEFTTORIGHT) {
       offset.setX(point.x() - nearestPoint.x());
       m_cacheArea.setWidth(m_cacheArea.width() - qAbs(offset.x()));
       m_cacheArea.setX(nearestPoint.x());
    }
    else if (m_directionType == DIRECTION_TYPE::RIGHTTOLEFT) {
       offset.setX(point.x() - nearestPoint.x());
       m_cacheArea.setWidth(m_cacheArea.width() - qAbs(offset.x()));
    }
    else if (m_directionType == DIRECTION_TYPE::BOTTOMTOTOP ) {
       offset.setY(point.y() - nearestPoint.y());
       m_cacheArea.setWidth(m_cacheArea.height() - qAbs(offset.y()));
    }
    else if (m_directionType == DIRECTION_TYPE::TOPTOBOTTOM) {
       offset.setY(point.y() - nearestPoint.y());
       m_cacheArea.setWidth(m_cacheArea.height() - qAbs(offset.y()));
       m_cacheArea.setY(nearestPoint.y());
    }

    // remove back point
    m_listPoint.remove(i.key());

    // update position of list point
    updatePointPosition(offset);
}

void TK_Line::clearAll() {
    m_listPoint.clear();
    m_plotArea.setWidth(0);
    m_plotArea.setHeight(0);
    m_maxPointIndex = 0;
    m_anchorPointIndex = 0;
    m_cacheArea = QRect(0,0,0,0);
    m_plotArea = QRect(0,0,0,0);
}



