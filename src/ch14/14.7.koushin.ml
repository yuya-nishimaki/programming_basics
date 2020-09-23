# use "./metro.ml"
# use "./ch12/12.1.eki_t.ml"
# use "./ch10/10.11.get_ekikan_kyori.ml"

(* eki_t 型のデータ例 *)
let kakutei = {namae = "代々木上原"; saitan_kyori = 0.; temae_list = ["代々木上原"]}
let mikakutei1 = {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}
let mikakutei2 = {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []}

(* eki_t list 型の未確定の駅リストのデータ例 *)
let mikakuteis = [mikakutei1; mikakutei2]

(* 目的：直前に確定した駅 p と未確定の駅リスト v を受け取って、
        必要な更新処理を行った後の未確定の駅リストを返す *)
(* koushin : eki_t -> eki_t list -> eki_t list *)
let koushin p v =
    let koushin1 p q = match p with {namae = np; saitan_kyori = sp; temae_list = tp}
    -> match q with {namae = nq; saitan_kyori = sq; temae_list = tq}
    -> let ekikan_kyori = get_ekikan_kyori np nq global_ekikan_list in
        if ekikan_kyori = infinity || ekikan_kyori > sq then q
        else {namae = nq; saitan_kyori = ekikan_kyori; temae_list = nq :: tp}
        in List.map (koushin1 p) v

(* テスト *)
let test1 = koushin kakutei mikakuteis = [
    {namae = "代々木公園"; saitan_kyori = 1.0; temae_list = ["代々木公園"; "代々木上原"]};
    {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []}
]
