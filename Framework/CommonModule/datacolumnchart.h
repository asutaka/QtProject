#ifndef DATACOLUMNCHART_H
#define DATACOLUMNCHART_H
#include <QObject>
#include <QPixmap>


class DataColumnChart : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QPixmap> listSourceImage READ listSourceImage WRITE setListSourceImage)
    Q_PROPERTY(QList<QPixmap> listSourceBackgroundImage READ listSourceBackgroundImage WRITE setListSourceBackgroundImage)
    Q_PROPERTY(QList<int> listColumnType READ listColumnType WRITE setListColumnType)

public:
    explicit DataColumnChart(QObject *parent = 0);

    QList<QPixmap> listSourceImage();
    void setListSourceImage(QList<QPixmap> &value);
    QList<QPixmap> listSourceBackgroundImage();
    void setListSourceBackgroundImage(QList<QPixmap> &value);
    QList<int> listColumnType();
    void setListColumnType(QList<int> &value);

    Q_INVOKABLE int getItemListColumnType(int item);
    Q_INVOKABLE QPixmap getItemListSourceImage(int item);
    Q_INVOKABLE QPixmap getItemListSourceBackgroudImage(int item);

//signals:
//    void DataUpdate();

private:

    QList<int>      m_ListColumnType;
    QList<QPixmap>  m_ListSourceImage;
    QList<QPixmap>  m_ListSourceBackgroundImage;

};

#endif // DATACOLUMNCHART_H
