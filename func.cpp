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

std::vector<std::vector<double> > arr2DToDoubVector(double* _arr, int m, int n){
    std::cout << "2D vector shape: " << m << "X" << n << std::endl;
    std::vector<std::vector<double> > answer(m, std::vector<double> (n, 0.0));
    for(int i = 0; i < m; ++i){
        for(int j = 0; j < n; ++j){
            answer[i][j] = *(_arr+i*n+j);
        }
    }
    return answer;
}
void print2DVector(std::vector<std::vector<double> > _arr){
    for (auto& i: _arr){
        for(auto& j: i)
            std::cout << j << " ";
        std::cout <<std::endl;
    }
}

void printMap(std::map<std::string, double> _map){
    for (auto& i: _map)
        std::cout << i.first << ", " << i.second << std::endl;
}


void printMapOfVector(std::map<double, std::vector<std::complex<double> > > _map){
	for (auto& elem : _map){
		std::cout << elem.first << ": ";
		for(auto& data : elem.second){
			std::cout << data << " ";
		}
		std::cout << std::endl;
	}
}
