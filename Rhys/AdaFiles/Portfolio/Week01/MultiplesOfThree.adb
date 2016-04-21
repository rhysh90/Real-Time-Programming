-- MultiplesOfThree.adb
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io;
procedure MultiplesOfThree is

package Int_Io renames Ada.Integer_Text_Io;

answer : Character;
count : Integer;

begin

answer := 'y';
count := 1;

while answer = 'y' loop
   Put_Line("The multiples of 3 from 1 to 100 are;");

   while count <= 100 loop
	   if count rem 3 = 0
		then
			Int_Io.Put(count);
			New_Line(1);
	   end if;
		  
	   count := count + 1;
	   
	   end loop;
	   
	Put_Line("Again? y for yes, anything else for no");
	Get(answer); Skip_Line;
	   
   end loop;
   
end MultiplesOfThree;