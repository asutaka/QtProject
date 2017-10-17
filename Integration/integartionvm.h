#ifndef INTEGARTIONVM_H
#define INTEGARTIONVM_H
#include <QPixmap>
#include <QObject>

class IntegartionVM : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QList<QPixmap> listSourceImage READ listSourceImage WRITE setListSourceImage)
    Q_PROPERTY(QList<QPixmap> listSourceBackgroundImage READ listSourceBackgroundImage WRITE setListSourceBackgroundImage)
    Q_PROPERTY(QList<int> listColumnType READ listColumnType WRITE setListColumnType)

public:
    explicit IntegartionVM(QObject *parent = 0);

    Q_INVOKABLE void onLoad();
    Q_INVOKABLE void onUpdateData();
    QList<QPixmap> listSourceImage();
    void setListSourceImage(QList<QPixmap> &value);
    QList<QPixmap> listSourceBackgroundImage();
    void setListSourceBackgroundImage(QList<QPixmap> &value);

    QList<int> listColumnType();
    void setListColumnType(QList<int> &value);



private:
    enum ColumnGraphTypeId
    {
        BOTTOMTOTOP = 0,
        TOPTOBOTTOM,
        RIGHTTOLEFT,
        LEFTTORIGHT,
        MIDTOLEFT,
        MIDTORIGHT
    };
    int             m_NumberLine;
    QList<int>      m_ListColumnType;
    QList<QPixmap>  m_ListSourceImage;
    QList<QPixmap>  m_ListSourceBackgroundImage;

    int             m_ValueJudge;  // percent 0-100%

signals:

public slots:
};
#endif // INTEGARTIONVM_H
