(* 目的：国語、数学、英語、理科、社会の点数を与えられたとき、その合計点と平均点を組にして返す *)
(* goukei_to_heikin : float -> float -> float -> float -> float -> float * float *)
let goukei_to_heikin kokugo sugaku eigo rika shakai = 
    (kokugo +. sugaku +. eigo +. rika +. shakai, (kokugo +. sugaku +. eigo +. rika +. shakai) /. 5.)

(* テスト *)
let test1 = goukei_to_heikin 2. 3. 10. 8. 9. = (32., 6.4)
let test2 = goukei_to_heikin 1. 5. 8. 9. 3. = (26., 5.2)
let test3 = goukei_to_heikin 9. 9. 1. 3. 2. = (24., 4.8)