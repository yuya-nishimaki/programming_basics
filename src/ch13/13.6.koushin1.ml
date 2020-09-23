# use "./metro.ml"
# use "./ch12/12.1.eki_t.ml"
# use "./ch10/10.11.get_ekikan_kyori.ml"

(* eki_t 型のデータ例 *)
let kakutei = {namae = "代々木上原"; saitan_kyori = 0.; temae_list = ["代々木上原"]}
let mikakutei1 = {namae = "代々木公園"; saitan_kyori = infinity; temae_list = []}
let mikakutei2 = {namae = "明治神宮前"; saitan_kyori = infinity; temae_list = []}

(* 目的：直前に確定した駅 p (eki_t 型）と未確定の駅 q （eki_t 型）を受け取って、
        p と q が直接つながっていれば、q の最短距離と手前リストを必要に応じて更新したものを、
        つながっていなければ、q を返す *)
(* koushin1 : ekit_t -> eki_t -> eki_t *)
let koushin1 p q = match p with {namae = np; saitan_kyori = sp; temae_list = tp}
    -> match q with {namae = nq; saitan_kyori = sq; temae_list = tq}
    -> let ekikan_kyori = get_ekikan_kyori np nq global_ekikan_list in
        if ekikan_kyori = infinity || ekikan_kyori > sq then q
        else {namae = nq; saitan_kyori = ekikan_kyori; temae_list = nq :: tp}

(* テスト *)
let test1 = koushin1 kakutei mikakutei1 = {namae = "代々木公園"; saitan_kyori = 1.0; temae_list = ["代々木公園"; "代々木上原"]}
let test2 = koushin1 kakutei mikakutei2 = mikakutei2
