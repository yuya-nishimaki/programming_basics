(* 目的：n から 1 までのリストを作る *)
(* enumerate : int -> int list *)
let rec enumerate n = if n <= 0 then [] else n :: enumerate (n - 1)

(* 目的：受け取った整数の階乗を求める *)
(* fac : int -> int *)
let fac n = List.fold_right ( * ) (enumerate n) 1

(* テスト *)
let test1 = fac 0 = 1
let test2 = fac 1 = 1
let test3 = fac 5 = 120
