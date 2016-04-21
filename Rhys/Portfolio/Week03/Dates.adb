-- dates.adb
--
-- A program to read dates from the keyboard in the form
--    day_no  month_no        e.g. 30 8
-- and output the next day's date in the form
--    day_no  month           e.g. 31 AUG
-- Assume it is not a leap year.
-- The program loops until a zero day number is entered.
--
-- version 2.0 8-Mar-07

with Ada.Text_Io, Ada.Integer_Text_Io;
procedure Dates is 

   package Int_Io renames Ada.Integer_Text_Io;
   use Ada.Text_Io;

   type Month_Type is (Jan, Feb, Mar, Apr, May, Jun, Jul, Aug, Sep, Oct, Nov, Dec);

   subtype Day_Num_Type is Integer range 1 .. 31;

   type Date_Type is
   record
       Month : Month_Type;
	   Day_No : Day_Num_Type;
   end record;
	
   Days_In : constant array (Month_Type range Jan .. Dec) of Integer :=
   (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
         
   Today, Next_Day : Date_Type;
      
   Temp : Integer;
   TempMonth : String(1 .. 3);
   
   Year_No : Integer;
   
   function DaysIn (M : Month_Type) return Integer is
   
   begin
		case M is
		   when Jan | Mar | May | Jul | Aug | Oct | Dec =>

			  return 31;

		   when Apr | Jun | Sep | Nov =>

			  return 30;

		   when Feb =>
				if Year_No rem 4 = 0
				then
					return 29;
				else
					return 28;
				end if;

		   when others =>

			  return 0;

		end case;
   
   end DaysIn;

   -- calculate the day after D
   function Tomorrow (D : Date_Type) return Date_Type is 
   
   Date : Date_Type;
   
   begin 
	if D.Day_No = DaysIn(D.Month) --Use Days_In for the constant array, Use DayIn for case statement
	  then
		Date.Day_No := 1;
		if D.Month = Dec
		then
			Date.Month := Jan;
		else
			Date.Month := Month_Type'succ(D.Month);
		end if;
	else
		Date.Day_No := D.Day_No + 1;
		Date.Month := D.Month;
		
	end if;
	
	return Date;
	  
   end Tomorrow;

   -- display D
   procedure Print (D : in Date_Type) is 
   begin
      Put_Line("Tomorrow is " & D.Day_No'Img & " " & D.Month'Img);-- your code here
   end Print;

begin
	
	Put_Line("Enter the year: ");
	Int_Io.Get(Year_No);
	
	loop
   
	  Put_Line("Enter date as dd mm (0 0 to stop): ");
	  Int_Io.Get(Temp);   -- read day 
	  Skip_Line;
	  exit when Temp = 0;
	  Today.Day_No := Temp;
	  
	  Get_Line(TempMonth, Temp);   -- read month as an integer
	  Skip_Line;

		Today.Month := Month_Type'Value(TempMonth(1 .. Temp)); -- ..... your code (convert to symbolic name) 

		  if Today.day_no <= DaysIn(Today.Month)
		  then
			Next_Day := Tomorrow(Today);--  compute tomorrow's date

			Print(Next_Day);--  print
		  else
			Put_Line("Date doesn't exist");
		  end if;

	end loop;
	exception
		when Constraint_Error =>
		Put_Line("Not a real date");
		
end Dates;

