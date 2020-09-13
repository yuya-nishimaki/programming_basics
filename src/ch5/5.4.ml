(* 目的：二次方程式の係数 a, b, c の値に応じた、判別式の結果を返す *)
(* hanbetsushiki : float -> float -> float -> float *)
let hanbetsushiki a b c = b ** 2. -. 4. *. a *. c

(* テスト *)
let test1 = hanbetsushiki 0. 0. 0. = 0.
let test2 = hanbetsushiki 1. 3. 8. = -23.
let test3 = hanbetsushiki 2. 1. 0. = 1.