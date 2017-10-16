#include "myserver.h"
#include <QDebug>
#include <string>
#include <iostream>

MyServer::MyServer()
{
    connect(&server, SIGNAL(newConnection()),this, SLOT(acceptConnection()));
    if(server.listen(QHostAddress::Any, 1111)){
        qDebug()<<"Server is listening connect...";
    }
    else{
        qDebug()<<"Server can't start!" ;
    }
}

MyServer::~MyServer()
{
    server.close();
}

void MyServer::acceptConnection()
{
    while(server.hasPendingConnections()){
        client = server.nextPendingConnection();
        if(client->state() == QTcpSocket::ConnectedState){
            qDebug() << "Connected!";
            connect(client, SIGNAL(readyRead()), SLOT(on_readyRead()));
            connect(client, SIGNAL(disconnected()), SLOT(on_disconnected()));
        }
        else{
            qDebug() << "Error!";
        }
    }
}

void MyServer::on_readyRead()
{
    while(client->bytesAvailable()> 0){
        char buffer[1024] = {0};
        client->read(buffer, client->bytesAvailable());
        if(strcmp(buffer,"RUN")==0){
            qDebug() << "Send weight";
            while(client->state() == QTcpSocket::ConnectedState )
            {
                int weight = rand()%(weightMax-weightMin)+weightMin;
                QString strWeight =  QString::number(weight);
                QByteArray arrWeight = strWeight.toLatin1();
                const char *response = arrWeight.data();
                client->write(response);
                client->flush();
                client->waitForReadyRead(500);
                client->read(buffer, client->bytesAvailable());
                if(strcmp(buffer,"STOP")==0)
                {
                    qDebug()<< "Client request disconnect!";
                    on_disconnected();
                }
            }
        }
    }
}
void MyServer::on_disconnected(){
    qDebug()<< "Disconnect!";
    client->disconnectFromHost();
}
