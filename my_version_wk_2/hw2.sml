fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun all_except_option(checkedString, listOfStrings) =
  case listOfStrings of
    [] => NONE 
    |x::listOfStrings' => if same_string(x, checkedString)
        then SOME listOfStrings'
    else case  all_except_option(checkedString, listOfStrings') of
        NONE => NONE 
        | SOME ls =>  SOME (x :: ls)

fun get_substitutions1(stringlistlist, str) = 
    case stringlistlist of
        [] => []
        | head::tail => 
            case  all_except_option(str, head) of
                NONE => [] @ get_substitutions1(tail, str)
                | SOME ls => ls @ get_substitutions1(tail, str)
            