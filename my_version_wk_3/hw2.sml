use "hw2_copy.sml";

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