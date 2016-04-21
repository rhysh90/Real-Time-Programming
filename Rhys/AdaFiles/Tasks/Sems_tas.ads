-- Semaphore package : Ada95 task types version
-- Author: Rob Allen, Swinburne University of Technology
-- Last modified: 18-Aug-99
package Sems_Tas is

   task type Semaphore (Init : Natural := 1) is
      entry Wait;
      entry Signal;
   end Semaphore;

   task type Lock is
      entry Acquire;
      entry Release;
   end Lock;

end Sems_Tas;