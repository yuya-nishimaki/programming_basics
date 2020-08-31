let square x = x * x ;;
square 3. ;;
(* Error: This expression has type float but an expression was expected of type
         int *)

let circle = 2. * pi *. r ;;
circle 2. ;;
(* Error: This expression has type float
       This is not a function; it cannot be applied. *)

let TV bangumi youbi = bangumi ^ "は" ^ youbi ^ "に放映です。" ;;
TV "ポケモン" "木曜日" ;;
(* Syntax error *)