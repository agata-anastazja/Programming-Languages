use "../my_version_wk_2/hw2.sml";


datatype suit = Clubs | Diamonds | Hearts | Spades
datatype rank = Jack | Queen | King | Ace | Num of int 
type card = suit * rank

datatype color = Red | Black
datatype move = Discard of card | Draw 

exception IllegalMove


fun card_color (card_color, card_number) = 
    case card_color of
        Diamonds => Red
        | Hearts => Red
        | Spades => Black
        | Clubs => Black