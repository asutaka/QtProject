#ifndef HANDLEMANAGER_H
#define HANDLEMANAGER_H

#include <QObject>

class HandleManager : public QObject
{
    Q_OBJECT
public:
    explicit HandleManager();
    ~HandleManager();
public:
    Q_INVOKABLE void setBlockSignal(QObject* obj, bool isBlock = true);
};

#endif // HANDLEMANAGER_H
