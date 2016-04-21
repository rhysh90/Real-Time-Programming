-- Computer-Printer Simulation : protected types version
-- (Buffer a little different from the lecture slides)
-- Author: Rob Allen, Swinburne University of Technology
-- Last modified: 18-Aug-99
--
with Ada.Text_Io;
with Sems_Pr;   -- or Sems_Tas (can be mixed)
procedure Comprpro is
   use Ada.Text_Io;
   use Sems_Pr;

   task Printer;

   protected type Pr_Buffer (N : Integer := 100) is
      entry Add(C : in Character);
      entry Remove(C : out Character);
   private
      --N : constant := 100;  -- constant not allowed here
      A : String(1 .. N);  -- anonymous arrays not allowed here
      I : Integer := 1;
      J : Integer := 1;
      Count : Integer := 0;
   end Pr_Buffer;

   task type Computer is
      entry Init(First, Last : Character);
   end Computer;

   Computer1 : Computer;
   Computer2 : Computer;
      Buffer : Pr_Buffer(10);

   Terminator : constant Character := Ascii.Eot;  -- for example
   The_Lock : Lock;

   task body Computer is
      Char1, Char2 : Character;
   begin
      accept Init(First, Last : Character) do
         Char1 := First;
         Char2 := Last;
      end Init;
      delay 0.2;
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

   protected body Pr_Buffer is

      entry Add(C : in Character) when Count < N  is
      begin
         A(I) := C;
         I := I mod N + 1; Count := Count +1;
      end Add;

      entry Remove(C : out Character) when Count > 0  is
      begin
         C := A(J);
         J := J mod N + 1; Count := Count -1;
      end Remove;

   end Pr_Buffer;

begin
   Computer1.Init('a', 'k');
   Computer2.Init('0', '9');
end Comprpro;