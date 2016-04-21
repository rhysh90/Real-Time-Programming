package Menus is

  type Menu_Item is private;
  type Menu is private;

  function Make_Item(C : in Character;
		     E : in String) return Menu_Item;
  -- return a menu item with selector C and explanation E

  procedure Create_With_Title(M : in out Menu;
			      T : in String);
  -- create menu M with title T

  procedure Add_Item(M : in out Menu;
		     I : in Menu_Item);
  -- add item I to M

  procedure Display(M : in Menu);
  -- display M on the screen

  procedure Get_Option(M : in out Menu);
  -- get user choice

  function Last_Choice(M : Menu) return Character;
  -- last menu choice by user

private

  type Menu_Item_Value;
  type Menu_Item is access Menu_Item_Value;

  type Menu_Value;
  type Menu is access Menu_Value;
end Menus;
