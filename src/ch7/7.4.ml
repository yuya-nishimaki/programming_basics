(* 目的：平面座標を二つ受け取って、その中点の座標を返す *)
(* chuten: float * float -> float * float -> float * flaot *)
let chuten point1 point2 = match point1 with 
                            (x1, y1) -> match point2 with 
                            (x2, y2) -> ((x1 +. x2) /. 2., (y1 +. y2) /. 2.)

(* テスト *)
let test1 = chuten (0., 0.) (0., 0.) = (0., 0.)
let test2 = chuten (1., 3.) (2., 8.) = (1.5, 5.5)
let test3 = chuten (-3., -7.) (5., 10.) = (1., 1.5)