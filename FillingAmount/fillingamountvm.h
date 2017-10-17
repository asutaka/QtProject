#ifndef FILLINGAMOUNTVM_H
#define FILLINGAMOUNTVM_H

#include <QObject>
class FillingAmountVM : public QObject
{
  Q_OBJECT
public:
  explicit FillingAmountVM(QObject *parent = 0);

  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // FILLINGAMOUNTVM_H
