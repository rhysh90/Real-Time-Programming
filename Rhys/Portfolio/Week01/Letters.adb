-- Letters.adb
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io;
with Ada.Float_Text_Io;
procedure Letters is

package Int_Io renames Ada.Integer_Text_Io;

answer : Character;

begin

answer := 'y';

while answer = 'y' loop
	
   for letter in Character range 'A' .. 'K' loop

      Put_Line(letter'Img);

   end loop;	
	
	Put_Line("Again? y for yes, anything else for no");
	Get(answer); Skip_Line;
	   
   end loop;

end Letters;