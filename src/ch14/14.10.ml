(* 14.1 *)
(* 目的：受け取った整数リストの中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even lst =
    List.filter (fun n -> if n mod 2 = 0 then true else false) lst

(* even テスト *)
let test1 = even [] = []
let test2 = even [1; 4; 2] = [4; 2]
let test3 = even [1; 1; 9] = []
let test4 = even [2; 5; 8; 10] = [2; 8; 10]


(* 14.2 *)
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


(* 目的：学生リストのうち成績が A の人の数を返す *)
(* count_A : gakusei_t list -> int *)
let count_A gakuseis =
    List.length (List.filter
    (fun gakusei -> match gakusei with {namae = n; tensuu = t; seiseki = s}
        -> if s = "A" then true else false) gakuseis)

(* count_A テスト *)
let test5 = count_A gakuseis1 = 0
let test6 = count_A gakuseis2 = 0
let test7 = count_A gakuseis3 = 1
let test8 = count_A gakuseis4 = 2


(* 14.3 *)
(* 目的：文字列のリストを受け取って、その中の要素を前から順に全部、くっつけた文字列を返す *)
(* concat : string list -> string *)
let concat lst =
        List.fold_right (fun first rest_result -> first ^ rest_result) lst ""

(* concat テスト *)
let test9 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let test10 = concat [] = ""
let test11 = concat ["ocaml"] = "ocaml"


(* 14.4 *)
(* 目的：gakusei_t 型のリストを受け取っって、全員の得点の合計を返す *)
(* gakusei_sum : gakusei_t list -> int *)
let gakusei_sum gakuseis =
    List.fold_right
    (fun first rest_result -> match first with {namae = n; tensuu = t; seiseki = s}
        -> t + rest_result) gakuseis 0

(* gakusei_sum テスト *)
let test12 = gakusei_sum gakuseis1 = 0
let test13 = gakusei_sum gakuseis2 = 70
let test14 = gakusei_sum gakuseis3 = 155
let test15 = gakusei_sum gakuseis4 = 235
