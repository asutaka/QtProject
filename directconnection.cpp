#include "directconnection.h"
#include <QMetaMethod>
#include <QDebug>

DirectConnection::DirectConnection(QObject *parent) :
    QObject(parent), _source(NULL), _destination(NULL), _isConnect(false)
{
}

QObject* DirectConnection::getSource()
{
    return _source;
}

void DirectConnection::setSource(QObject* source)
{
    _source = source;
}

QObject* DirectConnection::getDestination()
{
    return _destination;
}

void DirectConnection::setDestination(QObject* destination)
{
    _destination = destination;
}

QString DirectConnection::getSignal()
{
    return _signal;
}

void DirectConnection::setSignal(QString signal)
{
    _signal = signal;
}

QString DirectConnection::getSlot()
{
    return _slot;
}

void DirectConnection::setSlot(QString slot)
{
    _slot = slot;
}

bool DirectConnection::getIsConnect()
{
    return _isConnect;
}

void DirectConnection::setIsConnect(bool connect)
{
    if (connect) {
        bool handleConnect = tryConnect();
        if (handleConnect) {
            _isConnect = true;
        } else {
            _isConnect = false;
        }
    } else {
        bool ret = tryDisconnect();
        if (ret) {
            _isConnect = false;
        } else {
            _isConnect = true;
        }
    }
}

QMetaMethod DirectConnection::findMethod(QObject *owner, QString signature)
{
    const QMetaObject* metaObject = owner->metaObject();
    int index = metaObject->indexOfMethod(signature.toStdString().c_str());
    return metaObject->method(index);
}

bool DirectConnection::tryConnect()
{
    if(_source && _destination && !_signal.isNull() && !_slot.isNull())
    {
        QMetaMethod signal = findMethod(_source, _signal);
        QMetaMethod slot = findMethod(_destination, _slot);
        return QObject::connect(_source, signal,
                         _destination, slot,
                         Qt::DirectConnection);
    }
    return false;
}

bool DirectConnection::tryDisconnect()
{
    if(_source && _destination && !_signal.isNull() && !_slot.isNull())
    {
        QMetaMethod slot = findMethod(_destination, _slot);
        QMetaMethod signal = findMethod(_source, _signal);
        return QObject::disconnect(_source, signal, _destination, slot);
    }
    return true;
}
