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
  let
    val head::tail = listOfCards
  in
    case tail of
      [] => true
      | tailHead::tailTail =>
        if ( card_color tailHead = card_color head )
          then all_same_color(tail)
        else
          false
    end

fun sum_cards_recursive(listOfCards, acc) = 
    case listOfCards of
      [] => 0 + acc
      | head :: tail =>
        sum_cards_recursive (tail, card_value head + acc)

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

(* [(Hearts, Num 1), (Hearts, Num 1), (Hearts, Num 1)], 1 )  *)
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

(* fun playRound(cardList, moveList, heldCards) =
    case moveList of 
      [] => (cardList, moveList, heldCards) 
      | moveHead::moveTail => 
          (case moveList of
            [] => raise IllegalMove
            | cardListHead::cardListTail =>
              let 
                val newHand = cardListHead::heldCards
              in 
                playRound(cardListTail, moveTail, newHand)  
              end  )         *)


(*playRound ([(Hearts, Num 1)], [Draw], []) *)
(* fun playRound(cardList, moveList, heldCards) =
    case moveList of 
      [] => (cardList, moveList, heldCards) 
      | moveHead::moveTail => 
          (case cardList of
            [] => ([], [], heldCards)
            | cardListHead::cardListTail =>
              let 
                val newHand = cardListHead::heldCards
              in 
                playRound(cardListTail, moveTail, newHand)  
              end  )         *)


fun playDraw(cardList, heldCards) = 
  case cardList of
    [] => raise IllegalMove
    | cardListHead::cardListTail => 
      cardListTail 
              
(* fun playRound(cardList, moveList, heldCards) =
    case moveList of 
      [] => (cardList, moveList, heldCards) 
      | moveHead::moveTail => 
        (case moveHead of
          Draw => 
            ( 
              case moveList of
                [] => raise IllegalMove
                | cardListHead::cardListTail =>
                  let 
                    val newHand = cardListHead::heldCards
                  in 
                    playRound(cardListTail, moveTail, newHand)  
                  end           
              )) *)

(* case e1 of                   
   p1 => ( case e11 of         
              NONE => expr11
              | SOME v => expr12 v )
   | p2 => ( case e21 of         
                NONE => expr21
                | SOME v => expr22 v ) *)