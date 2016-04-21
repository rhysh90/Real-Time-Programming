package body Strfns is
-- string functions
  
  procedure Copy(S1 : in out String;
		 S2 : in String) is
  -- copy S2 into S1
  -- if S2 is shorter, pad with blanks
  -- id S2 is longer, truncate
    L1, L2, L : Integer;

  begin
    for I in S1'range loop 
      S1(I) :=  ' ';
    end loop;
    L1 := S1'Length;
    L2 := S2'Length;
    if L2 > L1 then
      L := L1;
    else
      L := L2;
    end if;
    S1(S1'First .. S1'First + L - 1) := S2(S2'First .. S2'First + L - 1);
  end Copy;
end Strfns;
