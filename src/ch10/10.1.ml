(* int list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* 目的：昇順に並べられた整数のリスト lst と整数 n を受け取って、lst が昇順となる位置に n を挿入したリストを返す *)
(* insert : int list -> int -> int list *)
let rec insert lst n = match lst with 
    [] -> [n]
    | first :: rest -> if n < first then n :: lst
                                    else first :: (insert rest n)

(* テスト *)
let test1 = insert [] 1 = [1]
let test2 = insert [1; 3; 4] 2 = [1; 2; 3; 4]
let test3 = insert [3; 10; 12] 9 = [3; 9; 10; 12]