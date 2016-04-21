-- SwapTest.adb
-- Swaps the contents of two given intergers
with Ada.Text_Io, Ada.Integer_Text_Io;
use  Ada.Text_Io, Ada.Integer_Text_Io;

procedure SwapTest is

procedure Swap(A,B : in out Integer) is

Temp : Integer;

begin
	Temp := A;
	A := B;
	B := Temp;
	
end Swap;

A : Integer;
B : Integer;
                            
begin
   loop
      Put_Line("enter A:");
      Get(A);
	  
	  Put_Line("enter B:");
      Get(B);
	  
	  Put_Line("Before the swap");
	  Put_Line(A'Img & " is the value of A");
	  Put_Line(B'Img & " is the value of B");

	  Swap(A, B);
	  
	  Put_Line("After the swap");
	  Put_Line(A'Img & " is the value of A");
	  Put_Line(B'Img & " is the value of B");
	  
   end loop;

end SwapTest;