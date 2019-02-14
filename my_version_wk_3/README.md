- [HomeWork Questions(2018.6)](../homework-questions/hw2.pdf)
- [HomeWork Source Code](./hw2.sml)
- [Test for this HomeWork](./hw2test.sml)

### Problem 1a

Solution:
``` sml
fun all_except_option (str, xs) =
    case xs of
        [] => NONE
        | x :: xs' => 
            if same_string(str, x)
            then SOME xs'
            else case all_except_option(str, xs') of
                NONE => NONE
              | SOME ls => SOME (x :: ls)
```

It's a bit like remove dulicates' algorithm. Since the problem assume the string is in the list at most once, we can just return SOME `tail` if the `head` is same with the given string, and recursive call `all_except_option` function if the `head` is not the same as the given string.


### Problem 1b

This problem is very simple with part(a) already solved.

``` sml
fun get_substitutions1(xs, s) =
    case xs of
       [] => []
     | x :: xs' => case all_except_option(s, x) of
        NONE => get_substitutions1(xs', s)
      | SOME ls => ls @ get_substitutions1(xs', s)
```

### Problem 1c*

**Tail recursion** : use accumulators as a technique to make some functions tail recursive.

``` sml
fun get_substitutions2(xs, s) =
    let
        fun aux(xs, s, acc) =
            case xs of
               [] => acc
             | x :: xs' => case all_except_option(s, x) of
                NONE => aux(xs', s, acc)
              | SOME ls => aux(xs', s, ls @ acc)
    in
        aux(xs, s, [])
    end
```

The base case in the non-accumulator style(Partb) becomes the initial accumulator and the base case in the accumulator style(Partc) just returns the accumulator.

Why might get_substitutions2 be preferred when it is clearly more complicated? 

We need to understand a little bit about how function calls are implemented. Conceptually, there is a call stack, which is a stack (the data structure with push and pop operations) with one element for each function call that has been started but has not yet completed. Each element stores things like the value of local variables and what part of the function has not been evaluated yet. When the evaluation of one function body calls another function, a new element is pushed on the call stack and it is popped off when the called function completes.

So for get_substitutions1, there will be one call-stack element (sometimes just called a “stack frame”) for each recursive call to get_substitutions1, i.e., the stack will be as big as the list. This is necessary because after each stack frame is popped off the caller has to, “do the rest of the body” — namely add y to the recursive result and return.

Given the description so far, get_substitutions2 is no better: get_substitutions2 makes a call to f which then makes one recursive call for each list element. However, when f makes a recursive call to f, **there is nothing more for the caller to do after the callee returns except return the callee’s result. This situation is called a tail call** (let’s not try to figure out why it’s called this) and functional languages like ML typically promise an essential optimization: When a call is a tail call, the caller’s stack-frame is popped **before** the call — the callee’s stack-frame just **replaces** the caller’s. This makes sense: the caller was just going to return the callee’s result anyway. Therefore, calls to get_substitutions2 never use more than 1 stack frame.

Why do implementations of functional languages include this optimization? By doing so, **recursion can sometimes be as efficient as a while-loop**, which also does not make the call-stack bigger. The “sometimes” is exactly when calls are tail calls, something you the programmer can reason about since you can look at the code and identify which calls are tail calls.

Tail calls do not need to be to the same function (f can call g), so they are more flexible than while-loops that always have to “call” the same loop. **Using an accumulator is a common way to turn a recursive function into a “tail-recursive function”**(one where all recursive calls are tail calls), but not always. For example, functions that process trees (instead of lists) typically have call stacks that grow as big as the depth of a tree, but that’s true in any language: while-loops are not very useful for processing trees.

### Problem 1d

Nothing but records and pattern matching.

``` sml
fun similar_names (substitutions,name) =
    let 
        val {first=f, middle=m, last=l} = name
	      fun make_names xs =
	         case xs of
		           [] => []
	           | x::xs' => {first=x, middle=m, last=l}::(make_names(xs'))
    in
	      name::make_names(get_substitutions2(substitutions,f))
    end
```

officiate_challenge: Your function returns an incorrect result when the game should end due to the sum of cards in the player's hand exceeding the goal. [incorrect answer]

officiate_challenge: Your function returns an incorrect result when an ace is in the players hand. [incorrect answer]

officiate_challenge: Your function returns an incorrect result when the game should end due to an empty move list with low score. [incorrect answer]


### Problem 2a

``` sml
fun card_color(the_suit, the_rank) =
    case the_suit of
       Clubs => Black
     | Spades => Black
     | Diamonds => Red
     | Hearts => Red
```

where we can also **use the wildcard pattern** make it like this:
```sml
fun card_color card =
    case card of
        (Clubs,_)    => Black
      | (Diamonds,_) => Red
      | (Hearts,_)   => Red
      | (Spades,_)   => Black
```

### Problem 2b

``` sml
fun card_value card =
    case card of
	      (_,Jack) => 10
      | (_,Queen) => 10
      | (_,King) => 10
      | (_,Ace) => 11 
      | (_,Num n) => n
```

### Problem 2c

Very simple recurision.

``` sml
fun remove_card(cs, c, e) =
    case cs of
       [] => raise IllegalMove
     | head::tail => 
        if head = c
        then tail
        else head :: remove_card(tail, c, e)
```

### Problem 2d

My version:

``` sml
fun all_same_color cards =
    case cards of
       [] => true
     | c::cs => case cs of
        [] => true
      | c'::cs' => card_color c = card_color c' andalso all_same_color cs
```

Even more concise: use wildcard to match lists only has one element:

``` sml
fun all_same_color cs = 
    case cs of
        [] => true
      | [_] => true
      | head::neck::tail => card_color head = card_color neck 
			    andalso all_same_color(neck::tail)
```

### Problem 2e

Another tail recursion example.

``` sml
fun sum_cards cards =
    let
        fun aux(cards, acc) =
            case cards of
               [] => acc
             | c::cs => aux(cs, card_value c + acc)
    in
        aux(cards, 0)
    end
```

### Problem 2f

My version:

``` sml
fun score (held_cards, goal) =
    let
        val sum = sum_cards held_cards
        fun pre_score(sum, goal) =
            if sum > goal
            then 3 * (sum - goal)
            else goal - sum
    in
        if all_same_color held_cards
        then pre_score(sum, goal) div 2
        else pre_score(sum, goal)
    end
```

More clearly and functional(Note `if` expression itself is an expression in SML):

``` sml
fun score (cs,goal) = 
    let 
        val sum = sum_cards cs
    in
        (if sum >= goal then 3 * (sum - goal) else goal - sum)
	      div (if all_same_color cs then 2 else 1)
    end
```

### Problem 2g

My solution:

``` sml
fun officiate (card_list, moves, goal) =
    let
        fun play(card_list, current_helds, remain_moves) =
            case remain_moves of
               [] => current_helds
             | head::tail => case head of
                Discard c => play(card_list, remove_card(current_helds, c, IllegalMove), tail)
              | Draw => case card_list of
                 [] => current_helds
               | c::cs => 
                    if sum_cards (c::current_helds) > goal
                    then c::current_helds
                    else play(cs, c::current_helds, tail)
    in
        score (play(card_list,[], moves), goal)
    end
```

More clearly case expression in sample solution:

``` sml
fun officiate (cards,plays,goal) =
    let 
        fun loop (current_cards,cards_left,plays_left) =
            case plays_left of
                [] => score(current_cards,goal)
              | (Discard c)::tail => 
                loop (remove_card(current_cards,c,IllegalMove),cards_left,tail)
              | Draw::tail =>
                (* note: must score immediately if go over goal! *)
                case cards_left of
                    [] => score(current_cards,goal)
                  | c::rest => if sum_cards (c::current_cards) > goal
                               then score(c::current_cards,goal)
                               else loop (c::current_cards,rest,tail)
    in 
        loop ([],cards,plays)
    end
```

### Problem 3a*

The basic idea of my `score_challenge` function is when we find the `sum` greater than the `goal`, we would find out the better socre by revalue the `Ace` cards. If we decide to revalue an `Ace` to `1`(before it is `11`), then the total `sum` decline `10`, and so on.

``` sml
fun score_challenge (held_cards, goal) =
    let
        val sum = sum_cards held_cards
        fun better_score(held_cards, sum) =
            case held_cards of
               [] => 3 * (sum - goal)
             | (the_suit, the_rank)::cs => 
                case the_rank of
                   Ace => 
                    if sum - 10 > goal
                    then better_score(cs, sum - 10)
                    else Int.min(goal - (sum - 10), 3 * (sum - goal))
                 | _ => better_score(cs, sum)
        fun pre_score(sum, goal) =
            if sum > goal
            then better_score(held_cards, sum)
            else goal - sum
    in
        if all_same_color held_cards
        then pre_score(sum, goal) div 2
        else pre_score(sum, goal)
    end
```

The `officiate_challenge` function even simpler. **Note the game-ends-if-sum-exceeds-goal rule should apply only if there is no sum that is less than or equal to the goal.** (That is, only when we find there is no `Ace` can we use to decline the sum)

Here I re-define the `card_value` caculation function and `sum_cards` function in `officiate_challenge` function.

``` sml
fun card_value_min (the_suit, the_rank)=
    case the_rank of
       Ace => 1
     | Num n => n
     | _ => 10

fun sum_cards_min cards =
    let  
        fun aux(cards, acc) =
            case cards of
               [] => acc
             | c::cs => aux(cs, card_value_min c + acc)
    in
        aux(cards, 0)
    end

fun officiate_challenge (card_list, moves, goal) =
    let
        fun play(card_list, current_helds, remain_moves) =
            case remain_moves of
               [] => current_helds
             | head::tail => case head of
                Discard c => play(card_list, remove_card(current_helds, c, IllegalMove), tail)
              | Draw => case card_list of
                 [] => current_helds
               | c::cs => 
                    if sum_cards_min (c::current_helds) > goal
                    then c::current_helds
                    else play(cs, c::current_helds, tail)
    in
        score_challenge (play(card_list,[], moves), goal)
    end
```

### Problem 3b*

The confusion in my mind before is what we should do if my held-card value is 10 points or less behind the goal? Actually, there is not a rule and it depends on ourselves. Here is the guide on Coursera:

1. If held-card value is more than 10 points behind the goal, you must draw. (It is guaranteed to be safe, make sure you understand why.)
2. **If your held-card value is 10 points or less behind the goal**, then you have a choice on your algorithm as to whether you should draw or not. **But you must ensure that you do not exceed the goal**. So you can either say "No I won't draw" or you can say "let me sneak a peak into the next card, and if it is safe to draw it then I will (which is sort of cheating, but valid from the assignment's point of view)" or something in-between. These are all valid approaches. But you must make sure that the held-card value never exceeds the goal. And you also must make sure to follow 4 below.
3. If your score is 0, you must not make any more moves.
4. If your score is not 0, but you can reach a zero by discarding a card and then drawing a card, this must be done. In order to achieve this, your algorithm will need to look ahead and see what the next card is.
5. Your code may choose to discard cards if it wants to, or do any other things it wants almost, as long as it satisfies conditions 1-4 above. So say your held-card value is 6 points behind the goal and the next card would be a 2. Then you have some leeway in what to do. You can choose to discard a card, you can choose to just stop, you can choose draw pretending you have looked ahead at that 2. (If the next card was a 5-6 though, note case 4 above.)

code:

``` sml
fun careful_player (card_list, goal) =
    let
        fun careful_moves(card_list, helds, moves) =
            let 
                fun remove_reach_zero (cards, goal) =
                    case cards of
                        [] => NONE
                      | c::cs => if sum_cards(remove_card (cards, c, IllegalMove)) = goal then SOME c
                                 else remove_reach_zero (cs, goal - card_value c)
            in
                case card_list of
                    [] => moves
                  | c::cs =>
                        if goal - sum_cards helds > 10
                        then careful_moves (cs, c::helds, moves @ [Draw])
                        else if goal = sum_cards helds
                        then moves
                        else case remove_reach_zero (c::helds, goal) of
                            NONE => if sum_cards (c::helds) > goal then moves
                                    else careful_moves(cs, c::helds, moves @ [Draw])
                          | SOME cd => moves @ [Discard cd, Draw]
            end
    in
        careful_moves(card_list, [], [])
    end
```

The critical part is the use of `remove_reach_zero` helper function. It checks if it is possible to reach a score of `0` by discarding a card followed by drawing a card and return the card should discard.