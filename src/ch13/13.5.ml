(* 目的：受け取った関数を 2 回実行する関数を返す *)
(* twice : ('a -> 'a) -> 'a -> 'a *)
let twice f = let g x = f (f x) in g

(* 目的：受け取った関数を 4 回実行する関数を返す *)
(* double_twice : ('_weak2 -> '_weak2) -> '_weak2 -> '_weak2 *)
let double_twice = twice twice

(* 目的：受け取った整数に 3 を足した値を返す *)
(* add3 : int -> int *)
let add3 x = x + 3

(* add3 テスト *)
let test1 = add3 3 = 6
let test2 = add3 9 = 12
let test3 = add3 10 = 13

(* twice テスト *)
let test4 = twice add3 3 = 9
let test5 = twice add3 10 = 16
let test6 = twice add3 1 = 7

(* テスト *)
let test4 = double_twice add3 3 = 15
let test5 = double_twice add3 10 = 22
let test6 = double_twice add3 1 = 13
