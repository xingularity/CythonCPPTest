from libcpp.vector cimport vector
from libcpp.map cimport map
from libcpp.pair cimport pair
from libcpp.string cimport string
from libcpp.set cimport set

cdef extern from "Shape.hpp" namespace "shapes":
    cdef cppclass Rectangle:
        Rectangle(double, double, double, double) except +
        double getLength()
        double getHeight()
        double getArea()
        void move(double, double)

    cdef cppclass Square:
        Square(double, double, double) except +
        double getLength()
        double getHeight()
        double getArea()
        void move(double, double)

    cdef cppclass Circle:
        Circle(double, double, double) except +
        double getArea()
        void move(double, double)

    cdef cppclass Ellipse[T]:
        Ellipse(double, double, T, T) except +
        double getArea()
        void move(T, T)
        double getMajor()
        double getMinor()

    cdef cppclass ShapeCollection[T]:
        ShapeCollection() except +
        void push_back(T* xx)
        void pop_back()
        int size()

cdef extern from "Shape.hpp":
    cdef vector[double] arr1DToDoubVector(double* _arr, int m)
    cdef void print1DVector(vector[double] _arr)
    cdef vector[vector[double]] arr2DToDoubVector(double* _arr, int m, int n)
    cdef void print2DVector(vector[vector[double]] _arr)
    cdef void printMap(map[string, double] _map)
    cdef void printMapOfComplex(map[double, double complex] _map)
    cdef void printMapOfComplexVec(map[double, vector[complex]] _map)
    cdef void printComplex(double complex _comp)
    cdef void printSet(set[string] _set)
    cdef void printVecOfComplexPair(vector[pair[complex, complex]])
    cdef struct MyStruct:
        double a
        double b
        double c
    cdef void printMyStruct(MyStruct _struct)

cdef class PyRectangle:
    cdef Rectangle *thisptr      # hold a C++ instance which we're wrapping
    def __cinit__(self, double x0, double y0, double x1, double y1):
        self.thisptr = new Rectangle(x0, y0, x1, y1)
    def __dealloc__(self):
        del self.thisptr
    def getLength(self):
        return self.thisptr.getLength()
    def getHeight(self):
        return self.thisptr.getHeight()
    def getArea(self):
        return self.thisptr.getArea()
    def move(self, dx, dy):
        self.thisptr.move(dx, dy)

cdef class PySquare:
    cdef Square *thisptr
    def __cinit__(self, double x0, double y0, double _side):
        self.thisptr = new Square(x0, y0, _side)
    def __dealloc__(self):
        del self.thisptr
    def getLength(self):
        return self.thisptr.getLength()
    def getHeight(self):
        return self.thisptr.getHeight()
    def getArea(self):
        return self.thisptr.getArea()
    def move(self, dx, dy):
        self.thisptr.move(dx, dy)

cdef class PyCircle:
    cdef Circle *thisptr      # hold a C++ instance which we're wrapping
    def __cinit__(self, double x, double y, double r):
        self.thisptr = new Circle(x, y, r)
    def __dealloc__(self):
        del self.thisptr
    def getArea(self):
        return self.thisptr.getArea()
    def move(self, dx, dy):
        self.thisptr.move(dx, dy)

cdef class PyIntEllipse:
    cdef Ellipse[int] *thisptr      # hold a C++ instance which we're wrapping
    def __cinit__(self, double _x0, double _y0, int _lr, int _sr):
        self.thisptr = new Ellipse[int](_x0, _y0, _lr, _sr)
    def __dealloc__(self):
        del self.thisptr
    def getArea(self):
        return self.thisptr.getArea()
    def move(self, dx, dy):
        self.thisptr.move(dx, dy)
    def getMajor(self):
        return self.thisptr.getMajor()
    def getMinor(self):
        return self.thisptr.getMinor()

cdef class PyCircleCollection:
    cdef ShapeCollection[Circle] *thisptr
    def __cinit__(self):
        self.thisptr = new ShapeCollection[Circle]()
    def __dealloc__(self):
        del self.thisptr
    def push_back(self, PyCircle xx):
        self.thisptr.push_back(xx.thisptr)
    def pop_back(self):
        self.thisptr.pop_back()
    def size(self):
        return self.thisptr.size()

#from libcpp.vector cimport vector
#cdef vector[int] vect
#cdef int i
#for i in range(10):
#    vect.push_back(i)
#for i in range(10):
#    print vect[i]

import numpy as np
cimport numpy as np

def ndarrayToVector(np.ndarray[double, ndim=1, mode="c"] _ndarray not None):
    return arr1DToDoubVector(&_ndarray[0], _ndarray.shape[0])

def print1DArr(np.ndarray[double, ndim=1, mode="c"] _ndarray not None):
    print1DVector(ndarrayToVector(_ndarray))

def print1DList(list _list not None):
    print1DVector(_list)

def ndarray2DToVector(np.ndarray[double, ndim=2, mode="c"] _ndarray not None):
    return arr2DToDoubVector(&_ndarray[0, 0], _ndarray.shape[0], _ndarray.shape[1])

def print2DArr(np.ndarray[double, ndim=2, mode="c"] _ndarray not None):
    print2DVector(ndarray2DToVector(_ndarray))

#2D list can be converted to 2D std::vector
def print2DList(list _list not None):
    print2DVector(_list)

#In c++ file, the map is std::map<std::string, double>. In Python3, that std::string must be bytes type.
def printDict(dict _map not None):
    printMap(_map)

def printCPPMapOfComplex(dict _map not None):
    printMapOfComplex(_map)

def printCPPMapOfComplexVec(dict _map not None):
    printMapOfComplexVec(_map)

def printCPPComplex(_data not None):
    printComplex(_data)

def CyVecComplex(double complex a, double complex b):
    cdef vector.vector[double complex] vc
    vc.push_back(a)
    vc.push_back(b)
    return vc

def CyPrintVecOfComplexPair(list _list not None):
    printVecOfComplexPair(_list)

def CyPrintSet(_set not None):
    printSet(_set)

def cyPrintMyStruct(dict _in not None):
    printMyStruct(_in)
