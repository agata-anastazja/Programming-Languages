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

fun get_substitutions_tail_recursive(stringlistlist, str, accumulator) = 
    case stringlistlist of
        [] => [] @ accumulator
        | head::tail => 
            case  all_except_option(str, head) of
                NONE => get_substitutions_tail_recursive(tail, str, accumulator)
                | SOME ls => get_substitutions_tail_recursive(tail, str, ( accumulator @ ls))

 fun get_substitutions2(strlistList, str) = 
    get_substitutions_tail_recursive(strlistList, str, [])


fun createListOfEntries(listOfNames, {first=x,middle=y,last=z}) =
    case listOfNames of
        [] => []
        | head::tail => 
            [{first=head,middle=y,last=z}] @ createListOfEntries(tail, {first=x,middle=y,last=z})


 fun similar_names(listOfNameLists, name) = 
    let
        val {first=x,middle=y,last=z} = name 
    in
        let
            val flatListOfNames = [x] @ get_substitutions1(listOfNameLists, x)
        in 
            createListOfEntries(flatListOfNames, name )
        end
    end
