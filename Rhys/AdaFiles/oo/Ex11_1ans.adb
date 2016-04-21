-- Ex11_1 Answer
-- ..... 
with Instr.Child; use Instr.Child;
with Ada.Text_Io; use Ada.Text_Io;  --* replaced Gnat.Io
--with Gen_List;
procedure Ex11_1ans is
   use Instr;
   type Acc is access all Instrument'Class;
   --* all added

   package Int_Io is new Integer_Io(Integer);  --* added

   --* package Dash_Board deleted,
   --* added:
   type List is array (Integer range <>) of Acc;

   procedure Print_Dash_Board (L : List) is
   --* body changed
   begin
      for I in L'range loop
         Display_Value (L(I).all);
      end loop;
      New_Line;
   end Print_Dash_Board;

   DB : List(1..7);
   Inc, Sec : Integer;

   --* added:
   Acc_Clock : aliased Accurate_Clock;

begin
   --* all use of DB changed...
   DB := (new Speedometer,            -- 1
          new Gauge,                  -- 2
          new Graphic_Gauge,          -- 3
          new Graphic_Gauge,          -- 4
          new Clock,                  -- 5
          new Chronometer,            -- 6
          Acc_Clock'access );         -- 7

   Set_Name (DB(1).all, "Speed");
   Set_Name (DB(2).all, "Fuel");
   Set_Name (DB(3).all, "Water");
   Set_Name (DB(4).all, "Oil");
   Set_Name (DB(5).all, "Time in NY");
   Set_Name (DB(6).all, "Chrono");
   Set_Name (DB(7).all, "Time in Paris");

   Speedometer   (DB(1).all).Value := 45; --  mph
   Gauge         (DB(2).all).Value := 60; --  %   
   Graphic_Gauge (DB(3).all).Value := 80; --  %
   Graphic_Gauge (DB(4).all).Value := 40; --  %   

   Init (Clock          (DB(5).all), 12, 15,  0);
   Init (Chronometer    (DB(6).all),  0,  0,  0);
   Init (Accurate_Clock (DB(7).all),  6, 15,  0);
   -- or
   -- Init(Acc_Clock, 6, 15, 0);

   loop
      Print_Dash_board (DB);

      if Graphic_Gauge (DB(3).all).Value < 60 then
         Put_Line ("There is a leak in the radiator.");
      end if;
      if Speedometer (DB(1).all).Value> 50 then
         Put_Line (" Speed limit is 50 ... ");
      end if;

      if Clock (DB(5).all).Seconds
           /= Accurate_Clock (DB(7).all).Seconds
      then
         Put_Line (" Your first clock is not very accurate ");
      end if;

      Put ("Give a time increment in milliseconds (0 to terminate) :");
      Int_Io.Get (Inc);  --* Int_Io. added
      exit when Inc <= 0;
      Sec := Inc / 1000;
      Increment (Clock          (DB(5).all), Sec);
      Increment (Chronometer    (DB(6).all), Sec);
      Increment (Accurate_Clock (DB(7).all), Inc);

      Gauge (DB(2).all).Value :=
        Integer (Float (Gauge (DB(2).all).Value)
                  * (1.0 - Float (Sec) / 3600.0));

      Graphic_Gauge (DB(3).all).Value :=
        Integer (Float (Graphic_Gauge (DB(3).all).Value)
                   * (1.0 - Float (Sec) / 600.0));

      Speedometer (DB(1).all).Value :=
        Speedometer (DB(1).all).Value + 2;
   end loop;
exception
   when Others => Put_Line ("I think that's enough for today... Bye");
end Ex11_1ans;