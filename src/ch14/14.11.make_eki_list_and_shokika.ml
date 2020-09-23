# use "./metro.ml"
# use "ch12/12.1.eki_t.ml"

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
let make_eki_list ekimeis = List.map
    (fun ekimei -> match ekimei with {kanji = kanji; kana = kana; romaji = r; shozoku = s}
    -> {namae = kanji; saitan_kyori = infinity; temae_list = []}) ekimeis

(* テスト *)
let test1 = make_eki_list ekimeis1 = ekis1
let test2 = make_eki_list ekimeis2 = ekis2


(* 目的：ダイクストラのアルゴリズムのステップ 1 を実行する。
        eki_t 型のリストと起点を受け取って、起点の最短距離は 0、
        駅名リストに起点の駅名のみを持つ eki_t 型のリストを返す *)
(* shokika : eki_t list -> string -> eki_t list *)
let shokika ekis kanji_kiten = List.map
    (fun ekimei -> match ekimei with {namae = n; saitan_kyori = s; temae_list = t} ->
    if kanji_kiten = n then {namae = n; saitan_kyori = 0.; temae_list = [n]} else ekimei) ekis

(* テスト *)
let test3 = shokika ekis1 "" = []
let test4 = shokika ekis2 "代々木上原" = [
    {namae = "代々木上原"; saitan_kyori = 0.; temae_list = ["代々木上原"]};
    eki2;
    eki3;
]
let test5 = shokika ekis2 "明治神宮前" = [
    eki1;
    eki2;
    {namae = "明治神宮前"; saitan_kyori = 0.; temae_list = ["明治神宮前"]};
]
