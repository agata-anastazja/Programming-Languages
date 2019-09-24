use "hw2.sml";
use "../testingHelper/error_testing.sml";

val test123 = 1=1
val test1 = play([], [Draw], [], 0) = 0

(* error scenario 


(cardList, moveList, heldCards, goal)
*)
val arguments_for_illegal_discard = ([(Hearts, Num 3)], [Discard (Hearts, Num 3)], [(Hearts, Num 1)], 1)

val test8 = throws(play, arguments_for_illegal_discard, IllegalMove) 

