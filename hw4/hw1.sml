fun get_nth(words : string list, index : int) = 
  let 
    val new_index = index -1
  in
    if index = 1
      then (hd words)
    else
      get_nth((tl words), new_index)
  end

  
fun date_to_string(date : int*int*int) = 
  let
    val months = [
        "January",
        "February",
        "March", 
        "April",
        "May", 
        "June", 
        "July", 
        "August", 
        "September", 
        "October", 
        "November", 
        "December"
        ]
    in 
      get_nth(months, (#2 date)) ^ " " ^ Int.toString (#3 date) ^ ", " ^ Int.toString (#1 date)
    end

fun recursive_number_before_reaching_sum(goal:int, integer_list: int list, index:int, sum:int) = 
  let
    val current_sum = sum + (hd integer_list)
    val current_index = index + 1
  in
    if current_sum >= goal
      then index
    else 
      recursive_number_before_reaching_sum(goal, (tl integer_list), current_index, current_sum)
  end


fun number_before_reaching_sum(sum:int, integer_list: int list) =
  recursive_number_before_reaching_sum(sum, integer_list, 0, 0)

fun what_month(day: int) = 
  let 
    val first_day_of_the_month = [ 0, 1, 32, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335 ]
  in
    number_before_reaching_sum(day, first_day_of_the_month) 
  end