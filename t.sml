use "hw4/hw1.sml";
val test1 = is_older((1998, 12, 13), (1998, 12, 14)) ;
val test2 = not (is_older((1998, 12, 13), (1998, 12, 13))) ;
val test3 = not (is_older((1999, 12, 13), (1998, 12, 13))) ;
