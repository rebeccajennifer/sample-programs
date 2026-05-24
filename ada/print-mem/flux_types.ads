------------------------------------------------------------------------
-- Test types
------------------------------------------------------------------------

with Interfaces; use Interfaces;
with System;

------------------------------------------------------------------------
package flux_types is

  ----------------------------------------------------------------------
  type SHORT_WORDS_32 is record
    msw : Unsigned_16;
    lsw : Unsigned_16;
  end record;

  for SHORT_WORDS_32'Alignment use 4;

  for SHORT_WORDS_32 use record
    msw at 0 range  0 .. 15;
    lsw at 0 range 16 .. 31;
  end record;

  for SHORT_WORDS_32'Bit_Order use System.High_Order_First;

  ----------------------------------------------------------------------

  function  convert(source: Unsigned_32)    return Integer;
  function  convert(source: Long_Float)     return Float;
  function  convert(source: Short_Words_32) return Unsigned_32;
  function  convert(source: Unsigned_32)    return Short_Words_32;

  procedure ada_print_arg(int_arg: integer);

end flux_types;

