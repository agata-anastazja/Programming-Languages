use "hw4/hw1.sml";
val test_number_before_reaching_sum = number_before_reaching_sum(2, [0, 3, 5]) = 1;
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




