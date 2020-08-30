(* 鶴の足の本数 *)
let tsuru_ashi = 2

(* 目的：鶴の数 x 羽に応じた足の合計本数を計算する *)
(* tsuru_no_ashi: int -> int *)
let tsuru_no_ashi x = x * tsuru_ashi

(* 亀の足の本数 *)
let kame_ashi = 4

(* 目的：亀の数 x 匹に応じた足の合計本数を計算する *)
(* kame_no_ashi: int -> int *)
let kame_no_ashi x = x * kame_ashi

(* 目的：鶴の数 x 羽と亀の数 y 匹に応じた、鶴と亀の足の合計本数を計算する *)
(* int -> int -> int *)
let tsurukame_no_ashi x y = tsuru_no_ashi x + kame_no_ashi y

(* テスト *)
let test1 = tsurukame_no_ashi 0 0 = 0
let test2 = tsurukame_no_ashi 1 1 = 6
let test3 = tsurukame_no_ashi 2 3 = 16