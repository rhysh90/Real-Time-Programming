-- Intro to Ada : Exercise 4.2
-- This program illustrates for loops and a simple function

with Ada.Text_Io;  use Ada.Text_Io;
procedure Forloop is

-- this program prints out table of conversions from Celsius to Fahrenheit
-- for 0,1,2,..,20 degrees celsius

  type Real_Type is digits 9;
  package Real_Io is new Ada.Text_Io.Float_Io(Real_Type);

---------------------------------------
-- implement a function CtoF here
-- parameter is a Real_Type; returned value is a Real_Type
-- the input is temp in degrees celsius
-- the returned value is the corresponding temp in degrees fahrenheit
-- given by fahrenheit = 32 + 1.8 * Cesius
---------------------------------------


---------------------------------------
-- variable declarations here as needed
---------------------------------------

begin

---------------------------------------
-- code here
-- use a for loop to call CtoF many times
-- to produce the required table of conversions
---------------------------------------

end Forloop;