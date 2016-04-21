-- A version of Io_Ports for testing only, requires Dio192defs v2.0
-- Rob Allen 2008-03-12
--
with Raildefs, Dio192defs, Unsigned_Types;
use  Raildefs, Dio192defs, Unsigned_Types;
with Ada.Text_Io, Ada.Integer_Text_Io;
use  Ada.Text_Io, Ada.Integer_Text_Io;
with Unchecked_Conversion;
package body Dummy_Ports is

   procedure Read_Io_Ports (
         Address : in     Unsigned_16; 
         Value   :    out Unsigned_8   ) is 
   begin
      Put_Line("Read_Io_Ports not implemented");
      Value := 0;
   end Read_Io_Ports;

   function To_Block_Register is 
   new Unchecked_Conversion (
      Source => Unsigned_8, 
      Target => Block_Register);

   function To_Turnout_Drive_Register is 
   new Unchecked_Conversion (
      Source => Unsigned_8, 
      Target => Turnout_Drive_Register);

   function To_Turnout_Status_Register is  -- rfe
   new Unchecked_Conversion (
      Source => Unsigned_8, 
      Target => Turnout_Status_Register);

   subtype String8 is String(1..8);
   subtype String2 is String(1..2);

   function Image_Of (
         P : Polarity_Type ) 
     return String2 is 
      S : String2 := " +"; -- assume normal  
   begin
      if P = Reverse_Pol then
         S(2) := '-';
      end if;
      return S;
   end Image_Of;

   function Image_Of (
         Pa : Block_Nibble ) 
     return String is 
   begin
      return Image_Of(Pa.Blk_Pol) & Pa.Blk_Cab'Img;
   end Image_Of;

   function Image_Of (
         Pa : Block_Register ) 
     return String is 
   begin
      return Image_Of(Pa(1)) & Image_Of(Pa(0));
      -- the above works because 'img for a +ve int precedes with a space.
      -- and the array is laid out small end first
   end Image_Of;

   function Image_Of (
         Q : Turnout_Status_Register )     -- rfe
     return String is 
      S : String8 := "........";  
   begin
      for B in reverse Turnout_Idx range 0..7 loop
         if Q(B) = Busy then
            S(8 - Integer(B)) := 'm';
            -- note the array is laid out small end first but String
            -- has first char on the left.
         end if;
      end loop;
      return S;
   end Image_Of;

   function Image_Of (
         Q : Turnout_Drive_Register )
     return String is 
      S : String8 := "ssssssss";  
   begin
      for B in reverse Turnout_Idx range 0..7 loop
         if Q(B) = Pull_Tu then
            S(8 - Integer(B)) := 'T';
            -- note the array is laid out small end first but String
            -- has first char on the left.
         end if;
      end loop;
      return S;
   end Image_Of;


   -- writes one line to standard output
   procedure Write_Io_Port (
         Address : in     Unsigned_16; 
         Value   : in     Unsigned_8   ) is 
   begin
      Put(Integer(Address), Width=>10, Base=>16);
      Put(Integer(Value), 12, 2);
      case Address is
         when Pa1_Addr|Pb1_Addr|Pc1_Addr|Qa1_Addr|Qb1_Addr|Qc1_Addr|
             Pa2_Addr|Pb2_Addr|Pc2_Addr|Qa2_Addr|Qb2_Addr|Qc2_Addr =>
            Put(" : " & Image_Of(To_Block_Register(Value)));
         when Pb3_Addr|Qa3_Addr|Qc3_Addr =>
            Put(" : " & Image_Of(To_Turnout_Drive_Register(Value)));
         when others =>
            null;
      end case;
      New_Line;
   end Write_Io_Port;

end Dummy_Ports ;