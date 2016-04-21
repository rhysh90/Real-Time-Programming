-- A version of Io_Ports for testing only, requires Pc14defs v2.0
-- (doesnt support Dio48s or input yet)
-- Rob Allen 2007-03-08
--
with Unsigned_Types;
use  Unsigned_Types;
package Dummy_Ports is

   -- writes one line to standard output
   procedure Write_Io_Port (
         Address : in     Unsigned_16; 
         Value   : in     Unsigned_8   ); 

   procedure Read_Io_Ports (
         Address : in     Unsigned_16; 
         Value   : out    Unsigned_8   ); 

end Dummy_Ports;
