with Ada.Text_Io;
use Ada.Text_Io;

procedure Mac is
-- calculate Madonald's order

package Flt_Io is new Ada.Text_Io.Float_Io(Float);
package Int_Io is new Ada.Text_Io.Integer_Io(Integer);

Items : array(1..5) of String(1..15);
Prices : array(1..5) of Float := (2.80, 3.10, 2.40, 1.20, 1.50);
Qtys : array(1..5) of Integer;
Total_Cost : Float := 0.00;

begin
   Items(1) := "Big Mac        ";
   Items(2) := "Quarter Pounder";
   Items(3) := "Chicken Nuggets";
   Items(4) := "Coke           ";
   Items(5) := "Fries          ";
-- {You complete code to take order and print itemised account}
end Mac;