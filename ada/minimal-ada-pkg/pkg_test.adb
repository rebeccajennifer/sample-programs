------------------------------------------------------------------------
-- Minimal Ada package example
------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

package body pkg_test is

  procedure ada_print_arg(int_arg: Integer) is
  begin

    Put_Line(" ada_print_arg");
    Put_Line("________________________");
    Put_Line(" Input argument: " & Integer'Image(int_arg));

  end ada_print_arg;

end pkg_test;

