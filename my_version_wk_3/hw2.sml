use "hw2_copy.sml";


(* replace 0 with calculate final result *)

fun testPatternMatching(cardList, moveList, heldCards, goal) =
  case moveList of
    [] => [(Hearts, Num 2)]
    | Draw::moveListTail => 
      (case cardList of
        [] => [(Hearts, Num 2)]
        | cardListHead::cardListTail => cardListTail
        ) 
    | x => [(Hearts, Num 2)]
(* 
fun testPatternMatching(moveList) = 
  case moveList of
    [] => 0
    | Draw::drawTail => 
      (case drawTail of
        [] => 1
        | x => 2)
    | x => 3
 *)

(* (case cardList of 
        [] => 0
        | cardListHead::cardListTail =>
            let
              val result =  score(heldCards, goal) - goal
            in
              if result < 0
                play(cardListTail, drawTail, cardListHead::heldCards )
              else 
                result
              end
        
      
      ) *)


to do: 

fun playDraw(cardList, heldCards) =
  case cardList of
    [] => raise IllegalMove 
    | cardListHead::cardListTail => (cardListTail, cardListHead::heldCards)

fun play(cardList, moveList, heldCards, goal) =
  case moveList of
    [] => 0
    | Draw::moveListTail => 
      let
        val newCardList*newHeldCards = playDraw(cardList, heldCards)
        val result = goal - score(newHeldCards, goal) 
      in
        if result > 0
          play(newCardList, moveListTail, newHeldCards, goal)
        else
          result
      end
    | x => 0