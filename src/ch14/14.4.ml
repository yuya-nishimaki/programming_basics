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

(* 目的：first の点数と rest _result を加える *)
(* add_tensuu : gakusei_t -> int -> int *)
let add_tensuu first rest_result = match first with {namae = n; tensuu = t; seiseki = s}
    -> t + rest_result

(* 目的：gakusei_t 型のリストを受け取っって、全員の得点の合計を返す *)
(* gakusei_sum : gakusei_t list -> int *)
let gakusei_sum gakuseis = List.fold_right add_tensuu gakuseis 0

(* gakusei_sum テスト *)
let test1 = gakusei_sum gakuseis1 = 0
let test2 = gakusei_sum gakuseis2 = 70
let test3 = gakusei_sum gakuseis3 = 155
let test4 = gakusei_sum gakuseis4 = 235
