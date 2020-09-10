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
let persons2 = [person1]
let persons3 = [person1; person2; person3; person4; person5]

(* 目的：person_t 型のデータリストを受け取って、各血液型の人数を組にして返す *)
(* ketsueki_shukei : person_t list -> int * int * int * int *)
let rec ketsueki_shukei persons = match persons with 
    [] -> (0, 0, 0, 0)
    | {name = n; height_m = h; weight_kg = w; birthday = (month, day); blood_type = bt} :: rest -> 
        let (a, b, o, ab) = ketsueki_shukei rest in 
            if bt = "A" then (a + 1, b, o, ab)
            else if bt = "B" then (a, b + 1, o, ab)
            else if bt = "O" then (a, b, o + 1, ab)
            else (a, b, o, ab + 1)

(* テスト *)
let test1 = ketsueki_shukei persons1 = (0, 0, 0, 0)
let test2 = ketsueki_shukei persons2 = (1, 0, 0, 0)
let test3 = ketsueki_shukei persons3 = (1, 1, 2, 1)

(* 目的：person_t 型のデータリストを受け取って、最も多かった血液型を返す *)
(* saita_ketsueki : person_t list -> string *)
let rec saita_ketsueki persons = match persons with 
    [] -> ""
    | {name = n; height_m = h; weight_kg = w; birthday = (month, day); blood_type = bt} :: rest -> 
        let (a, b, o, ab) = ketsueki_shukei persons in 
            if a >= b && a >= o && a >= ab then "A"
            else if b >= o && b >= ab then "B"
            else if o >= ab then "O"
            else "AB"

(* テスト *)
let test1 = saita_ketsueki persons1 = ""
let test2 = saita_ketsueki persons2 = "A"
let test3 = saita_ketsueki persons3 = "O"