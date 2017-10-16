#ifndef IOMONITORSTATUSBARVM_H
#define IOMONITORSTATUSBARVM_H

#include <QObject>
#include <QFont>
#include <QColor>

class IOMonitorStatusBarVM : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QFont fontText READ fontText CONSTANT)
    Q_PROPERTY(QColor colorText READ colorText CONSTANT)

    Q_PROPERTY(QString txtDisplayTitle READ txtDisplayTitle CONSTANT)

    Q_PROPERTY(QString btnSourceBkg READ btnSourceBkg CONSTANT)
    Q_PROPERTY(QString btnSourceActive READ btnSourceActive CONSTANT)

public:
    explicit IOMonitorStatusBarVM();

    QString txtDisplayTitle();
    void setTxtDisplayTitle(QString &value);

    QFont fontText();
    void setFontText(QFont &value);
    QColor colorText();
    void setColorText(QColor &value);

    QString btnSourceBkg();
    void setBtnSourceBkg(QString &value);
    QString btnSourceActive();
    void setBtnSourceActive(QString &value);

    Q_INVOKABLE void onChangeLanguage();

private:
    QFont m_FontText;
    QColor m_ColorText;
    QString m_BtnSourceBkg;
    QString m_BtnSourceActive;
    QString m_TxtDisplayTitle;

    void loadImage();
};

#endif // IOMONITORSTATUSBARVM_H
