-- DaysB.adb
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io;
with Ada.Float_Text_Io;
procedure DaysB is

package Int_Io renames Ada.Integer_Text_Io;

answer : Character;

type Day_Type is (Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday);


begin

answer := 'y';

while answer = 'y' loop
	
   for day in Day_Type range Monday .. Friday loop

      Put_Line(day'Img);
	  
   end loop;	
	
	Put_Line("Again? y for yes, anything else for no");
	Get(answer); Skip_Line;
	   
   end loop;

end DaysB;