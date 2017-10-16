#ifndef IOMONITORSCREENVM_H
#define IOMONITORSCREENVM_H

#include <QObject>
#include <QColor>
#include "AppTheme/appthememanager.h"

class IOMonitorScreenVM : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString txtSampCycleTitle READ txtSampCycleTitle CONSTANT)
    Q_PROPERTY(QString txtSampCycleUnit READ txtSampCycleUnit CONSTANT)
    Q_PROPERTY(QString txtStart READ txtStart CONSTANT)
    Q_PROPERTY(QString txtStop READ txtStop CONSTANT)
    Q_PROPERTY(QString txtSMPCYCTitle READ txtSMPCYCTitle CONSTANT)
    Q_PROPERTY(QString txtDisplayTitle READ txtDisplayTitle CONSTANT)
    Q_PROPERTY(QString txtTrigerConditionTitle READ txtTrigerConditionTitle CONSTANT)
    Q_PROPERTY(QString txtTrigerNoTitle READ txtTrigerNoTitle CONSTANT)
    Q_PROPERTY(QString txtSignalTypeTitle READ txtSignalTypeTitle CONSTANT)
    Q_PROPERTY(QString txtScreenName2 READ txtScreenName2 CONSTANT)
    Q_PROPERTY(QString txtScreenName READ txtScreenName CONSTANT)
    Q_PROPERTY(QString txtClear READ txtClear CONSTANT)
    Q_PROPERTY(QString txtStartImport READ txtStartImport CONSTANT)
    Q_PROPERTY(QString txtStopImport READ txtStopImport CONSTANT)
    Q_PROPERTY(QString txtSignalSelection READ txtSignalSelection CONSTANT)
    Q_PROPERTY(QString txtSignalCondition READ txtSignalCondition CONSTANT)
    Q_PROPERTY(QString txtBack READ txtBack CONSTANT)

    Q_PROPERTY(QString txtSignalSelectTitle READ txtSignalSelectTitle CONSTANT)
    Q_PROPERTY(QString txtInputName READ txtInputName CONSTANT)
    Q_PROPERTY(QString txtOutputName READ txtOutputName CONSTANT)
    Q_PROPERTY(QString txtInternalName READ txtInternalName CONSTANT)
    Q_PROPERTY(QString txtNoneName READ txtNoneName CONSTANT)
    Q_PROPERTY(QString txtBtnOKName READ txtBtnOKName CONSTANT)
    Q_PROPERTY(QString txtBtnCancelName READ txtBtnCancelName CONSTANT)

    Q_PROPERTY(QStringList listLibraryInput READ listLibraryInput CONSTANT)
    Q_PROPERTY(QStringList lisLibraryOutput READ lisLibraryOutput CONSTANT)
    Q_PROPERTY(QStringList listLibraryInternal READ listLibraryInternal CONSTANT)

    Q_PROPERTY(QStringList listSMPCYC READ listSMPCYC CONSTANT)
    Q_PROPERTY(QStringList listDisplay READ listDisplay CONSTANT)
    Q_PROPERTY(QStringList listTrigerCondition READ listTrigerCondition CONSTANT)
    Q_PROPERTY(QStringList listTrigerNo READ listTrigerNo CONSTANT)
    Q_PROPERTY(QStringList listSignalType READ listSignalType CONSTANT)
    Q_PROPERTY(QColor colorItemControlBkg READ colorItemControlBkg CONSTANT)

public:
    explicit IOMonitorScreenVM();

    QString txtSampCycleTitle();
    void setTxtSampCycleTitle(QString &value);
    QString txtSampCycleUnit();
    void setTxtSampCycleUnit(QString &value);
    QString txtStart();
    void setTxtStart(QString &value);
    QString txtStop();
    void setTxtStop(QString &value);
    QString txtSMPCYCTitle();
    void setTxtSMPCYCTitle(QString &value);
    QString txtDisplayTitle();
    void setTxtDisplayTitle(QString &value);
    QString txtTrigerConditionTitle();
    void setTxtTrigerConditionTitle(QString &value);
    QString txtTrigerNoTitle();
    void setTxtTrigerNoTitle(QString &value);
    QString txtSignalTypeTitle();
    void setTxtSignalTypeTitle(QString &value);
    QString txtScreenName2();
    void setTxtScreenName2(QString &value);
    QString txtScreenName();
    void setTxtScreenName(QString &value);
    QString txtClear();
    void setTxtClear(QString &value);
    QString txtStartImport();
    void setTxtStartImport(QString &value);
    QString txtStopImport();
    void setTxtStopImport(QString &value);
    QString txtSignalSelection();
    void setTxtSignalSelection(QString &value);
    QString txtSignalCondition();
    void setTxtSignalCondition(QString &value);
    QString txtBack();
    void setTxtBack(QString &value);

    QString txtSignalSelectTitle();
    void setTxtSignalSelectTitle(QString &value);
    QString txtInputName();
    void setTxtInputName(QString &value);
    QString txtOutputName();
    void setTxtOutputName(QString &value);
    QString txtInternalName();
    void setTxtInternalName(QString &value);
    QString txtNoneName();
    void setTxtNoneName(QString &value);
    QString txtBtnOKName();
    void setTxtBtnOKName(QString &value);
    QString txtBtnCancelName();
    void setTxtBtnCancelName(QString &value);

    QStringList listLibraryInput();
    void setListLibraryInput(QStringList &value);
    QStringList lisLibraryOutput();
    void setLisLibraryOutput(QStringList &value);
    QStringList listLibraryInternal();
    void setListLibraryInternal(QStringList &value);

    QStringList listSMPCYC();
    void setListSMPCYC(QStringList &value);
    QStringList listDisplay();
    void setListDisplay(QStringList &value);
    QStringList listTrigerCondition();
    void setListTrigerCondition(QStringList &value);
    QStringList listTrigerNo();
    void setListTrigerNo(QStringList &value);
    QStringList listSignalType();
    void setListSignalType(QStringList &value);
    QColor colorItemControlBkg();
    void setColorItemControlBkg(QColor &value);

    Q_INVOKABLE void onLoad();
    Q_INVOKABLE int onChangeLanguage();

private:
    QString m_TxtSampCycleTitle;
    QString m_TxtSampCycleUnit;
    QString m_TxtStart;
    QString m_TxtStop;
    QString m_TxtSMPCYCTitle;
    QString m_TxtDisplayTitle;
    QString m_TxtTrigerConditionTitle;
    QString m_TxtTrigerNoTitle;
    QString m_TxtSignalTypeTitle;
    QString m_TxtScreenName2;
    QString m_TxtScreenName;
    QString m_TxtClear;
    QString m_TxtStartImport;
    QString m_TxtStopImport;
    QString m_TxtSignalSelection;
    QString m_TxtSignalCondition;
    QString m_TxtBack;

    QString m_TxtSignalSelectTitle;
    QString m_TxtInputName;
    QString m_TxtOutputName;
    QString m_TxtInternalName;
    QString m_TxtNoneName;
    QString m_TxtBtnOKName;
    QString m_TxtBtnCancelName;

    QStringList m_ListLibraryInput;
    QStringList m_ListLibraryOutput;
    QStringList m_ListLibraryInternal;

    QStringList m_ListSMPCYC;
    QStringList m_ListDisplay;
    QStringList m_ListTrigerCondition;
    QStringList m_ListTrigerNo;
    QStringList m_ListSignalType;
    QColor m_colorItemControlBkg;
};

#endif // IOMONITORSCREENVM_H
