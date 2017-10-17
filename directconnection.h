#ifndef DIRECTCONNECTION_H
#define DIRECTCONNECTION_H

#include <QObject>

class DirectConnection : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QObject* source READ getSource WRITE setSource)
    Q_PROPERTY(QObject* destination READ getDestination WRITE setDestination)
    Q_PROPERTY(QString signal READ getSignal WRITE setSignal)
    Q_PROPERTY(QString slot READ getSlot WRITE setSlot)
    Q_PROPERTY(bool isConnect READ getIsConnect WRITE setIsConnect)
private:
    QString _signal, _slot;
    QObject* _source;
    QObject* _destination;
    bool _isConnect;
    bool tryConnect();
    bool tryDisconnect();
    QMetaMethod findMethod(QObject* owner, QString signature);
public:
    explicit DirectConnection(QObject *parent = 0);
    QObject* getSource();
    void setSource(QObject* source);
    QObject* getDestination();
    void setDestination(QObject* destination);
    QString getSignal();
    void setSignal(QString signal);
    QString getSlot();
    void setSlot(QString slot);
    bool getIsConnect();
    void setIsConnect(bool connect);

signals:

public slots:
};

#endif // DIRECTCONNECTION_H
