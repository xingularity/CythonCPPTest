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

sourcefiles=['rect.pyx', 'Rectangle.cpp', 'Circle.cpp', 'ShapeBase.cpp', 'func.cpp']
import platform as pm
if pm.system() == 'Darwin':
    extensions = [Extension('rect', sourcefiles, language="c++", extra_compile_args=['-std=c++11', '-O3'], include_dirs = ["/usr/local/lib/python3.4/site-packages/numpy/core/include/"])]
else:
	extensions = [Extension('rect', sourcefiles, language="c++", extra_compile_args=['-std=c++11', '-O3'])]

setup(ext_modules = cythonize(extensions)
      )
