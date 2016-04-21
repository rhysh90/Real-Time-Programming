-- simple windows package for PC (implementation uses GNAT conio)
-- supports non-overlapping windows in text mode, string output
-- and Get_Line string input only.  Does not use Text_IO.
-- R K Allen, Swinburne, 22-Sep-92
-- Modified so that Window is no longer limited private 7-May-93
-- Renamed and converted to GNAT/DJGPP conio.  R K Allen  8-Aug-99
-- Converted to GNAT/AdaGraph.  R K Allen  24-Aug-99
--
--with AdaGraph;
--use  AdaGraph;

package swindows is

  type Window is private;
  type Color is (Black, Blue, Green, Cyan, Red, Magenta, Brown,
                       Light_Gray, Dark_Gray, Light_Blue, Light_Green,
                       Light_Cyan, Light_Red, Light_Magenta, Yellow, White);
  subtype Background_Color is Color range Black..Light_Gray;
  subtype Row_Range is Integer range 0..24;
  subtype Column_Range is Integer range 0..79;

  procedure Open(The_Window : in out Window;
		 Top_Left_Row  : in Row_Range;
		 Top_Left_Col  : in Column_Range;
		 Bot_Right_Row : in Row_Range;
		 Bot_Right_Col : in Column_Range;
		 Heading       : in String;
		 Foreground    : in Color := White;
		 Background    : in Background_Color := Black);
  -- clears, frames and heads a window, returning its ID
  -- if heading'length > width of window then Heading is truncated.

  procedure Clear(The_Window : in Window);
  -- fill the window with its background

  procedure Put_Line(The_Window : in Window;
		     Text   : in String;
		     On_Row : in Row_Range := 0;
		     Foreground : in Color := White;
		     Background : in Color := Dark_Gray);
  -- outputs Text to window The_Window at row On_Row.  Rows count from 1
  -- within the frame; if zero then the text is appended to the
  -- lines within the window.  If Text is too long it is truncated; if
  -- short then the row is blank filled.
  -- If On_Row is out of range then Put_Line does nothing.
  -- The effective default attributes are those of the window.

  procedure Scroll_Up(The_Window : in Window);
  -- scrolls the contents of the window up one line

  procedure Scroll_Down(The_Window : in Window);
  -- scrolls the contents of the window down one line

  procedure Get_Line(The_Window : in Window;
		     Text : out String; Last : out Natural);
  -- effectively does a Text_IO.Get_Line with the cursor starting
  -- at the first unused line in window Win.  The input is
  -- limited to the internal width of the window - 1.

private
  type Window_Struct;
  type Window is access Window_Struct;
end swindows;