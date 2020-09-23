(* 目的：整数 n が偶数かどうかを調べる *)
(* is_even : int -> bool *)
let is_even n = if n mod 2 = 0 then true else false

(* 目的：受け取った整数リストの中の偶数の要素のみを含むリストを返す *)
(* even : int list -> int list *)
let rec even lst = List.filter is_even lst

(* テスト *)
let test1 = even [] = []
let test2 = even [1; 4; 2] = [4; 2]
let test3 = even [1; 1; 9] = []
let test4 = even [2; 5; 8; 10] = [2; 8; 10]
