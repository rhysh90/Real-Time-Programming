-- Skeleton code for HIT3047 Lab 2 ex1 
-- Rob Allen 2007-03-08
--
with Ada.Text_Io, Ada.Integer_Text_Io;
use  Ada.Text_Io, Ada.Integer_Text_Io;

procedure Maxim is

procedure Min_Max(A,B : in Integer; C,D : out Integer) is

begin
	if A >= B
		then
		C := A;
		D := B;
	
	else
		C := B;
		D := A;
	end if;
	
end Min_Max;

A : Integer;
B : Integer;
C : Integer;
D : Integer;
                            
begin
   loop
      Put_Line("enter num1:");
      Get(A);
	  
	  Put_Line("enter num2:");
      Get(B);
      -- etc
	  Min_Max(A, B, C, D);
	  
	  Put_Line(C'Img & " is the maximum");
	  Put_Line(D'Img & " is the minimum");
	  
   end loop;

end Maxim;