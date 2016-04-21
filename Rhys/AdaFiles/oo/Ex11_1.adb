-- Ex11_1 Instruments demo2
-- A very simple simulation of car dashboard instruments. Demonstrates
-- simple type extension, dispatching, child package.
-- author: John Barnes
--
-- Notes for Swinburne Ada95 course:
-- This program needs files
--      Instr.ads, Instr.adb,
--      Instr-child.ads, Instr-chils.adb,
--      Gen_List.ads, Gen_List.adb.
-- The latter package confuses things a bit, so consider replacing it
-- with a simple array, viz declare type List as an unconstrained array
-- of accesses.
-- The main part of this exercise is to add code at the places marked
-- --*** for an instance of Accurate_Clock.
-- You can do this by analogy with the other instruments -- also try
-- declaring it as an ordinary variable, that is, not by using new.
--
-- Also get rid of Gnat.Io -- an old package from the GNAT project before
-- Text_Io had been completed.
--
--with Instr; use Instr;
with Instr.Child; use Instr.Child;
with Gnat.Io; use Gnat.Io;
with Gen_List;
procedure Ex11_1 is
   use Instr;
   type Acc is access Instrument'Class;

   package Dash_Board is new Gen_List (Acc);
   use Dash_Board;

   procedure Print_Dash_Board (L : List) is
      L1 : List := L;
   begin
      while L1 /= Nil loop
         Display_Value (Element (L1).all);
         L1 := Tail (L1);
      end loop;
      New_Line;
   end Print_Dash_Board;

   DB : List := Nil;
   Inc, Sec : Integer;

begin
   DB := Append   (new Speedometer,            -- 1
           Append (new Gauge,                  -- 2
           Append (new Graphic_Gauge,          -- 3
           Append (new Graphic_Gauge,          -- 4
           Append (new Clock,                  -- 5
           Append (new Chronometer))))));      -- 6
   --*** add accurate clock here

   Set_Name (Element (DB, 1).all, "Speed");
   Set_Name (Element (DB, 2).all, "Fuel");
   Set_Name (Element (DB, 3).all, "Water");
   Set_Name (Element (DB, 4).all, "Oil");
   Set_Name (Element (DB, 5).all, "Time in NY");
   Set_Name (Element (DB, 6).all, "Chrono");

   Speedometer   (Element (DB, 1).all).Value := 45; --  mph
   Gauge         (Element (DB, 2).all).Value := 60; --  %   
   Graphic_Gauge (Element (DB, 3).all).Value := 80; --  %
   Graphic_Gauge (Element (DB, 4).all).Value := 40; --  %   

   Init (Clock          (Element (DB, 5).all), 12, 15,  0);
   Init (Chronometer    (Element (DB, 6).all),  0,  0,  0);
   --*** initiallise Accurate_Clock to 06:15:00 here

   loop
      Print_Dash_board (DB);

      if Graphic_Gauge (Element (DB, 3).all).Value < 60 then
         Put_Line ("There is a leak in the radiator.");
      end if;
      if Speedometer (Element (DB, 1).all).Value> 50 then
         Put_Line (" Speed limit is 50 ... ");
      end if;

--      if Clock (Element (DB, 5).all).Seconds
--           /= --*** Accurate_Clock's time here
--      then
--         Put_Line (" Your first clock is not very accurate ");
--      end if;

      Put ("Give a time increment in milliseconds (0 to terminate) :");
      Get (Inc);
      exit when Inc <= 0;
      Sec := Inc / 1000;
      Increment (Clock          (Element (DB, 5).all), Sec);
      Increment (Chronometer    (Element (DB, 6).all), Sec);
      --*** increment Accurate_Clock by Inc here
      Gauge (Element (DB, 2).all).Value :=
        Integer (Float (Gauge (Element (DB, 2).all).Value)
                  * (1.0 - Float (Sec) / 3600.0));

      Graphic_Gauge (Element (DB, 3).all).Value :=
        Integer (Float (Graphic_Gauge (Element (DB, 3).all).Value)
                   * (1.0 - Float (Sec) / 600.0));

      Speedometer (Element (DB, 1).all).Value :=
        Speedometer (Element (DB, 1).all).Value + 2;
   end loop;
exception
   when others => Put_Line ("I think that's enough for today... Bye");
end Ex11_1;