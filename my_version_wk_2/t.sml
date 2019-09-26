use "hw2.sml";
use "../testingHelper/error_testing.sml";

val test123 = 1=1
val test1 = play([], [Draw], [], 0) = 0

(* error scenario 


(cardList, moveList, heldCards, goal)
*)
val arguments_for_illegal_discard = ([(Hearts, Num 3)], [Discard (Hearts, Num 3)], [(Hearts, Num 1)], 1)

val test8 = throws(play, arguments_for_illegal_discard, IllegalMove) 

val test5 = card_color (Clubs, Num 2) = Black
 
val test6 = card_value (Clubs, Num 2) = 2

val test7 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []

val test8 = remove_card ([(Hearts, Ace), (Hearts, Ace)], (Hearts, Ace), IllegalMove) =  [(Hearts, Ace)] 

val arguments_for_illegal_remove_card = ([], (Hearts, Ace), IllegalMove)

val test10 = throws(remove_card, arguments_for_illegal_remove_card, IllegalMove)

val test11 = remove_card ([(Hearts, Ace), (Hearts, King), (Hearts, Ace)], (Hearts, King), IllegalMove) =  [(Hearts, Ace), (Hearts, Ace)] 

val test12 = remove_card ([(Hearts, Queen), (Hearts, King), (Hearts, Ace)], (Hearts, King), IllegalMove) =  [(Hearts, Queen), (Hearts, Ace)] 


val test13 = all_same_color( [(Hearts, Ace), (Hearts, Ace)]) = true 

val test14 = all_same_color( [(Hearts, King), (Hearts, Ace)]) = true 

val test15 =  (all_same_color [(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)] = true)

val test16 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4
val test17 = sum_cards [] = 0
val test18 = sum_cards [(Clubs, Ace),(Clubs, Num 2)]  = 13


val test20 = score ([(Hearts, Num 1), (Clubs, Num 1)], 1 )  = 3

val test21 = score ([(Hearts, Num 1), (Hearts, Num 1), (Hearts, Num 1)], 1 ) = 3
val test22 = score ([(Hearts, Num 1), (Hearts, Num 1), (Hearts, Num 1)], 3 ) = 0
val test23 = score ([(Hearts, Num 1), (Hearts, Num 1), (Hearts, Num 1)], 6 ) = 1


val test1 = all_except_option ("string", ["stringy"]) = NONE 

val test3 = all_except_option ("string", ["string", "strings"]) = SOME ["strings"] 

val test5 = all_except_option ("string", [ "strings", "string", "stringiiii"]) = SOME ["strings", "stringiiii"] 

val test_get_substitutions1 = (get_substitutions1 ([["there"]], "foo") = []) 

val test_get_substitutions2 = (get_substitutions1 ([["foo", "there"]], "foo") = ["there"]) 

val test_get_substitutions21 = (get_substitutions1 ([["there"], ["foo", "there"]], "foo") = ["there"]) 

val test21 = (get_substitutions1([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"]) 

val test2_get_substitutions2 = (get_substitutions2 ([["foo"],["there"]], "foo") = []) 

val test3_get_substitutions2 = (get_substitutions2([["Fred","Fredrick"],["Jeff","Jeffrey"],["Geoff","Jeff","Jeffrey"]],
"Jeff") = ["Jeffrey","Geoff","Jeffrey"]) 


val testOfficiate = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)