from distutils.core import setup
from distutils.extension import Extension
from Cython.Build import cythonize

"""
setup(ext_modules = cythonize(
           "rect.pyx",                 # our Cython source
           sources=["Rectangle.cpp"],  # additional source file(s)
           language="c++",             # generate C++ code
      ))
"""

sourcefiles=['rect.pyx', 'Rectangle.cpp', 'Circle.cpp', 'ShapeBase.cpp']

extensions = [Extension('rect', sourcefiles, language="c++", extra_compile_args=['-std=c++11', '-O3'])]

setup(ext_modules = cythonize(extensions)
      )
