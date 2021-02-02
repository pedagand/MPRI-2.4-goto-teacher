open Fold
open Mu

module CStack = struct
  (* sujet
     type 'a f = NYI

     let map _ _ = failwith "NYI"
        /sujet *)

  (* corrige *)
  type 'a f =
    | CEmpty
    | CPush of int * 'a
  [@@deriving map]

  let map = map_f

  (* /corrige *)
end

module Stack = Mu (CStack)

(* sujet
let empty () = failwith "NYI"
let push n ns = failwith "NYI"

let rec from_stack _ = failwith "NYI"
  /sujet *)

(* corrige *)
let empty () = Stack.Constr CEmpty

let push n ns = Stack.Constr (CPush (n, ns))

let rec from_stack = function
  | Spec.Empty ->
      empty ()
  | Spec.Push (n, s) ->
      push n (from_stack s)

(* /corrige *)
