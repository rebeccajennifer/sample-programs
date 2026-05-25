------------------------------------------------------------------------
-- Test types
------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;

package body flux_types is


  ----------------------------------------------------------------------
  function u32_to_sw32 is
    new Ada.Unchecked_Conversion
      ( Source => Unsigned_32
      , Target => Short_Words_32
      );

  function  convert(source: Unsigned_32) return Short_Words_32 is
  begin return u32_to_sw32(source); end convert; 

  ----------------------------------------------------------------------
  function sw32_to_u32 is
    new Ada.Unchecked_Conversion
      ( Source => Short_Words_32
      , Target => Unsigned_32
      );

  function  convert(source: Short_Words_32) return Unsigned_32 is
  begin return sw32_to_u32(source); end convert; 

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

end flux_types;

