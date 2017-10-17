#ifndef TESTFRAMEWORK_H
#define TESTFRAMEWORK_H
#include <QPainter>
#include <QQuickPaintedItem>

class TestFramework : public QQuickItem
{
    Q_OBJECT
public:
    TestFramework(QQuickItem* parent = 0);
    ~TestFramework();
    void paint(QPainter *painter);
    Q_INVOKABLE void DrawControl(QQuickItem *item, QPainter *painter);
    Q_INVOKABLE void TestFunction(int a);
};

#endif // TESTFRAMEWORK_H
