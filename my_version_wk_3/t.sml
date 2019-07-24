use "hw2.sml";
use "../testingHelper/error_testing.sml";

(* val test1 = play([], [Draw], [], 0) = 0
val test2 = play([], [], [], 0) = 0
val test3 = play([(Hearts, Num 1)], [Draw], [], 0)  *)

val testPatternMatching1 = testPatternMatching([], [Draw], [], 0);

val testPatternMatching2 = testPatternMatching([(Hearts, Num 1)], [Draw], [], 0);