package Stacks is

  type Integer_Stack_Type is private;

  function Is_Empty(S : Integer_Stack_Type) return Boolean;
  -- return True iff S is empty

  function Is_Full(S : Integer_Stack_Type) return Boolean;
  -- return True iff S is full

  procedure Pop(S : in out Integer_Stack_Type);
  -- remove top item from S
  -- Pre : S is not empty

  procedure Push(S : in out Integer_Stack_Type; Z : in Integer);
  -- item Z goes onto top of stack
  -- pre : S is not full

  function Top(S : Integer_Stack_Type) return Integer;
  -- returns the top item of S
  -- Pre : S is non-empty

private
  Max : constant Integer := 100;
  type Integer_Array_Type is array(1..Max) of Integer;
  type Integer_Stack_Type is
    record
      Size : Integer range 0 .. Max := 0;
      Items : Integer_Array_Type;
    end record;

end Stacks;
