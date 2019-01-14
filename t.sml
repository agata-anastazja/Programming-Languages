use "hw4/hw1.sml";
val test1 = is_older((1998, 12, 13), (1998, 12, 14)) ;
val test2 = not (is_older((1998, 12, 13), (1998, 12, 13))) ;
val test_no_number_in_month = number_in_month([(1888, 12, 31)], 9) = 0;
val test_number_in_month_appears_once = number_in_month([(1888, 12, 31)], 12) = 1;
val test_number_in_month_appears_twice = number_in_month([(1888, 12, 31), (1888, 12, 31)], 12) = 2;
(* val test_no_dates_in_month = dates_in_month([(21, 1, 1998), (22, 2, 1997), (23, 3, 1997), (25, 2, 1088)], 2) = [(22,2,1997), (25,2,1088)]  *)
val test_no_dates_in_month = dates_in_month([(21, 1, 1998)], 2) = [] 
val test_one_date_in_dates_in_month = dates_in_month([(21, 1, 1998)], 1) = [(21, 1, 1998)] 
val test_two_dates_in_dates_in_month = dates_in_month([(21, 1, 1998), (31, 1, 1988)], 1) = [(21, 1, 1998), (31, 1, 1988)] 