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
