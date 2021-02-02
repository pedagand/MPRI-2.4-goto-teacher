type nat =
  | Zero
  | Succ of nat

type stack =
  | Empty
  | Push of int * stack

type tree =
  | Leaf
  | Node of tree * int * tree

type string =
  | Null
  | Cons of char * string

type rose = RNode of int * roses

and roses =
  | RNil
  | RCons of rose * roses

(* Catamorphism *)

let rec total = function Empty -> 0 | Push (n, s) -> n + total s

let rec depth = function
  | Leaf ->
      0
  | Node (l, _, r) ->
      1 + max (depth l) (depth r)


(* Fold with parameters *)

let rec cat ms ns =
  match ms with Empty -> ns | Push (m, ms) -> Push (m, cat ms ns)


let rec shunt ms ns =
  match ms with Empty -> ns | Push (m, ms) -> shunt ms (Push (m, ns))


let rec depths t n =
  match t with
  | Leaf ->
      Leaf
  | Node (l, _, r) ->
      Node (depths l (n + 1), n, depths r (n + 1))


(* Fold with inductive parameter *)

let rec zip_plus ms ns =
  match (ms, ns) with
  | Empty, _ ->
      Empty
  | _, Empty ->
      Empty
  | Push (m, ms), Push (n, ns) ->
      Push (m + n, zip_plus ms ns)


(* Mutumorphisms *)

let rec fac = function Zero -> 1 | Succ n -> (1 + to_int n) * fac n

and to_int = function Zero -> 0 | Succ n -> 1 + to_int n

(* Histomorphism *)

let rec fib = function Zero -> 0 | Succ n -> fib' n

and fib' = function Zero -> 1 | Succ n -> fib n + fib' n

(* Mutually recursive *)

let rec flattena = function RNode (n, ts) -> n :: flattens ts

and flattens = function RNil -> [] | RCons (t, ts) -> flattena t @ flattens ts
