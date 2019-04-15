use "../my_version_wk_2/hw2.sml";


datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove


fun card_color(card_color, card_number) = 
    case card_color of
        Diamonds => Red
        | Hearts => Red
        | Spades => Black
        | Clubs => Black

fun card_value (suit, rank) =
  case rank of
      Ace => 11
    | King => 10
    | Queen => 10
    | Jack => 10
    | Num i => i

fun remove_card (cs, c, e) = 
  case cs of
    [] => raise e
    | head::tail => 
        if (head = c)
          then tail
        else 
          head :: remove_card(tail,c,e) 

(* | head::tail => 
        if (head = c)
          then tail
        else 
          remove_card(tail,c,e)       *)
(* if (head = c)
          then tail
        else 
          remove_card(tail,c,e)  *)