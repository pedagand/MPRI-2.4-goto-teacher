open Fold
open Stack

module AlgTotal = struct
  module F = CStack

  (* sujet
     type carrier = NYI

     let alg _total = failwith "NYI"
        /sujet *)

  (* corrige *)
  type carrier = int

  let alg (type x) (_total : x -> carrier) = function
    | CStack.CEmpty ->
        0
    | CStack.CPush (n, s) ->
        n + _total s

  (* /corrige *)
end

(* sujet
let total _ = failwith "NYI"
   /sujet *)

(* corrige *)
let total =
  let module Total = Catamorphism.Fix (AlgTotal) in
  Total.fix


(* /corrige *)

(* Tests *)

let%test _ =
  let x = Spec.Empty in
  Spec.total x = total (from_stack x)

let%test _ =
  let x = Spec.Push (42, Spec.Empty) in
  Spec.total x = total (from_stack x)

let%test _ =
  let x = Spec.Push (1, Spec.Push (2, Spec.Push (3, Spec.Empty))) in
  Spec.total x = total (from_stack x)
