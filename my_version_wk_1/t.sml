use "hw1.sml";
(* val test_number_before_reaching_sum = number_before_reaching_sum(2, [0, 3, 5]) = 1;
val test_number_before_reaching_sum_when_first_elem_fullfills_condition = number_before_reaching_sum(33,[ 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334 ]) = 2 ;
val test_number_before_reaching_sum_multiple = number_before_reaching_sum(15, [1, 2, 3, 4, 5, 6]) = 4;
val test_what_month = what_month(32) = 2;
val test_what_month_2 = what_month(2) = 1;

val test_month_range = month_range(30, 20) = [];
val test_month_range_2 = month_range(30, 30) = [1];
val test_month_range_3 = month_range(40, 40) = [2];
val test_month_range_4 = month_range(40, 41 ) = [2, 2];
val test_month_range_5 = month_range(31, 32 ) = [1, 2];
val test10 = month_range(30, 33) = [1, 1, 2, 2];

val test_oldest_when_no_dates_passed =  oldest [] = NONE;
val test_oldest_when_one_date_passed =  oldest [(2018, 10, 30)] = SOME (2018, 10, 30);
val test_oldest_when_two_dates_passed =  oldest [(2018, 10, 30), (2018, 9, 30)] = SOME (2018, 9, 30);
val test_oldest = oldest([(2018, 10, 30), (2018, 10, 25), (2018, 10, 31), (1995, 11, 31)]) = SOME (1995,11,31) andalso (oldest [] = NONE); *)


val test_no_number_in_month_2 = number_in_month([(1888, 12, 31)], 9) = 0;
val test_no_number_in_month = number_in_month([(1888, 12, 31)], 9) = 0;
val test_number_in_month_appears_once = number_in_month([(1888, 12, 31)], 12) = 1;
val test_number_in_month_appears_twice = number_in_month([(1888, 12, 31), (1888, 12, 31)], 12) = 2;

val test_no_dates_in_month = dates_in_month([(21, 1, 1998)], 2) = [] ;
val test_one_date_in_dates_in_month = dates_in_month([(21, 1, 1998)], 1) = [(21, 1, 1998)] ;
val test_two_dates_in_dates_in_month = dates_in_month([(21, 1, 1998), (31, 1, 1988)], 1) = [(21, 1, 1998), (31, 1, 1988)] ;
val test_multiple_dates_in_months = dates_in_months([(21, 1, 1998), (22, 2, 1997), (23, 3, 1997), (25, 2, 1088)], [2, 3]) = [(22,2,1997), (25,2,1088), (23,3,1997)] andalso (null (dates_in_months([(21, 1, 1998), (22, 2, 1997), (23, 3, 1997), (25, 2, 1088)], [10, 11, 12]))) andalso (dates_in_months ([(1,2,25),(3,5,26),(1,12,29),(3,2,28),(1,2,27),(1,2,25),(6,7,8)], []) = []) ;


val test_no_dates_in_months = dates_in_months([(21, 1, 1998)], [2, 3]) = [] ;
val test_one_date_in_dates_in_months = dates_in_months([(21, 1, 1998)], [1, 3]) = [(21, 1, 1998)] ;
val test5 = dates_in_months([(21, 1, 1998), (22, 2, 1997), (23, 3, 1997), (25, 2, 1088)], [2, 3]) = [(22,2,1997), (25,2,1088), (23,3,1997)] andalso (null (dates_in_months([(21, 1, 1998), (22, 2, 1997), (23, 3, 1997), (25, 2, 1088)], [10, 11, 12]))) andalso (dates_in_months ([(1,2,25),(3,5,26),(1,12,29),(3,2,28),(1,2,27),(1,2,25),(6,7,8)], []) = []);

val test_nth_element = get_nth(["AB","CD", "EF", "GH"], 3) = "EF";
val test_nth_element_2 = get_nth(["AB","CD", "EF", "GH"], 4) = "GH";

val test_date_to_string = date_to_string(2018, 12, 31) = "December 31, 2018"; 
val test8 = number_before_reaching_sum(15, [1, 2, 3, 4, 5, 6]) = 4 andalso (number_before_reaching_sum(15, [1, 2, 3, 4, 4, 5, 6]) = 5);
val test9 = what_month(33) = 2;

