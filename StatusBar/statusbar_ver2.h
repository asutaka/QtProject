#ifndef STATUSBAR_VER2_H
#define STATUSBAR_VER2_H

#include <QString>
#include <QObject>
#include <QDebug>
#include <QTcpSocket>
#include <QAbstractSocket>

class StatusBar_ver2 : public QObject
{
    Q_OBJECT
public:
    explicit StatusBar_ver2(QObject*parent = 0);
    void Connect();
    Q_INVOKABLE QString getWeight();
signals:
    void sendResponse(QString sms);
public slots:
    void connectQml();
    void readyRead();
    void disconnected();
    void bytesWritten(QByteArray bytes);
private:
    int count;
    int weight =0;
    bool isConnect= false;
    QString msg;
    QTcpSocket *socket;
    QString strWeight;
};

#endif // STATUSBAR_VER2_H
