(* sujet
(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-32-33-34-37-39"]
  /sujet *)

open Fold
open Stack

(*****************************************************************)
(* Algebra                                                       *)
(*****************************************************************)

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

(*****************************************************************)
(* Fixpoint                                                       *)
(*****************************************************************)

(* sujet
let total _ = failwith "NYI"
   /sujet *)

(* corrige *)
let total =
  let module Total = Catamorphism.Fix (AlgTotal) in
  Total.fix


(* /corrige *)

(*****************************************************************)
(* Tests                                                         *)
(*****************************************************************)

let%test _ =
  let x = Spec.Empty in
  Spec.total x = total (from_stack x)

let%test _ =
  let x = Spec.Push (42, Spec.Empty) in
  Spec.total x = total (from_stack x)

let%test _ =
  let x = Spec.Push (1, Spec.Push (2, Spec.Push (3, Spec.Empty))) in
  Spec.total x = total (from_stack x)
