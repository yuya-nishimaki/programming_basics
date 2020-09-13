(* 鶴の足の本数 *)
let tsuru_ashi = 2

(* 亀の足の本数 *)
let kame_ashi = 4

(* 目的：鶴と亀の数の合計 x と足の合計本数 y に応じて、鶴の数を計算する *)
(* tsurukame : int -> int -> int *)
let tsurukame x y = (kame_ashi * x - y) / tsuru_ashi

(* テスト *)
let test1 = tsurukame 0 0 = 0
let test2 = tsurukame 2 6 = 1
let test3 = tsurukame 5 16 = 2