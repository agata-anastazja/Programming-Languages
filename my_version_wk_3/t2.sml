use "hw2.sml";

use "../testingHelper/error_testing.sml";


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

 (* val test19 = score ([(Hearts, Num 2)], 3 ) = 1 *)


val test20 = score ([(Hearts, Num 1), (Clubs, Num 1)], 1 )  = 3

val test21 = score ([(Hearts, Num 1), (Hearts, Num 1), (Hearts, Num 1)], 1 ) = 3
val test22 = score ([(Hearts, Num 1), (Hearts, Num 1), (Hearts, Num 1)], 3 ) = 0
val test23 = score ([(Hearts, Num 1), (Hearts, Num 1), (Hearts, Num 1)], 6 ) = 1
