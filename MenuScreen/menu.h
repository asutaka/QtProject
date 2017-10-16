#ifndef MENU_H
#define MENU_H

#include <QtQuick/QQuickPaintedItem>
#include <QColor>
#include <QPixmap>
#include <QTimer>
#include <QElapsedTimer>
#include <QList>
#include <../Lang/lang.h>

class Menu : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString txtAdjustRegisteredProduct READ txtAdjustRegisteredProduct CONSTANT)
    Q_PROPERTY(QString txtControlPanel READ txtControlPanel CONSTANT)
    Q_PROPERTY(QString txtDisplayProductList READ txtDisplayProductList CONSTANT)
    Q_PROPERTY(QString txtHistory READ txtHistory CONSTANT)
    Q_PROPERTY(QString txtLanguage READ txtLanguage CONSTANT)
    Q_PROPERTY(QString txtMaintAndSetting READ txtMaintAndSetting CONSTANT)
    Q_PROPERTY(QString txtOpeCheck READ txtOpeCheck CONSTANT)
    Q_PROPERTY(QString txtStatsControl READ txtStatsControl CONSTANT)
    Q_PROPERTY(QString txtRegisterNewProduct READ txtRegisterNewProduct CONSTANT)
    Q_PROPERTY(QString txtUsbMemory READ txtUsbMemory CONSTANT)
private:
    QString m_txtAdjustRegisteredProduct;
    QString m_txtControlPanel;
    QString m_txtDisplayProductList;
    QString m_txtHistory;
    QString m_txtLanguage;
    QString m_txtMaintAndSetting;
    QString m_txtOpeCheck;
    QString m_txtStatsControl;
    QString m_txtRegisterNewProduct;
    QString m_txtUsbMemory;
public:
     explicit Menu(QObject*parent = 0);
     QString txtAdjustRegisteredProduct();
     void setTxtAdjustRegisteredProduct(QString &value);
     QString txtControlPanel();
     void setTxtControlPanel(QString &value);
     QString txtDisplayProductList();
     void setTxtDisplayProductList(QString &value);
     QString txtHistory();
     void setTxtHistory(QString &value);
     QString txtLanguage();
     void setTxtLanguage(QString &value);
     QString txtMaintAndSetting();
     void setTxtMaintAndSetting(QString &value);
     QString txtOpeCheck();
     void setTxtOpeCheck(QString &value);
     QString txtStatsControl();
     void setTxtStatsControl(QString &value);
     QString txtRegisterNewProduct();
     void setTxtRegisterNewProduct(QString &value);
     QString txtUsbMemory();
     void setTxtUsbMemory(QString &value);
    Q_INVOKABLE int OnLoad();
    Q_INVOKABLE int OnChangeLanguage();
};

#endif // MENU_H
