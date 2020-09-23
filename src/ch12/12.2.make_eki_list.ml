# use "./metro.ml"
# use "ch12/12.1.ml"

(* ekimei_t 型のデータ例 *)
let ekimei1 = {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"}
let ekimei2 = {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"}
let ekimei3 = {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"}

(* ekimei_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* ekimei_t list 型のデータ例 *)
let ekimeis1 = []
let ekimeis2 = [ekimei1; ekimei2; ekimei3]

(* eki_t 型のデータ例 *)
let eki1 = {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []}
let eki2 = {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}
let eki3 = {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []}

(* eki_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* eki_t list 型のデータ例 *)
let ekis1 = []
let ekis2 = [eki1; eki2; eki3]

(* 目的：ekimei_t 型のリストを受け取って、eki_t 型のリストを作る *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let rec make_eki_list ekimeis = match ekimeis with
    [] -> []
    | {kanji = kanji; kana = kana; romaji = r; shozoku = s} :: rest ->
        {namae = kanji; saitan_kyori = infinity; temae_list = []} :: make_eki_list rest

(* テスト *)
let test1 = make_eki_list ekimeis1 = ekis1
let test2 = make_eki_list ekimeis2 = ekis2
