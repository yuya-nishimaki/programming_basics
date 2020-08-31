(* 目的：二次方程式の係数 a, b, c の値に応じた、判別式の結果を返す *)
(* hanbetsushiki: float -> float -> float -> float *)
let hanbetsushiki a b c = b ** 2. -. 4. *. a *. c

(* テスト *)
let test1 = hanbetsushiki 0. 0. 0. = 0.
let test2 = hanbetsushiki 1. 3. 8. = -23.
let test3 = hanbetsushiki 2. 1. 0. = 1.

(* 目的：二次方程式の係数 a, b, c の値に応じた、解の個数を返す *)
(* kai_no_kosuu: float -> float -> float -> int *)
let kai_no_kosuu a b c = 
    if hanbetsushiki a b c > 0. then 2
    else if hanbetsushiki a b c = 0. then 1
    else 0

(* テスト *)
let test1 = kai_no_kosuu 0. 0. 0. = 1
let test2 = kai_no_kosuu 1. 3. 8. = 0
let test3 = kai_no_kosuu 2. 1. 0. = 2