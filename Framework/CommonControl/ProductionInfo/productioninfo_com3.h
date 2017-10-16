#ifndef PRODUCTIONINFO_COM3_H
#define PRODUCTIONINFO_COM3_H

#include <QtGui>
#include <QtQuick/QQuickPaintedItem>

class ProductionInfo_com3 : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QString txtTotalTitle READ txtTotalTitle WRITE setTxtTotalTitle)
    Q_PROPERTY(QString txtOKTitle READ txtOKTitle WRITE setTxtOKTitle)
    Q_PROPERTY(QString txtNGTitle READ txtNGTitle WRITE setTxtNGTitle)
    Q_PROPERTY(QString txtTotalValue READ txtTotalValue WRITE setTxtTotalValue)
    Q_PROPERTY(QString txtOKValue READ txtOKValue WRITE setTxtOKValue)
    Q_PROPERTY(QString txtNGValue READ txtNGValue WRITE setTxtNGValue)

public:
    explicit ProductionInfo_com3();
    void paint(QPainter *painter);
    QString txtTotalTitle();
    void setTxtTotalTitle(QString &value);
    QString txtOKTitle();
    void setTxtOKTitle(QString &value);
    QString txtNGTitle();
    void setTxtNGTitle(QString &value);
    QString txtTotalValue();
    void setTxtTotalValue(QString &value);
    QString txtOKValue();
    void setTxtOKValue(QString &value);
    QString txtNGValue();
    void setTxtNGValue(QString &value);

private:
    QString m_TotalTitle;
    QString m_OKTitle;
    QString m_NGTitle;
    QString m_TotalValue;
    QString m_NGValue;
    QString m_OKValue;
};

#endif // PRODUCTIONINFO_COM3_H
