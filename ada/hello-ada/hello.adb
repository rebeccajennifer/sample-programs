------------------------------------------------------------------------
-- DESCRIPTION
-- Sample 'Hello World' program in ada.
--
-- USAGE
-- To compile, use the following command:
--
-- gnatmake hello-ada.adb
------------------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;

procedure Hello is

begin

   Put_Line("Hello, Ada!");

end Hello;
