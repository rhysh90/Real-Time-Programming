procedure List_Tes is
-- experiment with linked lists

  type Node_Type;
  type List_Type is access Node_Type;
  type Node_Type is
    record
      Item : Integer;
      Next : List_Type;
    end record;



  procedure Add_To_Front(L : in out List_Type; X : in Integer) is
  -- add item X at from of L
  <<  you provide the code >>

  procedure Put(L : in List_Type) is
  -- put the items of L on the screen, separated by commas
  <<  you provide the code >>


  function Length(L : List_Type) return Integer is
  -- returns the length of L
  <<  you provide the code >>

  function Sum(L : List_Type) return Integer is
  -- returns the sum of the elements in L
  <<  you provide the code >>



begin -- List_Test
  << You provide code to build a list by repeatedly getting integers from
     the keyboard and then adding them to the front of the list. Once the
     list has been built, use Put to print it on the screen. Compute the
     length of the list, and print it. Compute the sum of the list elements
     and print it. >>
end List_Tes;