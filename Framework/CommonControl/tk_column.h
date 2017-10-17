#ifndef TK_COLUMN_H
#define TK_COLUMN_H

#include <QObject>
#include <QtQuick/QQuickPaintedItem>
#include <QPixmap>
#include <QString>
#include <QPen>
#include <QFont>
#include <QPainter>

class TK_Column : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QPixmap sourceImage READ sourceImage WRITE setSourceImage)
    Q_PROPERTY(QPixmap sourceBackgroundImage READ sourceBackgroundImage WRITE setSourceBackgroundImage)
    Q_PROPERTY(ColumnGraphTypeId columnType READ columnType WRITE setColumnType)

public:
    enum class ColumnGraphTypeId
    {
        BOTTOMTOTOP = 0,
        TOPTOBOTTOM,
        RIGHTTOLEFT,
        LEFTTORIGHT,
        MIDTOLEFT,
        MIDTORIGHT
    };
    Q_ENUM(ColumnGraphTypeId)

public:
    explicit TK_Column(QQuickItem *parent = 0);
    void paint(QPainter *painter);

    QPixmap sourceImage();
    void setSourceImage(QPixmap &value);
    QPixmap sourceBackgroundImage();
    void setSourceBackgroundImage(QPixmap &value);

    ColumnGraphTypeId columnType();
    void setColumnType(ColumnGraphTypeId &value);
private:
    QPixmap             m_SourceImage;
    QPixmap             m_SourceBackgroundImage;
    ColumnGraphTypeId   m_ColumnType ;
};

#endif // TK_COLUMN_H
