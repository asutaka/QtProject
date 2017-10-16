#ifndef STATUSBAR_H
#define STATUSBAR_H
#include <QString>
#include <QObject>
#include <QDebug>
#include <QTcpSocket>
#include <QAbstractSocket>

class StatusBar : public QObject
{
    Q_OBJECT
public:
    explicit StatusBar(QObject*parent = 0);
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
#endif // STATUSBAR_H

