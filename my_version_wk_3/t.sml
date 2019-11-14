use "provided.sml";

val test1 = only_capitals ["A","B","C"] = ["A","B","C"]

val test2 = only_capitals ["A", "b"] = ["A"]

val test3 = longest_string1 ["A","bc","C"] = "bc"

val test4 = longest_string1 ["Ab","ac","C"] = "Ab"


val test5 = longest_string2 ["Ab","ac","C"] = "ac"


 val test4a = longest_string3 ["A","bc","C"] = "bc"

val test4b = longest_string4 ["A","B","C"] = "C"
val test6 = longest_capitalized ["A","bc","C"] = "A"
val test7 = longest_capitalized ["a"] = ""
 val test8 = splitter "abc" = ["a", "b", "c"] 
val test9 = rev_string "abc" = "cba"
