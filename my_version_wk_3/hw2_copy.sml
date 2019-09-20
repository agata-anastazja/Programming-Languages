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

fun all_same_color(listOfCards) =  
  case listOfCards of
    [] => true
    | headOfList::tailOfList => (
      case tailOfList of
      [] => true
      | tailHead::tailTail => (
        if ( card_color tailHead = card_color headOfList )
          then all_same_color(tailOfList)
        else
          false)
    )

fun sum_cards_recursive(listOfCards, acc) = 
    case listOfCards of
      [] => 0 + acc
      | head :: tail => sum_cards_recursive (tail, card_value head + acc)

fun sum_cards(listOfCards) = 
    sum_cards_recursive(listOfCards, 0)


fun intermediary_score( listOfCards, goal) = 
  let
    val handValue = sum_cards(listOfCards)
  in
    if (handValue > goal )
      then (handValue - goal) * 3
    else 
      goal - handValue
  end

fun score(listOfCards, goal) = 
  let 
    val intermediaryScore = intermediary_score(listOfCards, goal)
    val sameColor = all_same_color(listOfCards)
  in 
    if (sameColor)
      then intermediaryScore  div 2
    else
      intermediaryScore
  end

              