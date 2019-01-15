fun is_older(date1 : int * int * int, date2 : int * int * int) =
  let 
    val y1 = (#1 date1)
    val y2 = (#1 date2)
    val m1 = (#2 date1)
    val m2 = (#2 date2)
    val d1 = (#3 date1)
    val d2 = (#3 date2)
  in 
    y1 < y2 orelse ( y1 = y2 andalso m1 < m2) orelse ( y1 = y2 andalso m1 = m2 andalso d1 < d2) 
  end

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
    val last_day_of_the_month = [0,  31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in
    number_before_reaching_sum(day, last_day_of_the_month) 
  end

fun recursive_month_range(start_day:int, end_day:int, accumulator: int list) =

  let 
    val new_accumulator = accumulator @ [what_month(start_day)]
    val new_start_day = start_day + 1
  in
    if start_day > end_day
      then accumulator
    else
      recursive_month_range(new_start_day, end_day, new_accumulator)
  end

fun month_range(start_day:int, end_day:int) = 
  recursive_month_range(start_day, end_day, [])

fun oldest(dates: (int*int*int) list) = 
  if null dates
  then NONE
  else 
    if length dates = 1
      then SOME (hd dates)
    else 
      let 
        val first_date = hd dates
        val second_date = hd (tl dates)
        val new_accumulator = [first_date] @ tl (tl dates)
      in
        if is_older(first_date, second_date)
          then oldest(new_accumulator)
        else  
          oldest(tl dates)
      end