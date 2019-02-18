use "hw2.sml";


val test5 = card_color (Clubs, Num 2) = Black
 
val test6 = card_value (Clubs, Num 2) = 2

val test7 = remove_card ([(Hearts, Ace)], (Hearts, Ace), IllegalMove) = []
(*
val test8 = all_same_color [(Hearts, Ace), (Hearts, Ace)] = true 
andalso (all_same_color [(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)] = true)

val test9 = sum_cards [(Clubs, Num 2),(Clubs, Num 2)] = 4

val test10 = score ([(Hearts, Num 2),(Clubs, Num 4)],10) = 4

val test11 = officiate ([(Hearts, Num 2),(Clubs, Num 4)],[Draw], 15) = 6

val test12 = officiate ([(Clubs,Ace),(Spades,Ace),(Clubs,Ace),(Spades,Ace)],
                        [Draw,Draw,Draw,Draw,Draw],
                        42)
             = 3

val test13 = ((officiate([(Clubs,Jack),(Spades,Num(8))],
                         [Draw,Discard(Hearts,Jack)],
                         42);
               false) 
              handle IllegalMove => true)
             
val test14 = careful_player([(Spades,Num 7),(Hearts,King),(Clubs,Ace),(Diamonds,Num 2)], 18) = [Draw,Draw,Discard (Hearts,King),Draw]  

val test15 = officiate([(Spades,Num 7),(Hearts,King),(Clubs,Ace),(Diamonds,Num 2)], [Draw,Draw,Discard (Hearts,King),Draw], 18) = 0

val test16 = careful_player([(Diamonds,Num 2),(Clubs,Ace)], 11) = [Draw,Discard (Diamonds,Num 2),Draw]

val test17 = officiate([(Diamonds,Num 2),(Clubs,Ace)], [Draw,Discard (Diamonds,Num 2),Draw], 11) = 0 *)