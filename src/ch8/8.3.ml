type person_t = {
    name : string;
    height : float;
    weight : float;
    birthday : int * int;
    blood_type : string;
}

let person1 = {name = "佑哉"; height = 1.68; weight = 58.; birthday = (9, 18); blood_type = "A"}
let person2 = {name = "淳平"; height = 1.77; weight = 65.; birthday = (3, 20); blood_type = "AB"}
let person3 = {name = "秀介"; height = 1.76; weight = 65.; birthday = (10, 5); blood_type = "O"}