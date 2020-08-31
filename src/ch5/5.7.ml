(* 目的：身長 shintyo と体重 taiju が与えられたときの BMI を返す *)
(* float -> float -> float *)
let bmi shintyo taiju = taiju /. (shintyo ** 2.)

(* 目的：身長 shintyo と体重 taiju が与えられたときの体型を返す *)
(* float -> float -> string *)
let taikei shintyo taiju = 
    if bmi shintyo taiju < 18.5 then "やせ"
    else if bmi shintyo taiju < 25. then "標準"
    else if bmi shintyo taiju < 30. then "肥満"
    else "高度肥満"

(* テスト *)
let test1 = taikei 1.7 50. = "やせ"
let test2 = taikei 1.68 60. = "標準"
let test3 = taikei 1.7 75. = "肥満"
let test4 = taikei 1.5 80. = "高度肥満"