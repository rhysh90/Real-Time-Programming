-- Computer-Printer Simulation : Ada95 task types version
-- Author: Rob Allen, Swinburne University of Technology
-- Last modified: 18-Aug-99
--
with Ada.Text_Io;
with Sems_Pr;   -- or Sems_Tas (can be mixed)
procedure Comprint is
   use Ada.Text_Io;
   use Sems_Pr;

   task Printer;

   task Buffer is
      entry Add(C : in Character);    -- place character C in buffer
      entry Remove(C : out Character);   -- receive character C from buffer,  & remove from buffer
   end Buffer;

   task type Computer is
      entry Init(First, Last : Character);
   end Computer;

   Computer1,
   Computer2 : Computer;
   
   Terminator : constant Character := Ascii.Eot;  -- for example
   The_Lock : Lock;

   --   task body Computer1 is
   --   begin
   --      The_Lock.Acquire;  -- acquire exclusive Add access to buffer
   --      for C in Character range '0'..'9' loop  -- send the data
   --         Buffer.Add(C);
   --      end loop;
   --      Buffer.Add(Terminator);  -- send end of "file" indicator for printer action 
   --      The_Lock.Release;  -- release access to buffer
   --   end Computer1;

   task body Computer is
      Char1, Char2 : Character;
   begin
      accept Init(First, Last : Character) do
         Char1 := First;
         Char2 := Last;
      end Init;
--      The_Lock.Acquire;
      for C in Char1..Char2 loop
         Buffer.Add(C);
      end loop;
      Buffer.Add(Terminator);
--      The_Lock.Release;
   end Computer;

   task body Printer is
      C : Character;
   begin
      loop
         Buffer.Remove(C);
         if C = Terminator then
            Put_Line("---");
         else
            Put(C);  New_Line;
         end if;
      end loop;
      New_Line;
   end Printer;

   task body Buffer is
      -- decs of local vars goes here: Count, N, A, I, J ; 
      -- implementation uses a circular queue stored in A(1..N)
      N : constant := 5;  --100;
      A : array (1 .. N) of Character;
      I : Integer := 1;
      J : Integer := 1;
      Count : Integer := 0;
   begin
      delay 1.0;
      loop
         select
            when Count < N =>
            accept Add(C : in Character) do
               A(I) := C;
            end Add;
            I := I mod N + 1; Count := Count +1;
         or 	when Count > 0  =>
            accept Remove(C : out Character) do
               C := A(J);
            end Remove;
            J := J mod N + 1; Count := Count - 1;
         or
            terminate;
         end select;
      end loop;
   end Buffer;

begin
   Computer1.Init('a', 'k');
   Computer2.Init('0', '9');
end Comprint;