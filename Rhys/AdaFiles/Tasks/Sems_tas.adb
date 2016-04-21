-- Semaphore package : Ada95 task types version
-- Author: Rob Allen, Swinburne University of Technology
-- Last modified: 18-Aug-99
package body Sems_Tas is

   task body Semaphore is
      N : Natural := Init;
   begin
      loop
         select
            when N > 0 =>
            accept Wait do
               N := N - 1;
            end Wait;
         or
            accept Signal do
               N := N + 1;
            end Signal;
         end select;
      end loop;
   end Semaphore;

   task body Lock is
   begin
      loop
         accept Acquire;
         accept Release;
      end loop;
   end Lock;

end Sems_Tas;