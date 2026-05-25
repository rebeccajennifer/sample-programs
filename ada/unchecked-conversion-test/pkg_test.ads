with Interfaces; use Interfaces;

package pkg_test is

  function  convert(source: Unsigned_32) return Integer;
  function  convert(source: Long_Float)  return Float;
  procedure ada_print_arg(int_arg: integer);

end pkg_test;


