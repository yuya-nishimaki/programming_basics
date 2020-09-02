(* 人のデータ（名前、身長（m）、体重（kg）、誕生日（月と日）、血液型）を表す型 *)
type person_t = {
    name : string; (* 名前 *)
    height : float; (* 身長（m） *)
    weight : float; (* 体重（kg） *)
    birthday : int * int; (* 誕生日（月と日） *)
    blood_type : string; (* 血液型 *)
}

let person1 = {name = "佑哉"; height = 1.68; weight = 58.; birthday = (9, 18); blood_type = "A"}
let person2 = {name = "淳平"; height = 1.77; weight = 65.; birthday = (3, 20); blood_type = "AB"}
let person3 = {name = "秀介"; height = 1.76; weight = 65.; birthday = (10, 5); blood_type = "O"}

let persons = person1 :: person2 :: person3 :: []