#include <QCoreApplication>
#include "myserver.h"

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
MyServer server;
//Server.StartServer();
    return a.exec();
}
