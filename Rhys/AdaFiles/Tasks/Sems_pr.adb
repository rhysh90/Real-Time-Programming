-- Semaphore package : protected types version
-- Author: Rob Allen, Swinburne University of Technology
-- Last modified: 18-Aug-99
package body Sems_Pr is

   protected body Semaphore is

      entry Wait when N > 0 is
      begin
         N := N - 1;
      end Wait ;

      procedure Signal is
      begin
         N := N + 1;
      end Signal;

   end Semaphore;

   protected body Lock is

      entry Acquire when not Busy is
      begin
         Busy := True;
      end Acquire;

      procedure Release is
      begin
         Busy := False;
      end Release;

   end Lock;

end Sems_Pr;