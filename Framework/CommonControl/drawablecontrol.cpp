#include "drawablecontrol.h"

DrawableControl::DrawableControl()
{
}

void DrawableControl::paint(QPainter *painter) {
    onPaintHandle(this, painter);
}
