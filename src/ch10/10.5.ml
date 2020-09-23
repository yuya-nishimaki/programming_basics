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

(* 目的：gakusei_t 型のデータ gakusei1 と gakusei2 を受け取って、
        gakusei1 の tensuu が gakusei2 より高ければ true、低ければ false を返す *)
(* is_greater : gakusei_t -> gakusei_t -> bool *)
let is_greater gakusei1 gakusei2 = match gakusei1 with {namae = n1; tensuu = t1; seiseki = s1}
    -> match gakusei2 with {namae = n2; tensuu = t2; seiseki = s2}
        -> if t1 > t2 then true else false

(* テスト *)
let test1 = is_greater gakusei1 gakusei2 = false
let test2 = is_greater gakusei2 gakusei3 = true
let test3 = is_greater gakusei3 gakusei1 = true

(* 目的：gakusei_t 型のリストを受け取って、最高得点を取った人のレコードを返す *)
(* gakusei_max : gakusei_t list -> gakusei_t *)
let rec gakusei_max lst = match lst with
    [] -> {namae = ""; tensuu = min_int; seiseki = ""}
    | ({namae = n1; tensuu = t1; seiseki = s1} as first) :: rest
        -> if is_greater first (gakusei_max rest) then first else gakusei_max rest

(* テスト *)
let test1 = gakusei_max gakuseis1 = {namae = ""; tensuu = min_int; seiseki = ""}
let test2 = gakusei_max gakuseis2 = gakusei1
let test3 = gakusei_max gakuseis3 = gakusei2
let test4 = gakusei_max gakuseis4 = gakusei2