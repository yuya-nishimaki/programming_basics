(* 目的：二次方程式の係数 a, b, c の値に応じた、判別式の結果を返す *)
(* hanbetsushiki: float -> float -> float -> float *)
let hanbetsushiki a b c = b ** 2. -. 4. *. a *. c

(* テスト *)
let test1 = hanbetsushiki 0. 0. 0. = 0.
let test2 = hanbetsushiki 1. 3. 8. = -23.
let test3 = hanbetsushiki 2. 1. 0. = 1.

(* 目的：二次方程式の係数 a, b, c が与えられたとき、二次方程式が虚数解を持つか判定する *)
(* kyosuukai: float -> float -> float -> bool *)
let kyosuukai a b c = 
    if hanbetsushiki a b c < 0. then true
    else false

(* テスト *)
let test1 = kyosuukai 0. 0. 0. = false
let test2 = kyosuukai 1. 3. 8. = true
let test3 = kyosuukai 2. 1. 0. = false