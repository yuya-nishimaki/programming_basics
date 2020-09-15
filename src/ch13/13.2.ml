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

(* 目的：person_t 型のデータを受け取って、人の名前を返す *)
(* get_namae : person_t -> string *)
let get_namae person = match person with
    {name = n; height_m = h; weight_kg = w; birthday = (month, day); blood_type = bt} -> n

(* 目的：person_t 型のリストを受け取って、その中に出てくる人の名前のリストを返す *)
(* person_namae : person_t list -> string list *)
let rec person_namae persons = List.map get_namae persons

(* get_namae テスト *)
let test1 = get_namae person1 = "yuya"

(* person_namae テスト *)
let test2 = person_namae persons1 = []
let test3 = person_namae persons2 = ["yuya"; "junpei"; "shusuke"; "atsuhiro"; "ryuichi"]
