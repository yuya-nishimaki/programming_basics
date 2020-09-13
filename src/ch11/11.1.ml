(* 自然数は
    - 0         0、あるいは
    - n + 1     ひとつ小さい自然数 n に 1 を加えたもの
                （n が自己参照のケース）
    という形 *) 

(* 目的：自然数 m と n を受け取ったら m の n 乗を求める *)
(* power : int -> int -> int *)
let rec power m n = if n = 0 then 1
                    else m * power m (n - 1)

(* テスト *)
let test1 = power 3 0 = 1
let test2 = power 3 1 = 3
let test3 = power 3 2 = 9
let test4 = power 3 3 = 27

(* 目的：0 から受け取った自然数までの 2 乗の和を求める *)
(* sum_of_square : int -> int *)
let rec sum_of_square num = if num = 0 then 0
                            else power num 2 + sum_of_square (num - 1)

(* テスト *)
let test1 = sum_of_square 0 = 0
let test2 = sum_of_square 1 = 1
let test3 = sum_of_square 4 = 30
