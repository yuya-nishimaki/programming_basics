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

(* 目的：tensuu 降順に整列した gakusei_t 型のリスト gakuseis と gakusei_t 型のデータ gakusei を受け取って、
        gakuseis が tensuu 降順となる位置に gakusei を挿入したリストを返す *)
(* gakusei_insert : gakusei_t list -> gakusei_t -> gakusei_t list *)
let rec gakusei_insert gakuseis gakusei = match gakuseis with 
    [] -> [gakusei]
    | ({namae = n1; tensuu = t1; seiseki = s1} as first) :: rest 
        -> match gakusei with {namae = n2; tensuu = t2; seiseki = s2}
            -> if t2 > t1 then gakusei :: gakuseis
                            else first :: gakusei_insert rest gakusei  

(* テスト *)
let test1 = gakusei_insert [] gakusei1  = [gakusei1]
let test2 = gakusei_insert [gakusei1] gakusei2 = [gakusei2; gakusei1]
let test3 = gakusei_insert [gakusei2; gakusei1] gakusei3 = [gakusei2; gakusei3; gakusei1]

(* 目的：gakusei_t 型のリストを受け取って、tesuu 降順に整列したリストを返す *)
(* gakusei_sort : gakusei_t list -> gakusei_t list *)
let rec gakusei_sort gakuseis = match gakuseis with
    [] -> []
    | first :: rest -> gakusei_insert (gakusei_sort rest) first

(* テスト *)
let test1 = gakusei_sort gakuseis1 = []
let test2 = gakusei_sort gakuseis2 = [gakusei1]
let test3 = gakusei_sort gakuseis3 = [gakusei2; gakusei1]
let test4 = gakusei_sort gakuseis4 = [gakusei2; gakusei3; gakusei1]