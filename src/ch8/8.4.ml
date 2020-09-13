(* 人のデータ（名前、身長（m）、体重（kg）、誕生日（月と日）、血液型）を表す型 *)
type person_t = {
    name : string; (* 名前 *)
    height_m : float; (* 身長（m） *)
    weight_kg : float; (* 体重（kg） *)
    birthday : int * int; (* 誕生日（月と日） *)
    blood_type : string; (* 血液型 *)
}

(* 目的：person_t 型のデータを受け取って、「○○さんの血液型は△型です」という文字列を返す *)
(* ketsueki_hyoji : person_t -> string *)
let ketsueki_hyoji person = match person with 
    {name = n; height_m = h; weight_kg = w; birthday = b; blood_type = bt} ->
        n ^ "さんの血液型は" ^ bt ^ "型です"

(* テスト *)
let person1 = {name = "佑哉"; height_m = 1.68; weight_kg = 58.; birthday = (9, 18); blood_type = "A"}
let person2 = {name = "淳平"; height_m = 1.77; weight_kg = 65.; birthday = (3, 20); blood_type = "AB"}
let person3 = {name = "秀介"; height_m = 1.76; weight_kg = 65.; birthday = (10, 5); blood_type = "O"}
let test1 = ketsueki_hyoji person1 = "佑哉さんの血液型はA型です"
let test2 = ketsueki_hyoji person2 = "淳平さんの血液型はAB型です"
let test3 = ketsueki_hyoji person3 = "秀介さんの血液型はO型です"