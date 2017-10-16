#ifndef MYSERVER_H
#define MYSERVER_H

#include <QtNetwork>
#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>

class MyServer: public QObject
{
    Q_OBJECT
public:
    MyServer();
    ~MyServer();
public slots:
    void acceptConnection();
    void on_readyRead();
    void on_disconnected();
private:
    QTcpServer server;
    QTcpSocket* client;
    int weightMax= 100;
    int weightMin= 0;
};
#endif // MYSERVER_H
