with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

package body pkg_test is

  ----------------------------------------------------------------------
  function uint_to_int is
    new Ada.Unchecked_Conversion
      ( Source => Unsigned_32
      , Target => Integer
      );

  ----------------------------------------------------------------------
  function doubl_to_float is
    new Ada.Unchecked_Conversion
      ( Source => Long_Float
      , Target => Float
      );

  ----------------------------------------------------------------------
  function convert(source: Unsigned_32) return Integer is
  begin
    return uint_to_int(source);
  end convert;

  ----------------------------------------------------------------------
  function convert(source: Long_Float) return Float is
  begin
    return doubl_to_float(source);
  end convert;

  ----------------------------------------------------------------------
  procedure ada_print_arg(int_arg: Integer) is
  begin

    Put_Line(" ada_print_arg");
    Put_Line(" _____________");
    Put_Line(" Input argument: " & Integer'Image(int_arg));

  end ada_print_arg;

end pkg_test;

