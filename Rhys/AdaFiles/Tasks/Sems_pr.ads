-- Semaphore package : protected types version
-- Author: Rob Allen, Swinburne University of Technology
-- Last modified: 18-Aug-99
package Sems_Pr is

   protected type Semaphore (Init : Natural := 1) is
      entry Wait;
      procedure  Signal;
   private
      N : Natural := Init;
   end Semaphore;

   protected type Lock is
      entry Acquire;
      procedure  Release;
   private
      Busy : Boolean := False;
   end Lock;

end Sems_Pr;