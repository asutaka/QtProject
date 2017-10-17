#ifndef OEEVM_H
#define OEEVM_H

#include <QObject>

class OeeVM : public QObject
{
  Q_OBJECT
public:
  explicit OeeVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // OEEVM_H
