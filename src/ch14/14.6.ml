(* 学生ひとり分のデータ（名前、点数、成績）を表す型 *)
type gakusei_t = {
    namae : string;     (* 名前 *)
    tensuu : int;       (* 点数 *)
    seiseki : string;   (* 成績 *)
}

(* gakusei_t 型のデータ例 *)
let gakusei1 = {namae = "asai"; tensuu = 70; seiseki = "B"}
let gakusei2 = {namae = "kaneko"; tensuu = 85; seiseki = "A"}
let gakusei3 = {namae = "yoshida"; tensuu = 80; seiseki = "A"}

(* gakusei_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* gakusei_t list 型のデータ例 *)
let gakuseis1 = []
let gakuseis2 = [gakusei1]
let gakuseis3 = [gakusei1; gakusei2]
let gakuseis4 = [gakusei3; gakusei1; gakusei2]

(* 目的：学生リスト lst のうち成績が seiseki0 の人の数を返す *)
(* count : gakusei_t list -> string -> int *)
let count gakuseis seiseki0 =
    let is_seiseki0 first =
    match first with {namae = n; tensuu = t; seiseki = s}
    -> if s = seiseki0 then true else false
    in List.length (List.filter is_seiseki0 gakuseis)

(* テスト *)
let test1 = count gakuseis1 "A" = 0
let test2 = count gakuseis2 "B" = 1
let test3 = count gakuseis3 "A" = 1
let test4 = count gakuseis4 "A" = 2
