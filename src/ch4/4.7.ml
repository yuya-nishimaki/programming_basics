(* 鶴の足の本数 *)
let tsuru_ashi = 2

(* 目的：鶴の数 x 羽に応じた足の合計本数を計算する *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi x = x * tsuru_ashi

(* テスト *)
let test1 = tsuru_no_ashi 0 = 0
let test2 = tsuru_no_ashi 2 = 4
let test3 = tsuru_no_ashi 5 = 10

(* 亀の足の本数 *)
let kame_ashi = 4

(* 目的：亀の数 x 匹に応じた足の合計本数を計算する *)
(* kame_no_ashi : int -> int *)
let kame_no_ashi x = x * kame_ashi

(* テスト *)
let test1 = kame_no_ashi 0 = 0
let test2 = kame_no_ashi 2 = 8
let test3 = kame_no_ashi 5 = 20

(* 目的：鶴の数 tsuru 羽と亀の数 kame 匹に応じた、鶴と亀の足の合計本数を計算する *)
(* tsurukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi tsuru kame = tsuru_no_ashi tsuru + kame_no_ashi kame

(* テスト *)
let test1 = tsurukame_no_ashi 0 0 = 0
let test2 = tsurukame_no_ashi 1 1 = 6
let test3 = tsurukame_no_ashi 2 3 = 16