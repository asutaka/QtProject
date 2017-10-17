#ifndef DIRECTCONNECTIONFACTORY_H
#define DIRECTCONNECTIONFACTORY_H

#include <QObject>
#include <QMap>
#include "directconnection.h"

class DirectConnectionFactory
{
private:
    QMap<QString,DirectConnection> dictionary;
public:
    static DirectConnectionFactory* GetInstance();
    static QString GetKeyDirectConnection();
    DirectConnection requestDirectConnection(const QString &id);
private:
    DirectConnectionFactory();
    static DirectConnectionFactory* _instance;
};

#endif // DIRECTCONNECTIONFACTORY_H
