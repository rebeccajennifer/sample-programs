------------------------------------------------------------------------
-- Minimal Ada package containing a function to be called from C++.
------------------------------------------------------------------------

package pkg_test is

  procedure ada_print_arg(int_arg: Integer);
  pragma export(C, ada_print_arg, "cpp_import_ada_print_arg");

end pkg_test;

