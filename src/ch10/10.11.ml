# use "./metro.ml"

(* ekikan_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* 目的：漢字の駅名をふたつと駅間リストを受け取って、駅間リストの中からその 2 駅間の距離を返す *)
(* get_ekikan_kyori : string -> string -> ekikan_t list -> float *)
let rec get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 ekikan_list = 
    match ekikan_list with 
        [] -> infinity
        | {kiten = k1; shuten = s; keiyu = k2; kyori = k3; jikan = j} :: rest 
            -> if (kanji_ekimei1 = k1 && kanji_ekimei2 = s) 
                || (kanji_ekimei1 = s && kanji_ekimei2 = k1) then k3
                else get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 rest

(* テスト *)
let test1 = get_ekikan_kyori "代々木上原" "代々木公園" [] = infinity
let test2 = get_ekikan_kyori "代々木上原" "代々木公園" global_ekikan_list = 1.0
let test3 = get_ekikan_kyori "代々木上原" "明治神宮前" global_ekikan_list = infinity
