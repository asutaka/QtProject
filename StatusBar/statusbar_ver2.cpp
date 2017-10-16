#include "statusbar_ver2.h"
#include <QHostAddress>
#include <QThread>
#include <string>
#include <QTimer>

StatusBar_ver2::StatusBar_ver2(QObject *parent) : QObject(parent),count(0),msg("%1")
{
    msg.arg(count);
}

void StatusBar_ver2::connectQml()
{
    if(count%2==0)
    {
        StatusBar_ver2::Connect();
    }
    else
    {
        StatusBar_ver2::bytesWritten("STOP");
    }
    if(isConnect){
        count++;
    }
    else {
        count = -1;
    }
    emit sendResponse(msg.arg(count));
}

void StatusBar_ver2::Connect()
{
    socket = new QTcpSocket(this);
    socket->connectToHost("localhost", 1111);
    if(socket->waitForConnected(3000))
    {
        isConnect= true;
        StatusBar_ver2::bytesWritten("RUN");
        connect(socket, SIGNAL(readyRead()), this, SLOT(readyRead()));
        connect(socket, SIGNAL(disconnected()), this, SLOT(disconnected()));
    }
    else
    {
        isConnect= false;
    }
}

void StatusBar_ver2::readyRead()
{
    strWeight = socket->readAll();
}

QString StatusBar_ver2::getWeight(){
    return strWeight;
}

void StatusBar_ver2::bytesWritten(QByteArray bytes)
{
    socket->write(bytes);
    socket->flush();
}

void StatusBar_ver2::disconnected()
{
    socket->close();
}
