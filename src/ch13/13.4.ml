(* 目的：受け取った整数を 2 倍した値を返す *)
(* time2 : int -> int *)
let time2 x = 2 * x

(* 目的：受け取った整数に 3 を足した値を返す *)
(* add3 : int -> int *)
let add3 x = x + 3

(* 目的：関数を二つ受け取って、その二つの関数を合成した関数を返す *)
(* compose :  ('a -> 'b) -> ('c -> 'a) -> 'c -> 'b *)
let compose func1 func2 = let g x = func1 (func2 x) in g

(* time2 テスト *)
let test1 = time2 2 = 4
let test2 = time2 5 = 10
let test3 = time2 15 = 30

(* add3 テスト *)
let test4 = add3 3 = 6
let test5 = add3 9 = 12
let test6 = add3 10 = 13

(* compose テスト *)
let test7 = compose time2 add3 4 = 14
let test8 = compose add3 time2 4 = 11
