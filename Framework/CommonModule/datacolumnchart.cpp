#include "datacolumnchart.h"
#include <QDebug>

DataColumnChart::DataColumnChart(QObject *parent) : QObject(parent)
{

}
QList<QPixmap> DataColumnChart::listSourceImage() {
    return m_ListSourceImage;
}

void DataColumnChart::setListSourceImage(QList<QPixmap> &value) {
    m_ListSourceImage = value;
}

QList<QPixmap> DataColumnChart::listSourceBackgroundImage() {
    return m_ListSourceBackgroundImage;
}

void DataColumnChart::setListSourceBackgroundImage(QList<QPixmap> &value) {
    m_ListSourceBackgroundImage = value;
}

QList<int> DataColumnChart::listColumnType() {
    return m_ListColumnType;
}

void DataColumnChart::setListColumnType(QList<int> &value) {
    m_ListColumnType = value;
}

int DataColumnChart::getItemListColumnType(int item)
{
    return m_ListColumnType.at(item);
}

QPixmap DataColumnChart::getItemListSourceImage(int item)
{
    return m_ListSourceImage.at(item);
}

QPixmap DataColumnChart::getItemListSourceBackgroudImage(int item){
    return m_ListSourceBackgroundImage.at(item);
}
