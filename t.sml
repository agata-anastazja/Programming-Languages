use "hw4/hw1.sml";
val test1 = is_older((1998, 12, 13), (1998, 12, 14)) ;
val test2 = not (is_older((1998, 12, 13), (1998, 12, 13))) ;
val test_no_number_in_month = number_in_month([(1888, 12, 31)], 9) = 0;
val test_number_in_month_appears_once = number_in_month([(1888, 12, 31)], 12) = 1;
val test_number_in_month_appears_once = number_in_month([(1888, 12, 31), (1888, 12, 31)], 12) = 2;
