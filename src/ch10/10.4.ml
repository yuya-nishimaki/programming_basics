(* 人のデータ（名前、身長（m）、体重（kg）、誕生日（月と日）、血液型）を表す型 *)
type person_t = {
    name : string; (* 名前 *)
    height : float; (* 身長（m） *)
    weight : float; (* 体重（kg） *)
    birthday : int * int; (* 誕生日（月と日） *)
    blood_type : string; (* 血液型 *)
}

(* person_t 型のデータ例 *)
let person1 = {name = "yuya"; height = 1.68; weight = 58.; birthday = (9, 18); blood_type = "A"}
let person2 = {name = "junpei"; height = 1.77; weight = 65.; birthday = (3, 20); blood_type = "AB"}
let person3 = {name = "shusuke"; height = 1.76; weight = 65.; birthday = (10, 5); blood_type = "O"}

(* person_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* person_t list 型のデータ例 *)
let persons1 = []
let persons2 = [person1]
let persons3 = [person1; person2; person3]

(* 目的：名前昇順に整列した person_t 型のリスト persons と person_t 型のデータ person を受け取って、
        persons が名前昇順となる位置に person を挿入したリストを返す *)
(* person_insert : person_t list -> person_t -> person_t list *)
let rec person_insert persons person = match persons with 
    [] -> [person]
    | ({name = n1; height = h1; weight = w1; birthday = b1; blood_type = bt1} as first) :: rest 
        -> match person with {name = n2; height = h2; weight = w2; birthday = b2; blood_type = bt2}
            -> if n2 < n1 then person :: persons
                            else first :: person_insert rest person  

(* テスト *)
let test1 = person_insert [] person1  = [person1]
let test2 = person_insert [person1] person2 = [person2; person1]
let test3 = person_insert [person2; person1] person3 = [person2; person3; person1]

(* 目的：person_t 型のリストを受け取って、名前昇順に整列したリストを返す *)
(* person_sort : person_t list -> person_t list *)
let rec person_sort persons = match persons with
    [] -> []
    | first :: rest -> person_insert (person_sort rest) first

(* テスト *)
let test1 = person_sort persons1 = [] 
let test2 = person_sort persons2 = [person1]
let test3 = person_sort persons3 = [person2; person3; person1]