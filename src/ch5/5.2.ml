(* 目的：受け取った時間 x に応じて、午前か午後を返す *)
(* jikan: int -> string *)
let jikan x = 
    if x mod 24 < 12 then "午前"
    else "午後"

(* テスト *)
let test1 = jikan 0 = "午前"
let test2 = jikan 24 = "午前"
let test3 = jikan 12 = "午後"
let test4 = jikan 25 = "午前"
let test5 = jikan 13 = "午後"
let test6 = jikan 1 = "午前"