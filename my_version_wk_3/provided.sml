(* Coursera Programming Languages, Homework 3, Provided Code *)

exception NoAnswer

datatype pattern = Wildcard
		 | Variable of string
		 | UnitP
		 | ConstP of int
		 | TupleP of pattern list
		 | ConstructorP of string * pattern

datatype valu = Const of int
	      | Unit
	      | Tuple of valu list
	      | Constructor of string * valu

fun g f1 f2 p =
    let 
	val r = g f1 f2 
    in
	case p of
	    Wildcard          => f1 ()
	  | Variable x        => f2 x
	  | TupleP ps         => List.foldl (fn (p,i) => (r p) + i) 0 ps
	  | ConstructorP(_,p) => r p
	  | _                 => 0
    end


fun only_capitals stringList = 
	List.filter (fn evaluatedString => Char.isUpper(String.sub(evaluatedString, 0))) stringList


fun longest_string1 stringList = 
	List.foldl (fn (x, a) =>  if( String.size(x) > String.size(a)) then x else a  ) "" stringList


fun longest_string2 stringList = 
	List.foldl (fn (x, a) =>  if( String.size(x) < String.size(a)) then a else x  ) "" stringList

val helper = fn (first_argument, second_argument) =>  first_argument >  second_argument
val helper2 = fn (first_argument, second_argument) =>  if first_argument <  second_argument then true else false

fun fold f acc xs =
	case xs of
	[] => acc
	| x::xs' => fold f (f(acc,x)) xs'

fun fold f = fn acc => fn xs =>
	case xs of
	[] => acc
	| x::xs' => fold f (f(acc,x)) xs'


fun longest_string_helper_2 f = fn stringList => fn acc =>
	case stringList of
		[] => acc
		| x::xs' => 
			let 
				val new_accumulator = if f(String.size(x), String.size(acc))
					then
						x
					else acc
			in
				longest_string_helper_2 f xs' new_accumulator
			end

fun longest_string_helper f = fn stringList => 
	case stringList of
		[] => ""
		| x::xs' => 
		  (case xs' of
				[] => x
				| z::zs' => 
				 if (f(String.size(x), String.size(z)))
				 then longest_string_helper f (x::zs') 
				 else longest_string_helper  f (z::zs') 
			)

val longest_string3 =  fn stringList => longest_string_helper helper stringList 
val longest_string4 =  fn stringList => longest_string_helper helper2 stringList 

 (* Write a function longest_capitalized that takes astring 
 listand returns the longest string inthe list that begins 
 with an uppercase letter,  or "" if there are no such strings.  
 Assume all stringshave at least 1 character.  Use aval-binding 
 and the ML library’s o operator for composing functions.
 Resolve ties like in problem 2 
(sign o foo) (4,~5)
Which would give you the same as sign (foo (4,~5)).
*)

val longest_capitalized = fn stringList => (longest_string1 o only_capitals) stringList