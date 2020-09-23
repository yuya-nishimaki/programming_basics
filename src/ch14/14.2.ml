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

(* 目的：gakusei_t 型のデータを受け取って、成績が A かどうかを調べる *)
(* is_seiseki_A : gakusei_t -> bool *)
let is_seiseki_A gakusei = match gakusei with {namae = n; tensuu = t; seiseki = s}
    -> if s = "A" then true else false

(* 目的：学生リストのうち成績が A の人の数を返す *)
(* count_A : gakusei_t list -> int *)
let count_A gakuseis = List.length (List.filter is_seiseki_A gakuseis)

(* テスト *)
let test3 = count_A gakuseis1 = 0
let test4 = count_A gakuseis2 = 0
let test5 = count_A gakuseis3 = 1
let test6 = count_A gakuseis4 = 2
