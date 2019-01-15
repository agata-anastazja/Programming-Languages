use "hw4/hw1.sml";
val test_number_before_reaching_sum = number_before_reaching_sum(2, [0, 3, 5]) = 1;
val test_number_before_reaching_sum_when_first_elem_fullfills_condition = number_before_reaching_sum(33,[ 0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334 ]) = 2 ;
val test_number_before_reaching_sum_multiple = number_before_reaching_sum(15, [1, 2, 3, 4, 5, 6]) = 4;
