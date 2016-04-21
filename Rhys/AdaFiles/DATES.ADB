-- dates.adb
--
-- A program to read dates from the keyboard in the form
--    day_no  month_no        e.g. 30 8
-- and output the next day's date in the form
--    day_no  month           e.g. 31 AUG
-- Assume it is not a leap year.
-- The program loops until a zero day number is entered.
--

with Ada.Text_Io;
procedure Dates is

  
  package Int_Io is new Ada.Text_Io.Integer_Io(Integer);
  use Ada.Text_Io;
-------------------------------------------------------------------
-- your declarations here
-------------------------------------------------------------------
  function Tomorrow(D : Date_Type) return Date_Type is
  -- calculates the day after D
-------------------------------------------------------------------
-- your code here
-------------------------------------------------------------------
  end Tomorrow;

begin
  loop
    Put("Enter date as dd mm (0 0 to stop):");
    Int_Io.Get(Temp);   -- read day 
    Skip_Line;
    Today.Day_No := Temp;
    Int_Io.Get(Temp);   -- read month as an integer
    Skip_Line;
-------------------------------------------------------------------
    Today.Month :=  -- ..... your code (convert  to symbolic name)
-------------------------------------------------------------------
-------------------------------------------------------------------
--  compute tomorrow's date & print
-------------------------------------------------------------------
  end loop;
end Dates;

