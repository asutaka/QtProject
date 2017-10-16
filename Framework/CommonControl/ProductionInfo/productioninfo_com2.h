#ifndef PRODUCTIONINFO_COM2_H
#define PRODUCTIONINFO_COM2_H

#include <QtGui>
#include <QtQuick/QQuickPaintedItem>

class ProductionInfo_com2 : public QQuickPaintedItem
{
    Q_OBJECT
    Q_PROPERTY(QString txtRefTitle READ txtRefTitle WRITE setTxtRefTitle)
    Q_PROPERTY(QString txtLowLmtTitle READ txtLowLmtTitle WRITE setTxtLowLmtTitle)
    Q_PROPERTY(QString txtUpLmtTitle READ txtUpLmtTitle WRITE setTxtUpLmtTitle)
    Q_PROPERTY(QString txtNoTitle READ txtNoTitle WRITE setTxtNoTitle)
    Q_PROPERTY(QString txtRefUnit READ txtRefUnit WRITE setTxtRefUnit)
    Q_PROPERTY(QString txtLowLmtUnit READ txtLowLmtUnit WRITE setTxtLowLmtUnit)
    Q_PROPERTY(QString txtUpLmtUnit READ txtUpLmtUnit WRITE setTxtUpLmtUnit)
    Q_PROPERTY(QString txtNoUnit READ txtNoUnit WRITE setTxtNoUnit)
    Q_PROPERTY(QString txtRefValue READ txtRefValue WRITE setTxtRefValue)
    Q_PROPERTY(QString txtLowLmtValue READ txtLowLmtValue WRITE setTxtLowLmtValue)
    Q_PROPERTY(QString txtUpLmtValue READ txtUpLmtValue WRITE setTxtUpLmtValue)
    Q_PROPERTY(QString txtNoValue READ txtNoValue WRITE setTxtNoValue)

public:
    explicit ProductionInfo_com2();
    void paint(QPainter *painter);

    QString txtRefTitle();
    void setTxtRefTitle(QString &value);
    QString txtLowLmtTitle();
    void setTxtLowLmtTitle(QString &value);
    QString txtUpLmtTitle();
    void setTxtUpLmtTitle(QString &value);
    QString txtNoTitle();
    void setTxtNoTitle(QString &value);
    QString txtRefUnit();
    void setTxtRefUnit(QString &value);
    QString txtLowLmtUnit();
    void setTxtLowLmtUnit(QString &value);
    QString txtUpLmtUnit();
    void setTxtUpLmtUnit(QString &value);
    QString txtNoUnit();
    void setTxtNoUnit(QString &value);
    QString txtRefValue();
    void setTxtRefValue(QString &value);
    QString txtLowLmtValue();
    void setTxtLowLmtValue(QString &value);
    QString txtUpLmtValue();
    void setTxtUpLmtValue(QString &value);
    QString txtNoValue();
    void setTxtNoValue(QString &value);

private:
    QString m_RefTitle;
    QString m_LowLmtTitle;
    QString m_UpLmtTitle;
    QString m_NoTitle;
    QString m_RefUnit;
    QString m_LowLmtUnit;
    QString m_UpLmtUnit;
    QString m_NoUnit;
    QString m_RefValue;
    QString m_LowLmtValue;
    QString m_UpLmtValue;
    QString m_NoValue;
};

#endif // PRODUCTIONINFO_COM2_H
