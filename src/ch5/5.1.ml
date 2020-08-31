if 2 < 1 then 3 else 4
(* int *)

if "true" then 3.14 else 2.72
(* Error: This expression has type string but an expression was expected of type
         bool
       because it is in the condition of an if-statement *)

if "a" = "b" then false else true ;;
(* bool *)

if true < false then 1 else "2" ;;
(* Error: This expression has type string but an expression was expected of type
         int *)

if not (3 = 4) then 1 < 2 else 1 > 2 ;;
(* bool *)
