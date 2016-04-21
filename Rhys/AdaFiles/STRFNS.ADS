package Strfns is
-- string functions
  procedure Copy(S1 : in out String;
		 S2 : in String);
  -- copy S2 into S1
  -- if S2 is shorter, pad with blanks
  -- id S2 is longer, truncate
end Strfns;
