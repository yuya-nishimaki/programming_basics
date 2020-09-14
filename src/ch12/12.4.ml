# use "./metro.ml"

(* ekimei_t 型のデータ例 *)
let ekimei1 = {kanji="東京"; kana="とうきょう"; romaji="tokyo"; shozoku="丸ノ内線"}
let ekimei2 = {kanji="茗荷谷"; kana="みょうがだに"; romaji="myogadani"; shozoku="丸ノ内線"}
let ekimei3 = {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="丸ノ内線"}
let ekimei4 = {kanji="池袋"; kana="いけぶくろ"; romaji="ikebukuro"; shozoku="有楽町線"}

(* ekimei_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* ekimei_t list 型のデータ例 *)
let ekimeis1 = []
let ekimeis2 = [ekimei1; ekimei2; ekimei3]
let ekimeis3 = [ekimei1; ekimei2; ekimei3; ekimei4]

(* ひらがな順に整列した ekimei_t list 型のデータ例 *)
let sorted_ekimeis1 = []
let sorted_ekimeis2 = [ekimei3; ekimei1; ekimei2]
let sorted_ekimeis3 = [ekimei4; ekimei3; ekimei1; ekimei2]

(* 駅の重複を取り除き、ひらがな順に整列した ekimei_t list 型のデータ例 *)
let unique_sorted_ekimeis1 = []
let unique_sorted_ekimeis2 = [ekimei2; ekimei1; ekimei3]
let unique_sorted_ekimeis3 = [ekimei2; ekimei1; ekimei4]

(* 目的：ひらがな順に整列した ekimei_t 型のリストと ekimei_t 型のデータを受け取って、
        リストがひらがな順となる位置にデータを挿入したリストを返す *)
(* ekimei_insert : ekimei_t list -> ekimei_t -> ekimei_t list *)
let rec ekimei_insert ekimeis ekimei = match ekimeis with
    [] -> [ekimei]
    | ({kanji = kanji1; kana = kana1; romaji = r1; shozoku = s1} as first) :: rest ->
        match ekimei with {kanji = kanji2; kana = kana2; romaji = r2; shozoku = s2} ->
            if kana2 < kana1 then ekimei :: ekimeis
            else first :: ekimei_insert rest ekimei

(* 目的：ekimei_t 型のリストを受け取って、ひらがな順に整列したリストを返す *)
(* ekimei_sort : ekimei_t list -> ekimei_t list *)
let rec ekimei_sort ekimeis = match ekimeis with
    [] -> []
    | first :: rest -> ekimei_insert (ekimei_sort rest) first

(* 目的：ひらがな順に整列した ekimei_t 型のリストを受け取って、駅の重複を取り除いた ekimei_t 型のリストを返す *)
(* ekimei_unique : ekimei_t list -> ekimei_t list -> ekimei_t list *)
let rec ekimei_unique sorted_ekimeis unique_sorted_ekimeis =
    match (sorted_ekimeis, unique_sorted_ekimeis) with
        ([], []) -> []
        | ([], first2 :: rest2) -> unique_sorted_ekimeis
        | (first1 :: rest1, []) -> ekimei_unique rest1 [first1]
        | (first1 :: rest1, first2 :: rest2) ->
            match first1 with {kanji = kanji1; kana = kana1; romaji = r1; shozoku = s1} ->
                match first2 with {kanji = kanji2; kana = kana2; romaji = r2; shozoku = s2} ->
                    if kana1 = kana2 then ekimei_unique rest1 unique_sorted_ekimeis
                    else ekimei_unique rest1 (first1 :: unique_sorted_ekimeis)

(* 目的：ekimei_t 型のリストを受け取って、
        ひらがな順に整列し、駅の重複を取り除いた ekimei_t 型のリストを返す *)
(* seiretsu : ekimei_t list -> ekimei_t list *)
let seiretsu ekimeis = ekimei_unique (ekimei_sort ekimeis) []

(* ekimei_insert のテスト *)
let test1 = ekimei_insert [] ekimei1  = [ekimei1]
let test2 = ekimei_insert [ekimei3; ekimei2] ekimei1 = [ekimei3; ekimei1; ekimei2]
let test3 = ekimei_insert [ekimei3; ekimei1; ekimei2] ekimei4 = [ekimei3; ekimei4; ekimei1; ekimei2]

(* ekimei_sort のテスト *)
let test4 = ekimei_sort ekimeis1 = sorted_ekimeis1
let test5 = ekimei_sort ekimeis2 = sorted_ekimeis2
let test6 = ekimei_sort ekimeis3 = sorted_ekimeis3

(* ekimei_unique のテスト *)
let test7 = ekimei_unique sorted_ekimeis1 [] = unique_sorted_ekimeis1
let test8 = ekimei_unique sorted_ekimeis2 [] = unique_sorted_ekimeis2
let test9 = ekimei_unique sorted_ekimeis3 [] = unique_sorted_ekimeis3

(* seiretsu のテスト *)
let test10 = seiretsu ekimeis1 = unique_sorted_ekimeis1
let test11 = seiretsu ekimeis2 = unique_sorted_ekimeis2
let test12 = seiretsu ekimeis3 = unique_sorted_ekimeis3
