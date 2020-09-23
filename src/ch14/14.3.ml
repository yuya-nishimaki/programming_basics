(* 目的：first と rest_result を結合する *)
(* concat_string : string -> string -> string *)
let concat_string first rest_result = first ^ rest_result

(* 目的：文字列のリストを受け取って、その中の要素を前から順に全部、くっつけた文字列を返す *)
(* concat : string list -> string *)
let concat lst = List.fold_right concat_string lst ""

(* concat テスト *)
let test1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let test2 = concat [] = ""
let test3 = concat ["ocaml"] = "ocaml"
