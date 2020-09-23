# use "ch12/12.2.make_eki_list.ml"

(* 目的：ダイクストラのアルゴリズムのステップ 1 を実行する。
        eki_t 型のリストと起点を受け取って、起点の最短距離は 0、
        駅名リストに起点の駅名のみを持つ eki_t 型のリストを返す *)
(* shokika : eki_t list -> string -> eki_t list *)
let rec shokika ekis kanji_kiten = match ekis with
    [] -> []
    | ({namae = n; saitan_kyori = s; temae_list = t} as first) :: rest ->
        if kanji_kiten = n then {namae = n; saitan_kyori = 0.; temae_list = [n]} :: rest
        else first :: shokika rest kanji_kiten

(* テスト *)
let test1 = shokika ekis1 "" = []
let test2 = shokika ekis2 "代々木上原" = [
    {namae = "代々木上原"; saitan_kyori = 0.; temae_list = ["代々木上原"]};
    eki2;
    eki3;
]
let test3 = shokika ekis2 "明治神宮前" = [
    eki1;
    eki2;
    {namae = "明治神宮前"; saitan_kyori = 0.; temae_list = ["明治神宮前"]};
]
