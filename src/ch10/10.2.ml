#use "ch10/10.1.ml"

(* 目的：整数のリスト lst を昇順に整列したリストを返す *)
(* ins_sort : int list -> int list *)
let rec ins_sort lst = match lst with
    [] -> []
    | first :: rest -> insert (ins_sort rest) first

(* テスト *)
let test1 = ins_sort [] = []
let test2 = ins_sort [1; 9; 3] = [1; 3; 9]
let test3 = ins_sort [10; 3; 2] = [2; 3; 10]