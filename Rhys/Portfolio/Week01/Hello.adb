-- Hello.adb
with Ada.Text_Io; use Ada.Text_Io;
with Ada.Integer_Text_Io;
procedure Hello is

package Int_Io renames Ada.Integer_Text_Io;

answer : Character;

begin
answer := 'y';
while answer = 'y' loop
   
   Put_Line("Hello");
   Put_Line("Again? y for yes, anything else for no");
   Get(answer); Skip_Line;
   end loop;
   
end Hello;