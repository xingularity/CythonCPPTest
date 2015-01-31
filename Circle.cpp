#include "Shape.hpp"

using namespace shapes;

Circle::Circle(double x, double y, double r){
    x0 = x;
    y0 = y;
    radius = r;
}

Circle::~Circle(){}

std::tuple<double, double> Circle::getCenter(){return std::make_tuple(x0, y0);}

double Circle::getArea(){
    return 3.1415926*radius*radius;
}

void Circle::move(double dx, double dy){
    x0+=dx;
    y0+=dy;
}
