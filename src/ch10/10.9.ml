(* 目的：二つのリストを受け取って、それらの長さが同じかどうかを返す *)
(* equal_length : a list -> a list -> bool *)
let equal_length lst1 lst2 = match (lst1, lst2) with
    ([], []) -> true
    | ([], first2 :: rest2) -> false
    | (first1 :: rest1, []) -> false
    | (first1 :: rest1, first2 :: rest2) -> equal_length rest1 rest2

(* テスト *)
let test1 = equal_length [] [] = true
let test2 = equal_length [] [2; 3] = false
let test3 = equal_length [1; 3] [] = false
let test4 = equal_length [2; 5; 10] [1; 3; 5] = true
let test5 = equal_length [2; 5; 10] [1; 2; 3; 5] = false