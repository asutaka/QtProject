#ifndef TESTFRAMEWORK_H
#define TESTFRAMEWORK_H
#include "drawcontrolbase.h"


class TestFramework : public DrawControlBase
{
public:
    TestFramework(QQuickItem* parent = 0);
    ~TestFramework();
    void paint(QPainter *painter);
};

#endif // TESTFRAMEWORK_H
