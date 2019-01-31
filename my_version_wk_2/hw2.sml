fun same_string(s1 : string, s2 : string) =
    s1 = s2

fun all_except_option(checkedString, listOfStrings) =
    case listOfStrings of
        [] => NONE
        |["stringy"] => NONE