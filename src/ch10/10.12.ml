# use "./metro.ml"

(* ekimei_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* 目的：ローマ字の駅名と駅名リストを受け取って、その駅の漢字表記を返す *)
(* romaji_to_kanji : string -> ekimei_t list -> string *)
let rec romaji_to_kanji romaji_ekimei ekimei_list = match ekimei_list with 
    [] -> ""
    | {kanji = k1; kana = k2; romaji = r; shozoku = s} :: rest -> 
        if romaji_ekimei = r then k1
        else romaji_to_kanji romaji_ekimei rest

(* テスト *)
let test1 = romaji_to_kanji "yoyogiuehara" [] = ""
let test2 = romaji_to_kanji "osaka" global_ekimei_list = ""
let test3 = romaji_to_kanji "meijijinguumae" global_ekimei_list = "明治神宮前"

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

(* メッセージの形式にフォーマットする *)
let eki_not_exist_msg ekimei = ekimei ^ " という駅は存在しません"
let eki_not_connect_msg kiten shuten = kiten ^ "駅と" ^ shuten ^ "駅はつながっていません"
let ekikan_msg kiten shuten kyori = kiten ^ "駅から" ^ shuten ^ "駅までは " ^ string_of_float kyori ^ " km です"

(* 目的：ローマ字の駅名をふたつ受け取って、その間の距離を調べ、
        直接つながっている場合は「A 駅から B 駅までは ○ km です」と返し、
        つながっていない場合は「A 駅と B 駅はつながっていません」と返し、
        入力された駅名が存在しない場合は「〜という駅は存在しません」と返す *)
(* kyori_wo_hyoji : string -> string -> string *)
let kyori_wo_hyoji romaji_ekimei1 romaji_ekimei2 = 
    let kanji_ekimei1 = romaji_to_kanji romaji_ekimei1 global_ekimei_list in
        let kanji_ekimei2 = romaji_to_kanji romaji_ekimei2 global_ekimei_list in
            if kanji_ekimei1 = "" then eki_not_exist_msg romaji_ekimei1
            else if kanji_ekimei2 = "" then eki_not_exist_msg romaji_ekimei2
            else let kyori = get_ekikan_kyori kanji_ekimei1 kanji_ekimei2 global_ekikan_list in 
                if kyori = infinity then eki_not_connect_msg kanji_ekimei1 kanji_ekimei2
                else ekikan_msg kanji_ekimei1 kanji_ekimei2 kyori

(* テスト *)
let test1 = kyori_wo_hyoji "yoyogiuehara" "yoyogikouen" = "代々木上原駅から代々木公園駅までは 1. km です"
let test2 = kyori_wo_hyoji "yoyogiuehara" "meijijinguumae" = "代々木上原駅と明治神宮前駅はつながっていません"
let test3 = kyori_wo_hyoji "kyoto" "yoyogiuehara" = "kyoto という駅は存在しません"
let test4 = kyori_wo_hyoji "yoyogiuehara" "osaka" = "osaka という駅は存在しません"
