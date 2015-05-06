#include "Shape.hpp"

using namespace shapes;

Rectangle::Rectangle(double X0, double Y0, double X1, double Y1)
{
    x0 = X0;
    y0 = Y0;
    x1 = X1;
    y1 = Y1;
    std::make_tuple(X0, Y0);
    std::make_tuple(X1, Y1);
}

Rectangle::~Rectangle()
{
}

double Rectangle::getLength()
{
    return (x1 - x0);
}

double Rectangle::getHeight()
{
    return (y1 - y0);
}

double Rectangle::getArea()
{
    return (x1 - x0) * (y1 - y0);
}

void Rectangle::move(double dx, double dy)
{
    x0 += dx;
    y0 += dy;
    x1 += dx;
    y1 += dy;
}

Square::Square(double _x0, double _y0, double _side): Rectangle(_x0, _y0, _x0+_side, _y0+_side){}
