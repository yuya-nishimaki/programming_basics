type person_t = {
    name : string;
    height_m : float;
    weight_kg : float;
    birthday : int * int;
    blood_type : string;
}

let person1 = {name = "佑哉"; height_m = 1.68; weight_kg = 58.; birthday = (9, 18); blood_type = "A"}
let person2 = {name = "淳平"; height_m = 1.77; weight_kg = 65.; birthday = (3, 20); blood_type = "AB"}
let person3 = {name = "秀介"; height_m = 1.76; weight_kg = 65.; birthday = (10, 5); blood_type = "O"}