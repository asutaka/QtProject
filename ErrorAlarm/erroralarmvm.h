#ifndef ERRORALARMVM_H
#define ERRORALARMVM_H

#include <QObject>

class ErrorAlarmVM : public QObject
{
  Q_OBJECT
public:
  explicit ErrorAlarmVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // ERRORALARMVM_H
