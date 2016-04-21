with Ada.Text_Io;
procedure Stacks5 is
-- test of data type stack

  type Real_Type is  digits 9;
  package Real_Io is new Ada.Text_Io.Float_Io(Real_Type);
  use Ada.Text_Io;

------------------------------------------
-- type Complex_Type
------------------------------------------


  type Complex_Type is
    record
      Real_Part : Real_Type;
      Imag_Part : Real_Type;
    end record;

------------------------------------------
-- type Complex_Stack_Type
------------------------------------------

  Max : constant Integer := 100;
  type Complex_Array_Type is array(1..Max) of Complex_Type;
  type Complex_Stack_Type is
    record
      Size : Integer range 0 .. Max := 0;
      Items : Complex_Array_Type;
    end record;

----------------------------------------
-- operations on type Complex_Type
----------------------------------------

  procedure Get(C : out Complex_Type) is
  -- get C from user
  begin
    Put("Real Part : "); Real_Io.Get(C.Real_Part); Text_Io.Skip_Line;
    Put("Imag Part : "); Real_Io.Get(C.Imag_Part); Text_Io.Skip_Line;
  end Get;


  procedure Put(C : in Complex_Type) is
  -- writes C to screen
  begin
    Real_Io.Put(C.Real_Part,4,2,0);
    Put("  +  j");
    Real_Io.Put(C.Imag_Part,4,2,0);
  end Put;

  function "+"(Left, Right : in Complex_Type) return Complex_Type is
  -- returns Left + Right
  begin
  ----------------------------------
  ---  You provide the code here
  ----------------------------------
  end "+";

----------------------------------------
--  operations on type Complex_Stack_Type
----------------------------------------

  function Is_Empty(S : Complex_Stack_Type) return Boolean is
  -- return True iff S is empty
  begin
    return (S.Size = 0);
  end Is_Empty;

  function Is_Full(S : Complex_Stack_Type) return Boolean is
  -- return True iff S is full
  begin
  ----------------------------------
  ---  You provide the code here
  ----------------------------------
  end Is_Full;

  procedure Pop(S : in out Complex_Stack_Type) is
  -- remove top item from S
  -- Pre : S is not empty
  begin
    S.Size := S.Size - 1;
  end Pop;

  procedure Push(S : in out Complex_Stack_Type; C : in Complex_Type) is
  -- item C goes onto top of stack
  -- pre : S is not full
  begin
  -----------------------------------
  -- you provide the code here
  ----------------------------------- 
  end Push;

  function Top(S : Complex_Stack_Type) return Complex_Type is
  -- returns the top item of S
  -- Pre : S is non-empty
  begin
    return (S.Items(S.Size));
  end Top;

begin -- Stacks5
--------------------------------------------------------------------
-- implement the following algorithm in Ada
-- you will  need to declare variables BEFORE the subprograms above
--
--      Get C
--      Push(S,C)
--      Get(C)
--      Push(S,C)
--      C1 := Top(S)
--      Pop(S)
--      C2 :=  Top(S)
--      Pop(S)
--      C3 := C1 + C2
--      Put(C3)
--------------------------------------------------------------------
  New_Line;
end Stacks5;