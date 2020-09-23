# use "./ch13/13.6.koushin1.ml"

(* eki_t list 型の未確定の駅リストのデータ例 *)
let mikakuteis = [mikakutei1; mikakutei2]

(* 目的：直前に確定した駅 p と未確定の駅リスト v を受け取って、
        必要な更新処理を行った後の未確定の駅リストを返す *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin p v = List.map (koushin1 p) v

(* テスト *)
let test1 = koushin kakutei mikakuteis = [
    {namae = "代々木公園"; saitan_kyori = 1.0; temae_list = ["代々木公園"; "代々木上原"]};
    {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []}
]
