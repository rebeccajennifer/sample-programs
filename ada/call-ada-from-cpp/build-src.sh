#_______________________________________________________________________
# Used to build a minimal C++ program that calls Ada functions.
#
# In this example, pkg_test is the Ada package that contains a function
# called by a C++ program. The package pkg_test has .adb and .ads files
# associated with it.
#_______________________________________________________________________

gnatmake -c pkg_test
g++      -c cpp_main.cpp
gnatbind -n pkg_test

gnatlink pkg_test -o a.out --LINK=g++ -lstdc++ cpp_main.o

