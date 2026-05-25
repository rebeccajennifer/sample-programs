------------------------------------------------------------------------
-- Ada program to test unchecked conversion
------------------------------------------------------------------------

with Ada.Text_IO; use Ada.Text_IO;
with Ada.Unchecked_Conversion;
with Interfaces; use Interfaces;

with pkg_test; use pkg_test;

------------------------------------------------------------------------
procedure driver is

  -- Use unchecked conversion to convert uint to int
  a_uint : Unsigned_32 := 16#FFFFFFFF#;
  a_int  : Integer     := pkg_test.convert(a_uint);

  -- Use unchecked conversion to convert long float to float
  b_lfloat : Long_Float := 1.0;
  b_float  : Float      := pkg_test.convert(b_lfloat);

  begin
    Put_Line(" __________________________");
    Put_Line(" Unchecked_Conversion Tests");
    Put_Line(" __________________________");
    Put_Line("");
    Put_Line(" Unsigned Int to Int");
    Put_Line(" -------------------");
    Put_Line(" Unchecked conversion reinterprets the bit pattern directly.");
    Put_Line(" A value with all bits set to 1 represents -1 in two's");
    Put_Line(" complement, which is used for integer representation.");
    Put_Line("");
    Put_Line(" a_uint   = 0xFFFFFFFF          : " & Unsigned_32'Image(a_uint));
    Put_Line(" a_int    = unchk_cnv(a_uint)   : " & Integer'Image(a_int));

    Put_Line("");
    Put_Line(" Long Float to Float");
    Put_Line(" -------------------");
    Put_Line(" Unchecked conversion reinterprets bits, so 1.0 does not");
    Put_Line(" convert correctly.");
    Put_Line("");
    Put_Line(" b_lfloat = 1.0                 : " & Long_Float'Image(b_lfloat));
    Put_Line(" b_float  = unchk_cnv(b_lfloat) : " & Float'Image(b_float));

    return;

end driver;

