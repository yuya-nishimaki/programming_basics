# use "./metro.ml"
# use "./ch10/10.10.romaji_to_kanji.ml"
# use "./ch10/10.11.get_ekikan_kyori.ml"

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
