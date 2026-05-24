------------------------------------------------------------------------
-- Print debug header
------------------------------------------------------------------------

with Ada.Text_IO;              use Ada.Text_IO;
with Ada.Integer_Text_IO;      use Ada.Integer_Text_IO;
with Interfaces;               use Interfaces;
with System;
with System.Storage_Elements;  use System.Storage_Elements;
with System.Address_To_Access_Conversions;

package debug_print is
   procedure Print_Bytes_In_Four (
      In_Ptr       : System.Address;
      Byte_Count   : Natural;
      Optional_Str : String := ""
   );

end debug_print;

