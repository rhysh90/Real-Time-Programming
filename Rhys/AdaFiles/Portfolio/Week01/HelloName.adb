-- HelloName.adb
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io;
procedure HelloName is

package Int_Io renames Ada.Integer_Text_Io;

answer : Character;
name : String(1..20);
Last : Integer;

begin
answer := 'y';
while answer = 'y' loop
   
   Put_Line("What is your name?");
   Get_Line(name, Last);
   
   Put_Line("Hello " & name(1..last));
   Put_Line("Again? y for yes, anything else for no");
   Get(answer); Skip_Line;
   end loop;
   
end HelloName;