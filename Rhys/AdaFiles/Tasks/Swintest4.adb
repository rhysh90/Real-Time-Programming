-- test SWindows package
-- version 3.0 for GNAT/Win32 Adagraph implementation:
--    package namesand row/col numbers changed
-- Rob Allen, Swinburne UT, 24-Aug-99
with Ada.Text_Io, Swindows;
use  Ada.Text_Io, Swindows;
procedure Swintest4 is

   Win1, Win2 : Swindows.Window;
   S : String(1..80);
   L : Natural;



begin -- main
   Open(Win1, 1,0, 18,30, "Left window (T1)", Background=>Blue);
   Open(Win2, 0,31,18,79, "Right window (T2)",
      Background=>Black, Foreground=>White);
   Put("Press enter to continue...");
   Skip_Line;
   Put_Line(Win1,"At 1 line every 0.1 sec, this");
   Put_Line(Win1,"window should fill with ");
   Put_Line(Win1,"numbers, one per line");
   for I in 4..16 loop
      Put_Line(Win1,Integer'Image(I));  -- appends
      delay 0.1;
   end loop;
   Put_Line(Win1, "this should be line 10 in left Win", 10);
   Put_Line(Win1, "line twenty-one?");
   Put_Line(Win1, "line five green?", 5,Background=>Green);

   Put_Line("Press Enter for Scroll up");
   Skip_Line;
   Scroll_Up(Win1);
   
   Put_Line("Press Enter for append");
   Skip_Line;
   Put_Line(Win1,"bottom line??", Foreground=>Red, Background=>Light_Gray);

   Put_Line("Press Enter for Scroll down");
   Skip_Line;
   Scroll_Down(Win1);
   
   Put_Line("Press Enter for Clear");
   Skip_Line;
   Clear(Win1);
   
   Put_Line("Press Enter for new top line");
   Skip_Line;
   Put_Line(Win1, "top red text??", 0, Red);

   Put_Line("Press Enter for Get_line test");
   Skip_Line;
   Put_Line(Win2, "Enter text below (quit to stop)");
   loop
     Get_Line(Win2, S, L);
     Put_Line("Saw '" & S(1..L) & "'");
     exit when S(1..4) = "quit";
   end loop;
   New_Line;
   
   Put_Line("Press Enter to stop");
   Skip_Line;
   
end Swintest4;