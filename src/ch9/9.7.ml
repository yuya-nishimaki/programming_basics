(* 人のデータ（名前、身長（m）、体重（kg）、誕生日（月と日）、血液型）を表す型 *)
type person_t = {
    name : string; (* 名前 *)
    height_m : float; (* 身長（m） *)
    weight_kg : float; (* 体重（kg） *)
    birthday : int * int; (* 誕生日（月と日） *)
    blood_type : string; (* 血液型 *)
}

(* person_t 型のデータ例 *)
let person1 = {name = "佑哉"; height_m = 1.68; weight_kg = 58.; birthday = (9, 18); blood_type = "A"}
let person2 = {name = "淳平"; height_m = 1.77; weight_kg = 65.; birthday = (3, 20); blood_type = "AB"}
let person3 = {name = "秀介"; height_m = 1.76; weight_kg = 65.; birthday = (10, 5); blood_type = "O"}

(* person_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* 目的：person_t 型のデータリスト persons を受け取って、血液型が A 型の人の数を返す *)
(* count_ketsueki_A : person_t list -> int *)
let rec count_ketsueki_A persons = match persons with
    [] -> 0
    | {name = n; height_m = h; weight_kg = w; birthday = (month, day); blood_type = bt} :: rest
        -> if bt = "A" then 1 + count_ketsueki_A rest 
                        else 0

(* テスト *)
let test1 = count_ketsueki_A [] = 0
let test2 = count_ketsueki_A [person1; person2; person3] = 1
let test3 = count_ketsueki_A [person1; person1; person3] = 2