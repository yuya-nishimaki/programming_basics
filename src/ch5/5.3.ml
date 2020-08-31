(* 各月の最終日（うるう年は考慮しない） *)
let jan_last_day = 31
let feb_last_day = 28
let mar_last_day = 31
let apr_last_day = 30
let may_last_day = 31
let june_last_day = 30
let july_last_day = 31
let aug_last_day = 31
let sep_last_day = 30
let oct_last_day = 31
let nov_last_day = 30
let dec_last_day = 31

(* 目的：受け取った誕生日（月 month と日 day）に応じて、星座を返す *)
(* seiza: int -> int -> string *)
let seiza month day = 
    if (month = 1 && day >= 20 && day <= jan_last_day) 
        || (month = 2 && day >= 1 && day <= 18) then "みずがめ座"
    else if (month = 2 && day >= 19 && day <= feb_last_day) 
        || (month = 3 && day >= 1 && day <= 20) then "うお座"
    else if (month = 3 && day >= 21 && day <= mar_last_day) 
        || (month = 4 && day >= 1 && day <= 19) then "おひつじ座"
    else if (month = 4 && day >= 20 && day <= apr_last_day) 
        || (month = 5 && day >= 1 && day <= 20) then "おうし座"
    else if (month = 5 && day >= 21 && day <= may_last_day) 
        || (month = 6 && day >= 1 && day <= 21) then "ふたご座"
    else if (month = 6 && day >= 22 && day <= june_last_day) 
        || (month = 7 && day >= 1 && day <= 22) then "かに座"
    else if (month = 7 && day >= 23 && day <= july_last_day) 
        || (month = 8 && day >= 1 && day <= 22) then "しし座"
    else if (month = 8 && day >= 23 && day <= aug_last_day) 
        || (month = 9 && day >= 1 && day <= 22) then "おとめ座"
    else if (month = 9 && day >= 23 && day <= sep_last_day) 
        || (month = 10 && day >= 1 && day <= 23) then "てんびん座"
    else if (month = 10 && day >= 24 && day <= oct_last_day) 
        || (month = 11 && day >= 1 && day <= 22) then "さそり座"
    else if (month = 11 && day >= 23 && day <= nov_last_day) 
        || (month = 12 && day >= 1 && day <= 21) then "いて座"
    else if (month = 12 && day >= 22 && day <= dec_last_day) 
        || (month = 1 && day >= 1 && day <= 19) then "やぎ座"
    else "正しい月日を入力してください。"

(* テスト *)
let test1 = seiza 3 21 = "おひつじ座"
let test2 = seiza 4 19 = "おひつじ座"
let test3 = seiza 4 20 = "おうし座"
let test4 = seiza 5 20 = "おうし座"
let test5 = seiza 5 21 = "ふたご座"
let test6 = seiza 6 21 = "ふたご座"
let test7 = seiza 6 22 = "かに座"
let test8 = seiza 7 22 = "かに座"
let test9 = seiza 7 23 = "しし座"
let test10 = seiza 8 22 = "しし座"
let test11 = seiza 8 23 = "おとめ座"
let test12 = seiza 9 22 = "おとめ座"
let test13 = seiza 9 23 = "てんびん座"
let test14 = seiza 10 23 = "てんびん座"
let test15 = seiza 10 24 = "さそり座"
let test16 = seiza 11 22 = "さそり座"
let test17 = seiza 11 23 = "いて座"
let test18 = seiza 12 21 = "いて座"
let test19 = seiza 12 22 = "やぎ座"
let test20 = seiza 1 19 = "やぎ座"
let test21 = seiza 1 20 = "みずがめ座"
let test22 = seiza 2 18 = "みずがめ座"
let test23 = seiza 2 19 = "うお座"
let test24 = seiza 3 20 = "うお座"