#ifndef ADJUSTTIMINGVER4_VM_H
#define ADJUSTTIMINGVER4_VM_H
#include <QtQuick/QQuickPaintedItem>
#include <Lang/lang.h>
#include "AppTheme/appthememanager.h"

class AdjustTimingVer4_VM :public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString txtWeight READ txtWeight WRITE setTxtWeight NOTIFY txtWeightChanged)
    Q_PROPERTY(QString txtRefValue READ txtRefValue WRITE setTxtRefValue NOTIFY txtRefValueChanged)
    Q_PROPERTY(QString txtProdLen READ txtProdLen WRITE setTxtProdLen NOTIFY txtProdLenChanged)
    Q_PROPERTY(QString txtT1 READ txtT1 WRITE setTxtT1 NOTIFY txtT1Changed)
    Q_PROPERTY(QString txtT2 READ txtT2 WRITE setTxtT2 NOTIFY txtT2Changed)
    Q_PROPERTY(QString txtT3 READ txtT3 WRITE setTxtT3 NOTIFY txtT3Changed)
    Q_PROPERTY(QString txtT4 READ txtT4 WRITE setTxtT4 NOTIFY txtT4Changed)
    Q_PROPERTY(QString txtT7 READ txtT7 WRITE setTxtT7 NOTIFY txtT7Changed)
    Q_PROPERTY(QString txtT9 READ txtT9 WRITE setTxtT9 NOTIFY txtT9Changed)
    Q_PROPERTY(QString txtFilterTime READ txtFilterTime WRITE setTxtFilterTime NOTIFY txtFilterTimeChanged)
    Q_PROPERTY(QString txtUnitY READ txtUnitY WRITE setTxtUnitY NOTIFY txtUnitYChanged)
    Q_PROPERTY(QString txtUnitT READ txtUnitT WRITE setTxtUnitT NOTIFY txtUnitTChanged)
    Q_PROPERTY(QString txtUnitG READ txtUnitG WRITE setTxtUnitG NOTIFY txtUnitGChanged)
    Q_PROPERTY(QString txtUnitMS READ txtUnitMS WRITE setTxtUnitMS NOTIFY txtUnitMSChanged)
    Q_PROPERTY(QString txtUnitMM READ txtUnitMM WRITE setTxtUnitMM NOTIFY txtUnitMMChanged)
    Q_PROPERTY(QString txtUnitDIV READ txtUnitDIV WRITE setTxtUnitDIV NOTIFY txtUnitDIVChanged)

    Q_PROPERTY(QString txtProdName READ txtProdName WRITE setTxtProdName NOTIFY txtProdNameChanged)
    Q_PROPERTY(QString txtSample READ txtSample WRITE setTxtSample NOTIFY txtSampleChanged)

    Q_PROPERTY(qreal valueProdNo READ valueProdNo WRITE setValueProdNo NOTIFY valueProdNoChanged)
    Q_PROPERTY(qreal valueRefVal READ valueRefVal WRITE setValueRefVal NOTIFY valueRefValChanged)
    Q_PROPERTY(qreal valueProdLen READ valueProdLen WRITE setValueProdLen NOTIFY valueProdLenChanged)
    Q_PROPERTY(qreal valueT1 READ valueT1 WRITE setValueT1 NOTIFY valueT1Changed)
    Q_PROPERTY(qreal valueT2 READ valueT2 WRITE setValueT2 NOTIFY valueT2Changed)
    Q_PROPERTY(qreal valueT3 READ valueT3 WRITE setValueT3 NOTIFY valueT3Changed)
    Q_PROPERTY(qreal valueT4 READ valueT4 WRITE setValueT4 NOTIFY valueT4Changed)
    Q_PROPERTY(qreal valueT7 READ valueT7 WRITE setValueT7 NOTIFY valueT7Changed)
    Q_PROPERTY(qreal valueT9 READ valueT9 WRITE setValueT9 NOTIFY valueT9Changed)
    Q_PROPERTY(qreal valueFilterTime READ valueFilterTime WRITE setValueFilterTime NOTIFY valueFilterTimeChanged)
    Q_PROPERTY(qreal valueWeight READ valueWeight WRITE setValueWeight NOTIFY valueWeightChanged)
    Q_PROPERTY(qreal valueY READ valueY WRITE setValueY NOTIFY valueYChanged)
    Q_PROPERTY(qreal valueT READ valueT WRITE setValueT NOTIFY valueTChanged)

signals:
    void txtWeightChanged();
    void txtProdLenChanged();
    void txtT1Changed();
    void txtT2Changed();
    void txtT3Changed();
    void txtT4Changed();
    void txtT7Changed();
    void txtT9Changed();
    void txtFilterTimeChanged();
    void txtUnitYChanged();
    void txtUnitTChanged();
    void txtUnitGChanged();
    void txtUnitMSChanged();
    void txtUnitMMChanged();
    void txtUnitDIVChanged();
    void txtProdNameChanged();
    void txtSampleChanged();
    void valueProdNoChanged();
    void valueRefValChanged();
    void valueProdLenChanged();
    void valueT1Changed();
    void valueT2Changed();
    void valueT3Changed();
    void valueT4Changed();
    void valueT7Changed();
    void valueT9Changed();
    void valueFilterTimeChanged();
    void valueWeightChanged();
    void valueYChanged();
    void valueTChanged();

public:
    AdjustTimingVer4_VM();
    ~AdjustTimingVer4_VM();

    //property label panel

    QString txtProdName ();
    void setTxtProdName(QString &value);
    QString txtSample ();
    void setTxtSample(QString &value);
    QString txtWeight ();
    void setTxtWeight(QString &value);
    QString txtRefValue ();
    void setTxtRefValue(QString &value);
    QString txtProdLen ();
    void setTxtProdLen(QString &value);
    QString txtT1 ();
    void setTxtT1(QString &value);
    QString txtT2 ();
    void setTxtT2(QString &value);
    QString txtT3 ();
    void setTxtT3(QString &value);
    QString txtT4 ();
    void setTxtT4(QString &value);
    QString txtT7 ();
    void setTxtT7(QString &value);
    QString txtT9 ();
    void setTxtT9(QString &value);
    QString txtFilterTime ();
    void setTxtFilterTime(QString &value);
    QString txtUnitY ();
    void setTxtUnitY(QString &value);
    QString txtUnitT ();
    void setTxtUnitT(QString &value);
    QString txtUnitG ();
    void setTxtUnitG(QString &value);
    QString txtUnitMS ();
    void setTxtUnitMS(QString &value);
    QString txtUnitMM ();
    void setTxtUnitMM(QString &value);
    QString txtUnitDIV ();
    void setTxtUnitDIV(QString &value);

    //txtValue
    qreal valueProdNo();
    void setValueProdNo(qreal &value);
    qreal valueRefVal();
    void setValueRefVal(qreal &value);
    qreal valueProdLen();
    void setValueProdLen(qreal &value);
    qreal valueT1();
    void setValueT1(qreal &value);
    qreal valueT2();
    void setValueT2(qreal &value);
    qreal valueT3();
    void setValueT3(qreal &value);
    qreal valueT4();
    void setValueT4(qreal &value);
    qreal valueT7();
    void setValueT7(qreal &value);
    qreal valueT9();
    void setValueT9(qreal &value);
    qreal valueWeight();
    void setValueWeight(qreal &value);
    qreal valueT();
    void setValueT(qreal &value);
    qreal valueY();
    void setValueY(qreal &value);
    qreal valueFilterTime();
    void setValueFilterTime(qreal &value);

    Q_INVOKABLE void OnLoad();
    Q_INVOKABLE void onChangeLanguage();
    Q_INVOKABLE QList <int> genDataWeight();
    //Q_INVOKABLE void setTheme();
    Q_INVOKABLE QString getBackGColor();
    Q_INVOKABLE QString getTextColor();
    Q_INVOKABLE QString getLineColor();
    Q_INVOKABLE QString getValueColor();
    Q_INVOKABLE QString getWeightValueColor();

private:
    QString m_TxtProdName;
    QString m_TxtSample;
    QString m_TxtWeight;
    QString m_TxtRefValue;
    QString m_TxtProdLen;
    QString m_TxtT1;
    QString m_TxtT2;
    QString m_TxtT3;
    QString m_TxtT4;
    QString m_TxtT7;
    QString m_TxtT9;
    QString m_TxtFilterTime;
    QString m_TxtUnitY;
    QString m_TxtUnitT;
    QString m_TxtUnitG;
    QString m_TxtUnitMS;
    QString m_TxtUnitMM;
    QString m_TxtUnitDIV;

    qreal m_ValueProdNo;
    qreal m_ValueRefValue;
    qreal m_ValueProdLen;
    qreal m_ValueT1;
    qreal m_ValueT2;
    qreal m_ValueT3;
    qreal m_ValueT4;
    qreal m_ValueT7;
    qreal m_ValueT9;
    qreal m_ValueWeight;
    qreal m_ValueUnitY;
    qreal m_ValueUnitT;
    qreal m_ValueFilterTime;

signals:
    void txtRefValueChanged();

};

#endif // ADJUSTTIMINGVER4_VM_H
