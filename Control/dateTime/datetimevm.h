#ifndef DATETIMEVM_H
#define DATETIMEVM_H

#include <QObject>

class DateTimeVM : public QObject
{
  Q_OBJECT
public:
  explicit DateTimeVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // DATETIMEVM_H
