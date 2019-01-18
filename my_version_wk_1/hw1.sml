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

fun number_in_month(xs : (int*int*int) list, month : int) = 
  if null xs
    then 0
  else 
    let 
      val current_date = hd xs
      val current_month = (#2 current_date)
    in 
      if (current_month = month)
        then number_in_month(tl xs, month) + 1
      else 
        number_in_month(tl xs, month)
    end

fun dates_in_month(dates : (int*int*int) list, month:int) =
  if null dates
    then []
  else 
    let
      val current_date = hd dates
      val current_month = (#2 current_date)
    in
      if (current_month = month)
      then 
        [current_date] @ dates_in_month(tl dates, month) 
      else 
        dates_in_month(tl dates, month)
    end

fun dates_in_months(dates : (int*int*int) list, months : int list) = 
  if null months orelse null dates
    then []
  else 
    let 
      val checked_month = hd months
      val remaining_months = tl months
    in
      dates_in_month(dates, checked_month) @ dates_in_months(dates, remaining_months)  
    end

fun get_nth(words : string list, index : int) = 
  if index = 0
    then hd words
  else 
    get_nth((tl words), (index - 1))
 
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

fun number_before_reaching_sum(sum:int, integer_list: int list) =
  if sum - (hd integer_list) <= 0
    then 0
  else
    let 
      val current_integer = hd integer_list
      val current_sum = sum - current_integer
    in
      number_before_reaching_sum(current_sum, (tl integer_list)) + 1
    end

fun what_month(day: int) = 
  let 
    val first_day_of_the_month = [ 0, 1, 32, 60, 91, 121, 152, 182, 213, 244, 274, 305, 335 ] 
  in
    number_before_reaching_sum(day, first_day_of_the_month)
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



fun what_month(day: int) = 
  let 
    val last_day_of_the_month = [0,  31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  in
    number_before_reaching_sum(day, last_day_of_the_month) 
  end

fun month_range(start_day:int, end_day:int) = 
  if start_day > end_day
    then []
  else
    let
      val new_start_day = start_day + 1
    in
     [what_month(start_day)] @ month_range(new_start_day, end_day)
    end

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