#ifndef APPTHEMEVM_H
#define APPTHEMEVM_H

#include <QObject>

class AppThemeVM : public QObject
{
  Q_OBJECT
public:
  explicit AppThemeVM(QObject *parent = 0);
  Q_INVOKABLE void onLoad();
signals:

public slots:
};

#endif // APPTHEMEVM_H
