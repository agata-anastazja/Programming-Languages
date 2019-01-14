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

fun recursive_number_in_month(xs : (int*int*int) list, month : int, accumulator : int) = 
  if null xs 
  then accumulator
  else
    let 
      val current_date = hd xs
      val current_month = (#2 current_date)
      val new_accumulator = accumulator + 1
      in 
      if (current_month = month)
      then 
        recursive_number_in_month(tl xs, month, new_accumulator)
      else 
      recursive_number_in_month(tl xs, month, accumulator)
    end


fun number_in_month(xs : (int*int*int) list, month : int) = 
    recursive_number_in_month(xs, month, 0)
  


