# use "ch12/12.2.ml"

(* eki_t list は
    - []            空リスト、あるいは
    - first :: rest 最初の要素が first で残りのリストが rest
                    （rest が自己参照のケース）
    という形 *)

(* eki_t list 型のデータ例 *)
let eki_list1 = []
let eki_list2 = [
    {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
    {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []};
    {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []};
]

(* 目的：ダイクストラのアルゴリズムのステップ 1 を実行する。
        eki_t 型のリストと起点を受け取って、起点の最短距離は 0、
        駅名リストに起点の駅名のみを持つ eki_t 型のリストを返す *)
(* shokika : eki_t list -> string -> eki_t list *)
let rec shokika eki_list kanji_kiten = match eki_list with 
    [] -> []
    | ({namae = n; saitan_kyori = s; temae_list = t} as first) :: rest ->
        if kanji_kiten = n then {namae = n; saitan_kyori = 0.; temae_list = [n]} :: rest
        else first :: shokika rest kanji_kiten

(* テスト *)
let test1 = shokika eki_list1 "" = []
let test2 = shokika eki_list2 "代々木上原" = [
    {namae = "代々木上原"; saitan_kyori = 0.; temae_list = ["代々木上原"]};
    {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []};
    {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []};
]
let test3 = shokika eki_list2 "明治神宮前" = [
    {namae = "代々木上原"; saitan_kyori = infinity; temae_list = []};
    {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []};
    {namae = "明治神宮前"; saitan_kyori = 0.; temae_list = ["明治神宮前"]};
]
