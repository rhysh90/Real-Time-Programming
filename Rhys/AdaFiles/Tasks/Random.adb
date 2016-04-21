   -------------------------------------------------------------------------
--|
--|  R A N D O M     N U M B E R    G E N E R A T O R
--|
--|  Abstract : This file contains the specification and implementation of
--|     a random number generator.  The code for function Random1 appears
--|	in Stubbs & Webre "Data Structures with Abstract Data Types and Ada",
--|	PWS Kent (1993).  The algorithm is by Park and Miller, pp 1192-1201
--|	Comm ACM (Oct 1988).
--|
--|         Type               Name               File
--|         ----               ----               ----
--|     Specification          Random             This file
--|     Implementation         Random             This file
   ---------------------------------------------------------------------------
--|  Date 20/5/94	implemented in Meridian Ada
--|  Date 23/3/95	changed Random_Int and tidied by Rob Allen

package Random is

  procedure Set_Seed ( Seed : in LONG_INTEGER);

  -- Procedure sets SEED value for random generator no. 1
  -- Pre: Seed > 0

  function Random1 return LONG_INTEGER;

  -- Function generates random number using algorithm from S&W appendix C
  -- Post:  Returns pseudo-random positive number of type LONG_INTEGER


  function Random_Int ( limit: INTEGER ) return INTEGER;

  -- Function generates random number in the range 0 to limit - 1
  -- using algorithm from S&W appendix C
  -- Pre :  -
  -- Post:  Returns pseudo-random number in range 0 to limit-1

end Random;

package body Random is

  a  : constant LONG_INTEGER := 16_807;
  m  : constant LONG_INTEGER := 2_147_483_647;
  q  : constant LONG_INTEGER := 127_773;
  r  : constant LONG_INTEGER := 2_836;

  Random1_Number : LONG_INTEGER := 72954;


  procedure Set_Seed ( Seed : in LONG_INTEGER) is
  --
  -- Procedure sets SEED value for random generators
  -- Pre: Seed > 0
  begin
    Random1_Number := seed;
  end Set_Seed;


  function Random1 return LONG_INTEGER is
  --
  -- Function generates random number using algorithm from S&W appendix C
  -- Post:  Returns pseudo-random positive number type LONG_INTEGER

  Result : LONG_INTEGER;

  begin
    Random1_Number := a*(Random1_Number mod q) - r*(Random1_number/q);
    if Random1_Number > 0 then
      Result := Random1_Number;
    else
      Result := Random1_Number + m;
    end if;
    return Result;
  end Random1;


  function Random_Int( limit: INTEGER ) return INTEGER is

  -- Function generates random number in the range 0 to limit - 1
  -- using algorithm from S&W appendix C
  -- Pre :  -
  -- Post:  Returns pseudo-random number in range 0 to limit-1

  begin
    return INTEGER(Random1 mod LONG_INTEGER(limit));
  end Random_Int;

end Random;
