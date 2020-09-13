(* 目的：名前と成績の組から、「○○さんの評価は△です」という文字列を返す *)
(* seiseki : string * string -> string *)
let seiseki pair = match pair with
    (name, score) -> name ^ "さんの評価は" ^ score ^ "です"

(* テスト *)
let test1 = seiseki ("太郎", "0") = "太郎さんの評価は0です"
let test2 = seiseki ("ユースケ", "80") = "ユースケさんの評価は80です"
let test3 = seiseki ("津田", "30") = "津田さんの評価は30です"