#include <tuple>
#include <vector>
#include <iostream>
#include <map>
#include <complex>
#include <set>

namespace shapes {
    class ShapeBase{
    public:
        ShapeBase();
        virtual double getArea();
        virtual void move(double dx, double dy)=0;
    };

    class Rectangle:public ShapeBase{
    public:
        Rectangle(double x0, double y0, double x1, double y1);
        virtual ~Rectangle();
        double getLength();
        double getHeight();
        virtual double getArea();
        virtual void move(double dx, double dy);
    private:
        double x0, y0, x1, y1;
    };

    class Square: public Rectangle{
    public:
        Square(double _x0, double _y0, double _side);
    };

    class Circle:public ShapeBase{
    public:
        Circle(double x0, double y0, double r);
        virtual ~Circle();
        std::tuple<double, double> getCenter();
        virtual double getArea();
        virtual void move(double dx, double dy);

    private:
        double x0, y0;
        double radius;
    };

    template<typename T>
    class Ellipse:public ShapeBase{
    public:
        Ellipse(double _x0, double _y0, T _lr, T _sr){x0 = _x0; y0 = _y0; lr = _lr; sr = _sr;}
        virtual ~Ellipse(){}
        std::tuple<double, double> getCenter(){return std::make_tuple(x0, y0);}
        virtual double getArea(){return 0.25*3.1415926*lr*sr;}
        virtual void move(double dx, double dy){x0+=dx; y0+=dy;}
        double getMajor(){return lr;}
        double getMinor(){return sr;}
    private:
        double x0, y0;
        T lr, sr;
    };

    template<typename T>
    class ShapeCollection{
    public:
        ShapeCollection(){}
        void push_back(T* xx){collection.push_back(*xx);}
        void pop_back(){collection.pop_back();}
        int size(){return collection.size();}
    private:
        std::vector<T> collection;
    };
}

struct MyStruct{
    double a;
    double b;
    double c;
};

std::vector<double> arr1DToDoubVector(double* _arr, int m);
void print1DVector(std::vector<double> _arr);

std::vector<std::vector<double> > arr2DToDoubVector(double* _arr, int m, int n);
void print2DVector(std::vector<std::vector<double> > _arr);

void printMap(std::map<std::string, double> _map);

void printMapOfComplex(std::map<double, std::complex<double> > _map);
void printMapOfComplexVec(std::map<double, std::vector<std::complex<double> > > _map);
void printComplex(std::complex<double> _comp);

void printVecOfComplexPair(std::vector<std::pair<std::complex<double>, std::complex<double> > > _vec);

void printSet(std::set<std::string> _set);

void printMyStruct(MyStruct _struct);
