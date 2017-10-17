#ifndef MENULISTVM_H
#define MENULISTVM_H

#include <QObject>

class MenuListVM : public QObject
{
  Q_OBJECT
public:
  explicit MenuListVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // MENULISTVM_H
