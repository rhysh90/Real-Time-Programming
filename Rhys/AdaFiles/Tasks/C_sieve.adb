-- concurrent Sieve of Erosthenes program to find primes
with Swindows;

procedure C_Sieve is
  task type Filter is
   ------ you fill in
  end Filter;

  type A_Filter is access Filter;

  -- This function is needed because "new Filter" cannot exist within Filter
  -- because the identifier "Filter" is interpreted as "the current object"
  -- there.
  function New_Filter return A_Filter is
  begin
    return new Filter;
  end;

--  task body Filter is separate;
task body Filter is
  My_Pos : NATURAL;
  N, My_Prime : NATURAL;
  W : Swindows.Window;
  Next: A_Filter;
begin
  accept Init(Pos, Num : NATURAL) do
     My_Pos := Pos;
     My_Prime := Num;
  end Init;
  Swindows.Open(W, (My_Pos/13)*5, (My_Pos mod 13)*6,
	       (My_Pos/13)*5 + 4, (My_Pos mod 13)*6 + 5,
	       Integer'image(My_Prime));
  loop
    accept Input(Num : NATURAL) do
      N := Num;
    end;
    Windows.Put_Line(W, Integer'image(N), 2);
    delay 0.2;                    -- to slow it all down
    if N mod My_Prime /= 0 then
	-- its not a multiple.
	-- if there is a successor filter then pass on N
	-- else create one to handle N
	----- you fill in
    end if;
    Windows.Clear(W);
  end loop;
end Filter;

task Generator ;
task body Generator is
    First : A_Filter := new Filter;
    N : NATURAL := 2;
begin
    First.Init(0, 2);
    for N in 2 .. 300 loop
      First.Input(N);
    end loop;
end Generator;

begin
  -- the tasks are running already
  null;
end C_Sieve;