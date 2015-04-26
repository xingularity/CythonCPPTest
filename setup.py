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
import sys
if pm.system() == 'Darwin':
    sitepkg_path=""
    for i in sys.path:
        if i.count("site-packages")>0:
            sitepkg_path=i
    extensions = [Extension('rect', sourcefiles, language="c++", extra_compile_args=['-std=c++11', '-O3'], include_dirs = [sitepkg_path+"/numpy/core/include/"])]
else:
	extensions = [Extension('rect', sourcefiles, language="c++", extra_compile_args=['-std=c++11', '-O3'])]

setup(ext_modules = cythonize(extensions)
      )
