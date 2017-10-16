#include "testframework.h"

TestFramework::TestFramework(QQuickItem *parent): DrawControlBase(parent)
{

}
TestFramework::~TestFramework()
{
}
void TestFramework::paint(QPainter *painter)
{
    DrawControlBase::paint(painter);
}
