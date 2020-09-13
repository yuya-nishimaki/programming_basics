(* 目的：平面座標を受け取って、x 軸について対称な点の座標を返す *)
(* taisho_x : float * float -> float * flaot *)
let taisho_x point = match point with (x, y) -> (x, -.y)

(* テスト *)
let test1 = taisho_x (1., 3.) = (1., -3.)
let test2 = taisho_x (3.3, -7.2) = (3.3, 7.2)
let test3 = taisho_x (0., 0.) = (0., 0.)