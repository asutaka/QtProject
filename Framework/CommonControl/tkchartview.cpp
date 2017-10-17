#include "tkchartview.h"
#include <QSGGeometryNode>
#include <QSGSimpleTextureNode>
#include <QSGSimpleMaterial>
#include <QPainter>
#include <Qt>
#include <math.h>

TKChartView::TKChartView(QQuickItem * parent) : QQuickItem(parent)
               ,m_image(NULL)
               ,m_max (-1)
               ,m_min (-1)
               ,m_pointColor("#000000")
               ,m_axisColor("#FFFFFF")
               ,m_segmentCount(2)
               ,m_texture(NULL)
               ,m_textureSize(QSize())
               ,m_textureOptions(QQuickWindow::TextureHasAlphaChannel)
               ,m_imageDirty (false)
               ,m_countPoint(0)
               ,m_tickCountX(2)
               ,m_tickCountY(2)
               ,m_backgroundColor("#000000")
               ,m_pointWidth(2)
               ,m_labelSize(10)
               ,m_axisArea(QRectF(0,0,0,0))
               ,m_dividingLine(3)
{
    m_penPoint.setBrush(QBrush(QColor(m_pointColor)));
    m_penPoint.setWidth(m_pointWidth);

    m_penAxis = m_penPoint;

    m_painter.setCompositionMode(QPainter::CompositionMode_Destination);
    m_painter.setBackground(QBrush(QColor(m_backgroundColor)));

    if (antialiasing()) {
        m_painter.setRenderHints(QPainter::Antialiasing | QPainter::TextAntialiasing
                               | QPainter::SmoothPixmapTransform);
    }
    setFlag(ItemHasContents, true);
}

TKChartView::~TKChartView()
{
    if (m_image)
        delete m_image;
    if (m_texture)
        delete m_texture;
}

QSGNode* TKChartView::updatePaintNode(QSGNode * oldNode, UpdatePaintNodeData *) {
    QSGSimpleTextureNode * node = static_cast<QSGSimpleTextureNode*>(oldNode);

    if (!node) {
        node = new QSGSimpleTextureNode;

        // create Texture option
        QQuickWindow::CreateTextureOptions textureOption = QQuickWindow::CreateTextureOptions (
                    QQuickWindow::TextureHasAlphaChannel | QQuickWindow::TextureOwnsGLTexture);

        m_textureOptions = textureOption;

        // because Texture node need own texture, so create it with dummy size 1 pixel
        if (!m_image) {
            m_image = new QImage(QSize(1,1), QImage::Format_ARGB32_Premultiplied);
            uchar * imagePtr = NULL;
            imagePtr = m_image->bits();
            imagePtr[0] = 0;
            imagePtr[1] = 0;
            imagePtr[2] = 0;
            imagePtr[3] = 0;
        }
        node->setFiltering(QSGTexture::Linear);
    }

    const QRectF &bRect = boundingRect();
    node->setRect(bRect);

    render();
    createTextureFromImage(*m_image);
    node->setTexture(m_texture);

    node->markDirty(QSGNode::DirtyForceUpdate);
    return node;
}

void TKChartView::append(qreal x, qreal y) {
    // because coordinate axis on top left char, we need convert to botom left
    m_listPoint.push_back(QPointF(x, (height()-y*m_tickCountY)/m_tickCountY));
    m_countPoint++;
}

void TKChartView::removeAt(int i) {
    int listSize = m_listPoint.size();

    if (listSize == 0 ||  i > listSize)
        return;

    m_listPoint.removeAt(i);
}

QPointF TKChartView::at(int i) {
    int listSize = m_listPoint.size();

    if (listSize == 0 || i > listSize)
        return QPointF(0,0);

    return m_listPoint.at(i);

}

void TKChartView::removeFont() {
    if (m_listPoint.size() == 0)
        return;

    m_listPoint.pop_front();
}

void TKChartView::removeBack() {
    if (m_listPoint.size() == 0)
        return;

    m_listPoint.pop_back();
}

void TKChartView::appendLabelAxis(QString &string, COORDINATES_TYPE type) {
    if (type == COORDINATES_HORIZONTAL) {
        m_labelaxisX.push_back(string);
    }
    else if (type == COORDINATES_VERTICAL) {
        m_labelaxisY.push_back(string);
    }
}

void TKChartView::removeLabelAt(int i, COORDINATES_TYPE type) {
    if (i < 0)
        return;

    QList<QString>* listPtr = NULL;

    if (type == COORDINATES_HORIZONTAL) {
        listPtr = &m_labelaxisX;
    }
    else if (type == COORDINATES_VERTICAL) {
        listPtr = &m_labelaxisY;
    }

    if (!listPtr || listPtr->size() == 0)
        return;

    listPtr->removeAt(i);
}

void TKChartView::removeLabelAxisFont(COORDINATES_TYPE type) {
    QList<QString> * listLabel = NULL;

    if (type == COORDINATES_HORIZONTAL) {
        listLabel = &m_labelaxisX;
    }
    else if (type == COORDINATES_VERTICAL) {
        listLabel = &m_labelaxisY;
    }

    if (!listLabel || listLabel->size() == 0)
        return;

    listLabel->pop_front();
}

void TKChartView::removeLabelAxisBack(COORDINATES_TYPE type) {
    QList<QString> * listLabel = NULL;

    if (type == COORDINATES_HORIZONTAL) {
        listLabel = &m_labelaxisX;
    }
    else if (type == COORDINATES_VERTICAL) {
        listLabel = &m_labelaxisY;
    }

    if (!listLabel || listLabel->size() == 0)
        return;

    listLabel->pop_back();
}

// Must be called on render thread and in context
void TKChartView::createTextureFromImage(const QImage& image) {
    if (image.size() != m_textureSize)
        m_textureSize = image.size();

    if (m_texture) {
        delete m_texture;
        m_texture = NULL;
    }

    m_texture = window()->createTextureFromImage(image, m_textureOptions);
}

/*
 * draw point , axis, label to own image
 */
void TKChartView::render() {
    if(m_axisArea == QRectF(0,0,0,0))
        caculateAxisArea();

    QSize chartSize = QSize(round(width()), round(height()));

    QImage cacheImg;
    QPointF beginLinePos(0,chartSize.height()-m_axisArea.height());
    QPointF endLinePos(0,chartSize.height()-m_axisArea.height());

    QRect rectArea(0,0,0,0);

    // draw point
    if (m_countPoint > chartSize.width()/m_tickCountX+1)
    {
       QPointF lastestPoint = m_listPoint.back();
       rectArea = QRect(m_tickCountX, 0, chartSize.width()-m_tickCountX,chartSize.height());
       endLinePos = QPointF(chartSize.width(), lastestPoint.y()*m_tickCountY-m_axisArea.height());
    }
    else if (m_countPoint > 0) {
       QPointF lastestPoint = m_listPoint.back();
       rectArea = QRect(0, 0, (lastestPoint.x()-1)*m_tickCountX, chartSize.height());
       endLinePos = QPointF(lastestPoint.x()*m_tickCountX, lastestPoint.y()*m_tickCountY-m_axisArea.height());
    }

    if (m_image) {
        cacheImg = m_image->copy(rectArea);
        delete m_image;
        m_image = NULL;
    }

    m_image = new QImage(chartSize, QImage::Format_ARGB32_Premultiplied);


    m_painter.begin(m_image);
    m_painter.setPen(m_penPoint);
    m_painter.setBackground(QBrush(QColor(m_backgroundColor)));

    m_painter.eraseRect(boundingRect());

    if (m_countPoint > 1) {
        m_painter.drawImage(QPoint(0,0), cacheImg);

        int sizeListPoint = m_listPoint.size();

        if (m_countPoint < (chartSize.width()/m_tickCountX)-1 )
            beginLinePos.setX(m_listPoint[sizeListPoint-2].x()*m_tickCountX);
        else
            beginLinePos.setX(rectArea.width());

        beginLinePos.setY(m_listPoint[sizeListPoint-2].y()*m_tickCountY-m_axisArea.height());
        m_painter.drawLine(beginLinePos, endLinePos);
    }

    // draw axis X labels
    m_painter.setFont(m_font);
    m_painter.setPen(m_penAxis);
    m_painter.drawLine(QPoint(0,chartSize.height()-m_axisArea.height()), QPoint(chartSize.width(), chartSize.height()-m_axisArea.height()));
    QPointF p1, p2, pLabel;
    QString label;

    if (m_countPoint < chartSize.width()/m_tickCountX-1)
    {
        QPointF p1, p2, pLabel;
        QString label;
        for (int i = 0; i < m_axisArea.width()/m_tickCountX; i+=m_labelSpace)
        {
          label = QString("%1").arg(i);
          p1 = QPointF(i*m_tickCountX, chartSize.height()-m_axisArea.height());
          p2 = QPointF(i*m_tickCountX, chartSize.height()-m_axisArea.height()+m_dividingLine);

          m_painter.drawLine(p1, p2);

          pLabel.setX(p1.x() - m_labelSize*1.0/2);
          pLabel.setY(chartSize.height());

          m_painter.drawText(pLabel, label);
        }

    }
    else if (m_countPoint % m_labelSpace == 0){
         label = QString("%1").arg(m_countPoint);
         p1 = QPointF(chartSize.width()-10, chartSize.height()-m_axisArea.height());
         p2 = QPointF(chartSize.width()-10, chartSize.height()-m_axisArea.height()+m_dividingLine);

         m_painter.drawLine(p1, p2);

         pLabel.setX(p1.x() - m_labelSize*1.0/2);
         pLabel.setY(chartSize.height());

         m_painter.drawText(pLabel, label);
    }

    m_painter.end();
}

void TKChartView::caculateAxisArea() {
    qreal axisHeight = m_labelSize + m_dividingLine;
    m_axisArea.setX(x());
    m_axisArea.setY(height()-axisHeight);
    m_axisArea.setWidth(width());
    m_axisArea.setHeight(axisHeight);
}



