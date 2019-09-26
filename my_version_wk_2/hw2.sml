
fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun all_except_option(checkedString, listOfStrings) =
  case listOfStrings of
    [] => NONE 
    |x::listOfStrings' => if same_string(x, checkedString)
        then SOME listOfStrings'
    else case  all_except_option(checkedString, listOfStrings') of
        NONE => NONE 
        | SOME ls =>  SOME (x :: ls)


fun get_substitutions1(stringlistlist, str) = 
    case stringlistlist of
        [] => []
        | head::tail => 
            case  all_except_option(str, head) of
                NONE => [] @ get_substitutions1(tail, str)
                | SOME ls => ls @ get_substitutions1(tail, str)

fun get_substitutions_tail_recursive(stringlistlist, str, accumulator) = 
    case stringlistlist of
        [] => [] @ accumulator
        | head::tail => 
            case  all_except_option(str, head) of
                NONE => get_substitutions_tail_recursive(tail, str, accumulator)
                | SOME ls => get_substitutions_tail_recursive(tail, str, ( accumulator @ ls))

 fun get_substitutions2(strlistList, str) = 
    get_substitutions_tail_recursive(strlistList, str, [])


fun createListOfEntries(listOfNames, {first=x,middle=y,last=z}) =
    case listOfNames of
        [] => []
        | head::tail => 
            [{first=head,middle=y,last=z}] @ createListOfEntries(tail, {first=x,middle=y,last=z})


 fun similar_names(listOfNameLists, name) = 
    let
        val {first=x,middle=y,last=z} = name 
    in
        let
            val flatListOfNames = [x] @ get_substitutions1(listOfNameLists, x)
        in 
            createListOfEntries(flatListOfNames, name )
        end
    end


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

fun testPatternMatching(cardList, moveList, heldCards, goal) =
  case moveList of
    [] => [(Hearts, Num 2)]
    | Draw::moveListTail => 
      (case cardList of
        [] => [(Hearts, Num 2)]
        | cardListHead::cardListTail => cardListTail
        ) 
    | x => [(Hearts, Num 2)]



fun play(cardList, moveList, heldCards, goal) =
  case moveList of
    [] => score(heldCards, goal)
    | Draw::moveListTail => 
      (case cardList of
      [] => score(heldCards, goal) 
      | cardListHead::cardListTail =>
        let
          val (newCardList, newHeldCards) =  (cardListTail, cardListHead::heldCards)
          val result = score(newHeldCards, goal) - goal
        in
          if result < 0 
            then play(newCardList, moveListTail, newHeldCards, goal)
          else
            result
        end)
     | Discard card :: moveListTail => play(cardList, moveListTail, remove_card(heldCards, card, IllegalMove), goal)


fun officiate(cardList, moveList, goal) = 
  play(cardList, moveList, [], goal)
  
