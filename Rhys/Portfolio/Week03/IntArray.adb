-- IntArray.adb
-- Displays all the members of Day_Num_Type
-- using an exit rather than for loop

with Ada.Text_Io, Ada.Integer_Text_Io;

procedure IntArray is 

	type Int_Array is array(Character range <>) of Integer;
	
	IntArray : Int_Array := 
	(1,72,8,30,9,4,72,92,9,3,6,4,9,2,765);
	
	function Max(Items : in Int_Array) return Integer is 
	
	MaxInt : Integer := 0;
	
	begin
		for I in Items'Range loop
			if Items(I) > MaxInt
			then 
				MaxInt := Items(I);
			end if;
			
		end loop;
	
		return MaxInt;
	
	end Max;
	
	begin
	
	Ada.Text_Io.Put_Line(Max(IntArray)'Img);		
			
end IntArray;

