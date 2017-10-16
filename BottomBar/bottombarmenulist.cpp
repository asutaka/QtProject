#include "StatusBar/statusbar.h"
#include "client.h"


StatusBar::StatusBar(QObject*parent): QObject(parent), count(0),msg("%1")
{
msg.arg(count);
}
void StatusBar::connectQml(){
    //count++;
    //connect server
    Client client;
    client.connectServer("127.0.0.1", 1111);

    emit sendResponse(msg.arg(count));
}

