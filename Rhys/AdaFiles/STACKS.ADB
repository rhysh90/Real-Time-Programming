package body Stacks is


  function Is_Empty(S : Integer_Stack_Type) return Boolean is
  -- return True iff S is empty
  begin
    return (S.Size = 0);
  end Is_Empty;

  function Is_Full(S : Integer_Stack_Type) return Boolean is
  -- return True iff S is full
  begin
    return (S.Size = Max);
  end Is_Full;

  procedure Pop(S : in out Integer_Stack_Type) is
  -- remove top item from S
  -- Pre : S is not empty
  begin
    S.Size := S.Size - 1;
  end Pop;

  procedure Push(S : in out Integer_Stack_Type; Z : in Integer) is
  -- item Z goes onto top of stack
  -- pre : S is not full
  begin
    S.Size := S.Size + 1;
    S.Items(S.Size) := Z;
  end Push;

  function Top(S : Integer_Stack_Type) return Integer is
  -- returns the top item of S
  -- Pre : S is non-empty
  begin
    return (S.Items(S.Size));
  end Top;

end Stacks;
