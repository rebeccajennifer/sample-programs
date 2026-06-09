//______________________________________________________________________
// DESCRIPTION
// Simple example used to test clang-format.
//______________________________________________________________________

class SomeClass {

private:
  int int_var_;

public:
  SomeClass(int some_int) {
    int_var_ = some_int;
    return;
  }

  int get_int_var() { return int_var_; }
};