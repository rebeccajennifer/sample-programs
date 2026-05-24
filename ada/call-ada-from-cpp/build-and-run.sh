#! /usr/bin/bash
#_______________________________________________________________________
# Used to build a minimal C++ program that calls Ada functions.
#
# In this example, pkg_test is the Ada package that contains a function
# called by a C++ program. The package pkg_test has .adb and .ads files
# associated with it.
#_______________________________________________________________________

echo "________________________________________________________________"
echo " //\\o.o/\\\\    //\\o.o/\\\\    //\\o.o/\\\\    //\\o.o/\\\\    //\\o.o/\\\\"
echo "________________________________________________________________"

echo " BUILD PROJECT"
echo "________________________________________________________________"
echo ""



gnatmake -c pkg_test
g++      -c cpp_main.cpp
gnatbind -n pkg_test

gnatlink pkg_test -o a.out --LINK=g++ -lstdc++ cpp_main.o

echo "________________________________________________________________"
echo " RUN EXECUTABLE"
echo "________________________________________________________________"
echo ""
./a.out

echo ""
echo "________________________________________________________________"
echo " DELETE EXECUTABLE"

# Delete executable
rm a.out

echo "________________________________________________________________"
echo " //\\o.o/\\\\    //\\o.o/\\\\    //\\o.o/\\\\    //\\o.o/\\\\    //\\o.o/\\\\"
echo "________________________________________________________________"

