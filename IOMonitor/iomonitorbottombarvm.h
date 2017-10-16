#ifndef IOMONITORBOTTOMBARVM_H
#define IOMONITORBOTTOMBARVM_H

#include <QObject>
#include <QFont>
#include <QColor>

class IOMonitorBottomBarVM : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString txtBack READ txtBack CONSTANT)
    Q_PROPERTY(QString txtClear READ txtClear CONSTANT)
    Q_PROPERTY(QString txtStartImport READ txtStartImport CONSTANT)
    Q_PROPERTY(QString txtStopImport READ txtStopImport CONSTANT)
    Q_PROPERTY(QString txtSignalSelection READ txtSignalSelection CONSTANT)
    Q_PROPERTY(QString txtSignalCondition READ txtSignalCondition CONSTANT)

    Q_PROPERTY(QString btnBackSourceBkg READ btnBackSourceBkg CONSTANT)
    Q_PROPERTY(QString btnBackSourceActive READ btnBackSourceActive CONSTANT)
    Q_PROPERTY(QString btnBackSourceIcon READ btnBackSourceIcon CONSTANT)

    Q_PROPERTY(QString btnSourceBkg READ btnSourceBkg CONSTANT)
    Q_PROPERTY(QString btnSourceActive READ btnSourceActive CONSTANT)
    Q_PROPERTY(QString btnClearSourceIcon READ btnClearSourceIcon CONSTANT)

    Q_PROPERTY(QString btnStartImportIcon READ btnStartImportIcon CONSTANT)
    Q_PROPERTY(QString btnStopImportIcon READ btnStopImportIcon CONSTANT)
    Q_PROPERTY(QString btnSignalSelectionIcon READ btnSignalSelectionIcon CONSTANT)
    Q_PROPERTY(QString btnSignalConditionIcon READ btnSignalConditionIcon CONSTANT)

    Q_PROPERTY(QFont fontText READ fontText CONSTANT)
    Q_PROPERTY(QColor colorText READ colorText CONSTANT)

public:
    explicit IOMonitorBottomBarVM();

    QString txtBack();
    void setTxtBack(QString &value);
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

    QString btnBackSourceBkg();
    void setBtnBackSourceBkg(QString &value);
    QString btnBackSourceActive();
    void setBtnBackSourceActive(QString &value);
    QString btnBackSourceIcon();
    void setBtnBackSourceIcon(QString &value);
    QString btnSourceBkg();
    void setBtnSourceBkg(QString &value);
    QString btnSourceActive();
    void setBtnSourceActive(QString &value);
    QString btnClearSourceIcon();
    void setBtnClearSourceIcon(QString &value);
    QString btnStartImportIcon();
    void setBtnStartImportIcon(QString &value);
    QString btnStopImportIcon();
    void setBtnStopImportIcon(QString &value);
    QString btnSignalSelectionIcon();
    void setBtnSignalSelectionIcon(QString &value);
    QString btnSignalConditionIcon();
    void setBtnSignalConditionIcon(QString &value);

    QFont fontText();
    void setFontText(QFont &value);
    QColor colorText();
    void setColorText(QColor &value);

    Q_INVOKABLE void onChangeLanguage();

private:
    QString m_TxtBack;
    QString m_TxtClear;
    QString m_TxtStartImport;
    QString m_TxtStopImport;
    QString m_TxtSignalSelection;
    QString m_TxtSignalCondition;
    QString m_BtnBackSourceBkg;
    QString m_BtnBackSourceActive;
    QString m_BtnBackSourceIcon;
    QString m_BtnSourceBkg;
    QString m_BtnSourceActive;
    QString m_BtnClearSourceIcon;
    QString m_BtnStartImportIcon;
    QString m_BtnStopImportIcon;
    QString m_BtnSignalSelectionIcon;
    QString m_BtnSignalConditionIcon;

    QFont m_FontText;
    QColor m_ColorText;

    void loadImage();
};

#endif // IOMONITORBOTTOMBARVM_H
