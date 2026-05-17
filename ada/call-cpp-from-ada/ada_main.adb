------------------------------------------------------------------------
-- Minimal Ada program that calls C++.
------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

procedure ada_main is

  procedure ada_import_cpp_print_arg(int_arg: Integer);
  pragma import (C, ada_import_cpp_print_arg, "cpp_print_arg");

begin
    Put_Line("________________________");
    Put_Line(" Calling C++");
    Put_Line("________________________");

    ada_import_cpp_print_arg(4);

end ada_main;

