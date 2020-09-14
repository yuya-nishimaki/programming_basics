# use "./metro.ml"
# use "ch12/12.1.ml"

(* ekimei_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* ekimei_t list 型のデータ例 *)
let ekimei_list1 = []
let ekimei_list2 = [
    {kanji="代々木上原"; kana="よよぎうえはら"; romaji="yoyogiuehara"; shozoku="千代田線"};
    {kanji="代々木公園"; kana="よよぎこうえん"; romaji="yoyogikouen"; shozoku="千代田線"};
    {kanji="明治神宮前"; kana="めいじじんぐうまえ"; romaji="meijijinguumae"; shozoku="千代田線"};
]

(* eki_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* 目的：ekimei_t 型のリストを受け取って、eki_t 型のリストを作る *)
(* make_eki_list : ekimei_t list -> eki_t list *)
let rec make_eki_list ekimei_list = match ekimei_list with 
    [] -> []
    | {kanji = k1; kana = k2; romaji = r; shozoku = s} :: rest -> 
        {namae = k1; saitan_kyori = infinity; temae_list = []} :: make_eki_list rest

(* テスト *)
let test1 = make_eki_list ekimei_list1 = []
let test2 = make_eki_list ekimei_list2 = [
    {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
    {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []};
    {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []};
]
