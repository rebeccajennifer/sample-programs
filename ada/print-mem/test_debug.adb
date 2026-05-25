------------------------------------------------------------------------
-- Test program 
------------------------------------------------------------------------

with debug_print; use debug_print;
with Interfaces;  use Interfaces;
with System;

with flux_types; use flux_types;

------------------------------------------------------------------------
procedure test_debug is

    CC : Boolean       := True;
    DD : Boolean       := False;
    EE : Boolean       := True;
  ----------------------------------------------------------------------

  short_word_32_var : SHORT_WORDS_32 := (msw => 16#AAAA#, lsw => 16#BBBB#);

  --u_to_s : Short_Words_32 := convert(Unsigned_32(16#ABCDEF00#));
  u_to_s : Short_Words_32 := short_word_32_var;
  s_to_u : Unsigned_32    := convert(short_word_32_var);
 
  ----------------------------------------------------------------------
  type Hi_Bit_Order_Record is record
    A : Integer       := 16#01234567#;
    B : Short_Integer := 16#7FFF#;
    C : Boolean       := CC; 
    D : Boolean       := DD;
    E : Boolean       := EE;
  end record;

  for Hi_Bit_Order_Record use record
    C at 0 range 0 .. 0;
    D at 0 range 1 .. 1;
    E at 0 range 2 .. 2;
  end record;

  for Hi_Bit_Order_Record'Bit_Order
    use System.High_Order_First;
  
  ----------------------------------------------------------------------

  type Lo_Bit_Order_Record is record
    A : Integer       := 16#01234567#;
    B : Short_Integer := 16#7FFF#;
    C : Boolean       := CC; 
    D : Boolean       := DD;
    E : Boolean       := EE;
  end record;

  for Lo_Bit_Order_Record use record
    C at 0 range 0 .. 0;
    D at 0 range 1 .. 1;
    E at 0 range 2 .. 2;
  end record;

  for Lo_Bit_Order_Record'Bit_Order
    use System.Low_Order_First;

  ----------------------------------------------------------------------

  type No_Bit_Order_Record is record
    A : Integer       := 16#01234567#;
    B : Short_Integer := 16#7FFF#;
    C : Boolean       := CC; 
    D : Boolean       := DD;
    E : Boolean       := EE;
  end record;

  for No_Bit_Order_Record use record
    C at 0 range 0 .. 0;
    D at 0 range 1 .. 1;
    E at 0 range 2 .. 2;
  end record;

  ----------------------------------------------------------------------
 
  hi_data : Hi_Bit_Order_Record;
  lo_data : Lo_Bit_Order_Record;
  no_data : No_Bit_Order_Record;

  shorty : Short_Integer    := 16#0ABC#;
  an_int : Unsigned_32      := 16#C0FFEEEE#;

begin

  --debug_print.print_bytes_in_four(
  --  in_ptr       => lo_data'Address,
  --  byte_count   => lo_data'Size / 8,  -- Bits to bytes
  --  optional_str => " Lo_Order"
  --);

  --debug_print.print_bytes_in_four(
  --  in_ptr       => hi_data'Address,
  --  byte_count   => hi_data'Size / 8,  -- Bits to bytes
  --  optional_str => " Hi_Order"
  --);

  --debug_print.print_bytes_in_four(
  --  in_ptr       => no_data'Address,
  --  byte_count   => no_data'Size / 8,  -- Bits to bytes
  --  optional_str => " No_Order"
  --);

  debug_print.print_bytes_in_four(
    in_ptr       => u_to_s'Address,
    byte_count   => u_to_s'Size / 8,  -- Bits to bytes
    optional_str => " Short_Words_32"
  );

  debug_print.print_bytes_in_four(
    in_ptr       => s_to_u'Address,
    byte_count   => s_to_u'Size / 8,  -- Bits to bytes
    optional_str => " Unsigned_32"
  );

  --debug_print.print_bytes_in_four(
  --  in_ptr       => an_int'Address,
  --  byte_count   => an_int'Size / 8,  -- Bits to bytes
  --  optional_str => " Unsigned_Integer"
  --);

end test_debug;

