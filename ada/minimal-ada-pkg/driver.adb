------------------------------------------------------------------------
-- Minimal Ada package example
------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;

with pkg_test; use pkg_test;

procedure driver is
  begin
    Put_Line("________________________");
    Put_Line(" driver");
    Put_Line("________________________");

    pkg_test.ada_print_arg(4);

end driver;

