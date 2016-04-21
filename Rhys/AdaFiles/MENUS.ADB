with Ada.Text_Io;
with Strfns;
package body Menus is

  Max_Items : constant := 10;
  Max_Length : constant := 25;

  type Menu_Item_Value is
    record
      Selector : Character;
      Explanation : String(1..Max_Length);
    end record;

  type Menu_Items is array(1..Max_Items) of Menu_Item;

  type Menu_Value is
    record
      Title : String(1..Max_Length);
      Items : Menu_Items;
      Size : Integer range 0..Max_Items := 0;
      Last_Choice : Character;
    end record;

  function Make_Item(C : in Character;
		     E : in String) return Menu_Item is
  -- return a menu item with selector C and explanation E
    E1 : String(1..Max_Length);
    MI : Menu_Item;
  begin
    MI := new Menu_Item_Value;
    Strfns.Copy(E1,E);
    MI.Selector := C;
    MI.Explanation := E1;
    return MI;
  end Make_Item;

  procedure Create_With_Title(M : in out Menu;
			      T : in String) is
  -- create menu M with title T
  begin
    M := new Menu_Value;
    Strfns.Copy(M.Title,T);
  end Create_With_Title;

  procedure Add_Item(M : in out Menu;
		     I : in Menu_Item) is
  -- add item I to M
  begin
    if M.Size < Max_Items then
      M.Size := M.Size + 1;
      M.Items(M.Size) := I;
    else
      -- right now, if we already have max no of items, 
      -- just fail to add the item
      null;
    end if;
  end Add_Item;

  procedure Display(M : in Menu) is
  -- display M on the screen
    J : Integer range 1..Max_Items;
  begin
    Ada.Text_Io.Put_Line(M.Title);
    Ada.Text_Io.New_Line;
    for J in 1..M.Size loop
      Ada.Text_Io.Put(M.Items(J).Selector);
      Ada.Text_Io.Set_Col(5);
      Ada.Text_Io.Put_Line(M.Items(J).Explanation);
    end loop;
  end Display;

  procedure Get_Option(M : in out Menu) is
  -- get user choice
    Valid : Boolean := False;
    C : Character;
    J : Integer range 1..Max_Items;
  begin
    while not Valid loop
      Ada.Text_Io.New_Line;
      Ada.Text_Io.Put("Enter Option ==> ");
      Ada.Text_Io.Get(C);
      Ada.Text_Io.Skip_Line;
      J := 1;
      while J <= M.Size and not Valid loop
	if M.Items(J).Selector = C then
	  Valid := True;
	else 
	  J := J + 1;
	end if;
      end loop;
    end loop;
    M.Last_Choice := C;
  end Get_Option;

  function Last_Choice(M : Menu) return Character is
  -- last menu choice by user
  begin
    return M.Last_Choice;
  end Last_Choice;

end Menus;
