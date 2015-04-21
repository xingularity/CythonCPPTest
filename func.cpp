#include "Shape.hpp"

std::vector<double> arr1DToDoubVector(double* _arr, int m){
    std::vector<double> answer;
    answer.assign(_arr, _arr+m-1);
    return answer;
}

void print1DVector(std::vector<double> _arr){
    for (auto& i : _arr){
        std::cout << i << " ";
    }
    std::cout << std::endl;
}
