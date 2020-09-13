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
let person4 = {name = "真一"; height_m = 1.86; weight_kg = 83.; birthday = (8, 23); blood_type = "O"}

(* person_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* 8 月の最終日 *)
let aug_last_day = 31

(* 目的：person_t 型のデータリスト persons を受け取って、乙女座の人の名前のみからなるリストを返す *)
(* otomeza : person_t list -> string list *)
let rec otomeza persons = match persons with
    [] -> []
    | {name = n; height_m = h; weight_kg = w; birthday = (month, day); blood_type = bt} :: rest
        -> if (month = 8 && day >= 23 && day <= aug_last_day) 
            || (month = 9 && day >= 1 && day <= 22) then n :: otomeza rest
                                                    else otomeza rest

(* テスト *)
let test1 = otomeza [] = []
let test2 = otomeza [person1; person2; person3] = ["佑哉"]
let test3 = otomeza [person1; person1; person3] = ["佑哉"; "佑哉"]