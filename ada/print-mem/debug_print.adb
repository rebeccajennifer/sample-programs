------------------------------------------------------------------------
-- Ada print debug functions
------------------------------------------------------------------------
with Ada.Text_iO;              use Ada.Text_iO;
with Ada.integer_Text_iO;      use Ada.integer_Text_iO;
with interfaces;               use interfaces;
with System;
with System.Storage_Elements;  use System.Storage_Elements;
with System.Address_To_Access_Conversions;


------------------------------------------------------------------------
package body debug_print is 

  ----------------------------------------------------------------------
  -- Prints memory contents of structure. 
  --
  -- Parameters:
  --  in_ptr        : Address of structure to print
  --  byte_count    : Number of bytes for data structure to print
  --  optional_str  : Optional string to print
  --
  --  Returns:
  --    None
  ----------------------------------------------------------------------
  procedure Print_Bytes_in_Four (
    in_ptr       : System.Address;
    byte_count   : Natural;
    optional_str : String := ""
  ) is

    -- Access type to view bytes
    type Byte_Array_Constrained is
      array (0 .. byte_count - 1) of Unsigned_8;
    
    package Conv_Constrained is
      new System.Address_To_Access_Conversions (Byte_Array_Constrained);
    
    bytes : Conv_Constrained.Object_Pointer :=
      Conv_Constrained.To_Pointer (in_ptr);
    
    ------------------------------------------------------------------
    -- Returns hex string
    function To_Hex (Val : Unsigned_8) return String is
       hex_digits : constant String := "0123456789ABCDEF";
    begin
       return hex_digits (integer (Val / 16) + 1) &
              hex_digits (integer (Val mod 16) + 1);
    end To_Hex;
    ------------------------------------------------------------------

  begin

    New_Line;
    New_Line;
    Put (       " Size of input in bytes: ");
    Put (byte_count, Width => 0);
    New_Line;
    Put_Line (optional_str);

    New_Line;
    Put_Line (  "______________________________");
    Put_Line (  "     Offset:   +0  +1  +2  +3 ");
    Put_Line (  "______________________________");
    
    for i in 0 .. byte_count - 1 loop

      ----------------------------------------------------------------
      -- Print new line and address every 4 bytes
      ----------------------------------------------------------------
      if i mod 4 = 0 then

        declare

          addr_int : constant Unsigned_64 :=
                Unsigned_64 (To_integer(bytes.all'Address + Storage_Offset(i))); 

        begin
          New_Line;
          Put (" 0x" &
          To_Hex (Unsigned_8 (addr_int / 16#1000000# mod 256)) &
          To_Hex (Unsigned_8 (addr_int / 16#10000#   mod 256)) &
          To_Hex (Unsigned_8 (addr_int / 16#100#     mod 256)) &
          To_Hex (Unsigned_8 (addr_int               mod 256)) & ": ");
        end;

      end if;
      ----------------------------------------------------------------
      
      -- Print byte from memory
      Put ("  " & To_Hex(bytes.all(i)));

    end loop;

    New_Line;
    Put_Line (  "______________________________");

  end Print_Bytes_in_Four;
end debug_print;

