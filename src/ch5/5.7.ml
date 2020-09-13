(* 目的：身長 shintyo_m と体重 taiju_kg が与えられたときの BMI を返す *)
(* bmi : float -> float -> float *)
let bmi shintyo_m taiju_kg = taiju_kg /. (shintyo_m ** 2.)

(* テスト *)
let test1 = bmi 1.7 50. = 17.3010380622837374
let test2 = bmi 1.68 60. = 21.2585034013605458
let test3 = bmi 1.7 75. = 25.9515570934256097
let test4 = bmi 1.5 80. = 35.5555555555555571

(* 目的：身長 shintyo_m と体重 taiju_kg が与えられたときの体型を返す *)
(* taikei : float -> float -> string *)
let taikei shintyo_m taiju_kg = 
    if bmi shintyo_m taiju_kg < 18.5 then "やせ"
    else if bmi shintyo_m taiju_kg < 25. then "標準"
    else if bmi shintyo_m taiju_kg < 30. then "肥満"
    else "高度肥満"

(* テスト *)
let test1 = taikei 1.7 50. = "やせ"
let test2 = taikei 1.68 60. = "標準"
let test3 = taikei 1.7 75. = "肥満"
let test4 = taikei 1.5 80. = "高度肥満"