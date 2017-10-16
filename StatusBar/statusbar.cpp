#include "statusbar.h"
#include <QHostAddress>
#include <QThread>
#include <string>
#include <QTimer>

StatusBar::StatusBar(QObject*parent): QObject(parent),count(0),msg("%1")
{
    msg.arg(count);
}
void StatusBar::connectQml()
{
    if(count%2==0)
    {
        StatusBar::Connect();
    }
    else
    {
        StatusBar::bytesWritten("STOP");
    }
    if(isConnect){
        count++;
    }
    else {
        count = -1;
    }
    emit sendResponse(msg.arg(count));
}

void StatusBar::Connect()
{
    socket = new QTcpSocket(this);
    socket->connectToHost("localhost", 1111);
    if(socket->waitForConnected(3000))
    {
        isConnect= true;
        StatusBar::bytesWritten("RUN");
        connect(socket, SIGNAL(readyRead()), this, SLOT(readyRead()));
        connect(socket, SIGNAL(disconnected()), this, SLOT(disconnected()));
    }
    else
    {
        isConnect= false;
    }
}

void StatusBar::readyRead()
{
    strWeight = socket->readAll();
}
QString StatusBar::getWeight(){
    return strWeight;
}

void StatusBar::bytesWritten(QByteArray bytes)
{
    socket->write(bytes);
    socket->flush();
}

void StatusBar::disconnected()
{
    socket->close();
}

