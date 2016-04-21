-- IfStatement.adb
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io;
procedure IfStatement is

package Int_Io renames Ada.Integer_Text_Io;

answer : Character;
A : Integer;
B : Integer;
C : Integer;

begin
answer := 'y';
while answer = 'y' loop
   Put_Line("Input the value of A");
   Int_Io.Get(A); Skip_Line;
   Put_Line("Input the value of B");
   Int_Io.Get(B); Skip_Line;
   Put_Line("Input the value of C");
   Int_Io.Get(C); Skip_Line;
   
   if A = B and then A = C
	then
		Put_Line("All the same");
   else   
	if A /= B and then A /= C and then B /= C
		then
			Put_Line("All different");
	else
		Put_Line("Two the same");
	end if;
   end if;
      
   Put_Line("Again? y for yes, anything else for no");
   Get(answer); Skip_Line;
   end loop;
   
end IfStatement;