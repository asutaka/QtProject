#ifndef PRODUCTSCREENBASEVM_H
#define PRODUCTSCREENBASEVM_H

#include <QObject>
#include <QDir>
#include <QtSql/QSqlDatabase>
#include <QtSql/QSqlQuery>
#include <QtSql/QSqlError>
#include "startwindow.h"
#include "globals.h"
#include "mainwindow.h"
#include <../Lang/lang.h>

class ProductScreenBaseVM : public QObject
{
    Q_OBJECT
    //Com1
    Q_PROPERTY(QString txtProductTitle READ txtProductTitle CONSTANT)
    Q_PROPERTY(QString txtLotNoTitle READ txtLotNoTitle CONSTANT)
    Q_PROPERTY(QString txtProductNo READ txtProductNo CONSTANT)
    Q_PROPERTY(QString txtProductName READ txtProductName CONSTANT)
    Q_PROPERTY(QString txtLotNoValue READ txtLotNoValue CONSTANT)
    //Com2
    Q_PROPERTY(QString txtRefTitle READ txtRefTitle CONSTANT)
    Q_PROPERTY(QString txtLowLmtTitle READ txtLowLmtTitle CONSTANT)
    Q_PROPERTY(QString txtUpLmtTitle READ txtUpLmtTitle CONSTANT)
    Q_PROPERTY(QString txtNoTitle READ txtNoTitle CONSTANT)
    Q_PROPERTY(QString txtRefUnit READ txtRefUnit CONSTANT)
    Q_PROPERTY(QString txtLowLmtUnit READ txtLowLmtUnit CONSTANT)
    Q_PROPERTY(QString txtUpLmtUnit READ txtUpLmtUnit CONSTANT)
    Q_PROPERTY(QString txtNoUnit READ txtNoUnit CONSTANT)
    Q_PROPERTY(QString txtRefValue READ txtRefValue CONSTANT)
    Q_PROPERTY(QString txtLowLmtValue READ txtLowLmtValue CONSTANT)
    Q_PROPERTY(QString txtUpLmtValue READ txtUpLmtValue CONSTANT)
    Q_PROPERTY(QString txtNoValue READ txtNoValue CONSTANT)
    //Com3
    Q_PROPERTY(QString txtTotalTitle READ txtTotalTitle CONSTANT)
    Q_PROPERTY(QString txtOKTitle READ txtOKTitle CONSTANT)
    Q_PROPERTY(QString txtNGTitle READ txtNGTitle CONSTANT)
    Q_PROPERTY(QString txtTotalValue READ txtTotalValue CONSTANT)
    Q_PROPERTY(QString txtOKValue READ txtOKValue CONSTANT)
    Q_PROPERTY(QString txtNGValue READ txtNGValue CONSTANT)

public:
    explicit ProductScreenBaseVM();
    //Com1
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
    //Com2
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
    //Com3
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

    Q_INVOKABLE int onChangeLanguage();

private:
    //Com1
    QString m_ProductTitle;
    QString m_LotNoTitle;
    QString m_ProductNo;
    QString m_ProductName;
    QString m_LotNoValue;
    //Com2
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
    //Com3
    QString m_TotalTitle;
    QString m_OKTitle;
    QString m_NGTitle;
    QString m_TotalValue;
    QString m_NGValue;
    QString m_OKValue;
};

#endif // PRODUCTSCREENBASEVM_H
