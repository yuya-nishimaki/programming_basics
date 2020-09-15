(* 人のデータ（名前、身長（m）、体重（kg）、誕生日（月と日）、血液型）を表す型 *)
type person_t = {
    name : string; (* 名前 *)
    height_m : float; (* 身長（m） *)
    weight_kg : float; (* 体重（kg） *)
    birthday : int * int; (* 誕生日（月と日） *)
    blood_type : string; (* 血液型 *)
}

(* person_t 型のデータ例 *)
let person1 = {name = "yuya"; height_m = 1.68; weight_kg = 58.; birthday = (9, 18); blood_type = "A"}
let person2 = {name = "junpei"; height_m = 1.77; weight_kg = 65.; birthday = (3, 20); blood_type = "AB"}
let person3 = {name = "shusuke"; height_m = 1.76; weight_kg = 65.; birthday = (10, 5); blood_type = "O"}
let person4 = {name = "atsuhiro"; height_m = 1.65; weight_kg = 51.; birthday = (5, 27); blood_type = "O"}
let person5 = {name = "ryuichi"; height_m = 1.87; weight_kg = 80.; birthday = (11, 6); blood_type = "B"}

(* person_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* person_t list 型のデータ例 *)
let persons1 = []
let persons2 = [person1; person2; person3; person4; person5]

(* 各血液型 *)
let blood_type_A = "A"
let blood_type_B = "B"
let blood_type_O = "O"
let blood_type_AB = "AB"

(* 目的：person_t 型のリストのうち、対象の血液型の人の数を返す *)
(* count_ketsueki : person_t list -> string -> int *)
let rec count_ketsueki persons arg_blood_type = match persons with
    [] -> 0
    | {name = n; height_m = h; weight_kg = w; birthday = (month, day); blood_type = bt} :: rest
        -> let count = count_ketsueki rest arg_blood_type in
            if bt = arg_blood_type then 1 + count else count

(* 目的：person_t 型のリストのうち、A 型の人の数を返す *)
(* count_ketsueki_A : person_t list -> int *)
let count_ketsueki_A persons = count_ketsueki persons blood_type_A

(* 目的：person_t 型のリストのうち、B 型の人の数を返す *)
(* count_ketsueki_B : person_t list -> int *)
let count_ketsueki_B persons = count_ketsueki persons blood_type_B

(* 目的：person_t 型のリストのうち、O 型の人の数を返す *)
(* count_ketsueki_O : person_t list -> int *)
let count_ketsueki_O persons = count_ketsueki persons blood_type_O

(* 目的：person_t 型のリストのうち、AB 型の人の数を返す *)
(* count_ketsueki_AB : person_t list -> int *)
let count_ketsueki_AB persons = count_ketsueki persons blood_type_AB

(* count_ketsueki のテスト *)
let test1 = count_ketsueki persons1 blood_type_A = 0
let test2 = count_ketsueki persons2 blood_type_A = 1
let test3 = count_ketsueki persons2 blood_type_B = 1
let test4 = count_ketsueki persons2 blood_type_O = 2
let test5 = count_ketsueki persons2 blood_type_AB = 1

(* count_ketsueki_A のテスト *)
let test6 = count_ketsueki_A persons1 = 0
let test7 = count_ketsueki_A persons2 = 1

(* count_ketsueki_B のテスト *)
let test8 = count_ketsueki_B persons1 = 0
let test9 = count_ketsueki_B persons2 = 1

(* count_ketsueki_O のテスト *)
let test10 = count_ketsueki_O persons1 = 0
let test11 = count_ketsueki_O persons2 = 2

(* count_ketsueki_AB のテスト *)
let test12 = count_ketsueki_AB persons1 = 0
let test13 = count_ketsueki_AB persons2 = 1
