#ifndef INTERNALSTATUSMONITORVM_H
#define INTERNALSTATUSMONITORVM_H

#include <QObject>

class InternalStatusMonitorVM : public QObject
{
  Q_OBJECT
public:
  explicit InternalStatusMonitorVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // INTERNALSTATUSMONITORVM_H
