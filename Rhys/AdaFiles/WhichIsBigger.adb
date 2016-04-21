-- WhichIsBigger.adb
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io;
with Ada.Float_Text_Io;
procedure WhichIsBigger is

package Int_Io renames Ada.Integer_Text_Io;

answer : Character;
A : float;
B : float;
Bigger : float;

function BiggerFloat (A, B : float) return float is

	begin
	if A = B
		then
			Put_Line("Both numbers are the same");
			return A;
		else
			if A > B
				then
				return A;
			else
				return B;
			end if;
	   end if;

end BiggerFloat;

begin

answer := 'y';

while answer = 'y' loop
   Put_Line("Input the value of A");
   Ada.Float_Text_Io.Get(A);
   Skip_Line;
   Put_Line("Input the value of B");
   Ada.Float_Text_Io.Get(B);
   Skip_Line;

	bigger := BiggerFloat(A,B);
	Put_Line(float'image(bigger) & " is the bigger float");
	   
	Put_Line("Again? y for yes, anything else for no");
	Get(answer); Skip_Line;
	   
   end loop;

end WhichIsBigger;