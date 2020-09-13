(* 自然数は
    - 0         0、あるいは
    - n + 1     ひとつ小さい自然数 n に 1 を加えたもの
                （n が自己参照のケース）
    という形 *) 

(* 目的：以下の漸化式で定義される数列の第 n 項を求める
        a_0 = 3
        a_n = 2a_(n-1) - 1 (n >= 1) *)
(* a : int -> int *)
let rec a n = if n = 0 then 3
                else 2 * a (n - 1) - 1

(* テスト *)
let test1 = a 0 = 3
let test2 = a 1 = 5
let test3 = a 2 = 9
