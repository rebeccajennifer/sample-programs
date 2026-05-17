------------------------------------------------------------------------
-- Minimal Ada package containing a function to be called from C++.
------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

package body pkg_test is

  procedure ada_print_arg(int_arg: Integer) is
  begin

    Set_Output(Standard_Output);

    Put_Line(" ada_print_arg");
    Put_Line(" ____________________");
    Put_Line(" Input argument: " & Integer'Image(int_arg));
    Put_Line("");

  end ada_print_arg;

end pkg_test;

