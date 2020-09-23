(* int list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* 目的：受け取った整数リストの中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even lst = match lst with
    [] -> []
    | first :: rest -> if first mod 2 = 0 then first :: even rest
                        else even rest

(* テスト *)
let test1 = even [] = []
let test2 = even [1; 4; 2] = [4; 2]
let test3 = even [1; 1; 9] = []
let test4 = even [2; 5; 8; 10] = [2; 8; 10]
