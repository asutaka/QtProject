#include "tk_column.h"
#include <QDebug>

TK_Column::TK_Column(QQuickItem *parent)
    : QQuickPaintedItem(parent)
{
}

QPixmap TK_Column::sourceImage(){
    return m_SourceImage;
}

void TK_Column::setSourceImage(QPixmap &value){
    m_SourceImage = value;
}

QPixmap TK_Column::sourceBackgroundImage(){
    return m_SourceBackgroundImage;
}

void TK_Column::setSourceBackgroundImage(QPixmap &value){
    m_SourceBackgroundImage = value;
}


TK_Column::ColumnGraphTypeId TK_Column::columnType(){
    return m_ColumnType;
}

void TK_Column::setColumnType(ColumnGraphTypeId &value){
    m_ColumnType = value;
}

void TK_Column::paint(QPainter *painter)
{
    //draw background
    painter->drawPixmap(0, 0, m_SourceBackgroundImage);

    //draw forceground image
    if(m_ColumnType == ColumnGraphTypeId::LEFTTORIGHT){
        painter->drawPixmap(0, 0, m_SourceImage);
    }
    else if(m_ColumnType == ColumnGraphTypeId::RIGHTTOLEFT){
        painter->drawPixmap( m_SourceBackgroundImage.width() - m_SourceImage.width(), 0, m_SourceImage);
    }
    else if(m_ColumnType == ColumnGraphTypeId::BOTTOMTOTOP){
        painter->drawPixmap( 0, m_SourceBackgroundImage.height() - m_SourceImage.height(), m_SourceImage);
    }
    else if(m_ColumnType == ColumnGraphTypeId::TOPTOBOTTOM){
        painter->drawPixmap(0, 0, m_SourceImage);
    }
    else if(m_ColumnType == ColumnGraphTypeId::MIDTOLEFT){
        painter->drawPixmap( m_SourceBackgroundImage.width()/2 - m_SourceImage.width(), 0, m_SourceImage);
    }
    else if(m_ColumnType == ColumnGraphTypeId::MIDTORIGHT){
        painter->drawPixmap( m_SourceBackgroundImage.width()/2, 0, m_SourceImage);
    }
}
