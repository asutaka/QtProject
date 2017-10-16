#ifndef PRODUCTIONINFO_COM1_H
#define PRODUCTIONINFO_COM1_H

#include <QtGui>
#include <QtQuick/QQuickPaintedItem>

class ProductionInfo_com1 : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QString txtProductTitle READ txtProductTitle WRITE setTxtProductTitle)
    Q_PROPERTY(QString txtLotNoTitle READ txtLotNoTitle WRITE setTxtLotNoTitle)
    Q_PROPERTY(QString txtProductNo READ txtProductNo WRITE setTxtProductNo)
    Q_PROPERTY(QString txtProductName READ txtProductName WRITE setTxtProductName)
    Q_PROPERTY(QString txtLotNoValue READ txtLotNoValue WRITE setTxtLotNoValue)

public:
    explicit ProductionInfo_com1();
    void paint(QPainter *painter);
    QString txtProductTitle();
    void setTxtProductTitle(QString &value);
    QString txtLotNoTitle();
    void setTxtLotNoTitle(QString &value);
    QString txtProductNo();
    void setTxtProductNo(QString &value);
    QString txtProductName();
    void setTxtProductName(QString &value);
    QString txtLotNoValue();
    void setTxtLotNoValue(QString &value);

private:
    QString m_ProductTitle;
    QString m_LotNoTitle;
    QString m_ProductNo;
    QString m_ProductName;
    QString m_LotNoValue;
};

#endif // PRODUCTIONINFO_COM1_H
