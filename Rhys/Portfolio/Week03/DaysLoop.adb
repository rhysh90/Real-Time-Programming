-- DaysLoop.adb
-- Displays all the members of Day_Num_Type
-- using an exit rather than for loop

with Ada.Text_Io, Ada.Integer_Text_Io;
procedure DaysLoop is 

	package Int_Io renames Ada.Integer_Text_Io;
	use Ada.Text_Io;

	type Day_Type is (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);
	day : Day_Type;
	
	begin
		
		Put_Line("The members of Day_Type are: ");
		day := Day_Type'First;
		loop
		
		Put_Line(Day_Type'Image(day));
		
		if day = Day_Type'Last
		then
			exit;
		end if;
			
		day := Day_Type'Succ(day);

		end loop;
			
end DaysLoop;

