(* 駅と駅の接続情報を格納する型 *)
type ekikan_t = {
    kiten : string; (* 起点の駅名 *)
    shuten : string; (* 終点の駅名 *)
    keiyu : string; (* 経由する路線名 *)
    kyori_km : float; (* 2 駅間の距離（km） *)
    jikan_min : int; (* 所要時間（分） *)
}
