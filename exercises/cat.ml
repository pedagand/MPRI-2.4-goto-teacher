(* sujet
(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-33-34-37-39"]
  /sujet *)

open Fold
open Stack

(*****************************************************************)
(* Algebra                                                       *)
(*****************************************************************)

module AlgCat = struct
  module F = CStack

  (* sujet
  type carrier = NYI1

  type ctxt = NYI2

     let alg (type x) (f: x * Stack.t -> carrier) = failwith "NYI"
        /sujet *)

  (* corrige *)
  type carrier = Stack.t

  type ctxt = Stack.t

  let alg (type x) (f : x * Stack.t -> carrier) = function
    | CStack.CEmpty, ns ->
        ns
    | CStack.CPush (m, ms), ns ->
        push m (f (ms, ns))

  (* /corrige *)
end

(*****************************************************************)
(* Fixpoint                                                      *)
(*****************************************************************)

(* sujet
let cat ms ns = failwith "NYI"
   /sujet *)

(* corrige *)
let cat ms ns =
  let module Cat = Curry.Fix (AlgCat) in
  Cat.fix (ms, ns)
(* /corrige *)

(*****************************************************************)
(* Tests                                                         *)
(*****************************************************************)

let%test _ =
  let x1 = Spec.Empty in
  let x2 = Spec.Empty in
  from_stack (Spec.cat x1 x2) = cat (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Push (42, Spec.Empty) in
  let x2 = Spec.Empty in
  from_stack (Spec.cat x1 x2) = cat (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Empty in
  let x2 = Spec.Push (42, Spec.Empty) in
  from_stack (Spec.cat x1 x2) = cat (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Push (1, Spec.Push (2, Spec.Push (3, Spec.Empty))) in
  let x2 = Spec.Push (42, Spec.Empty) in
  from_stack (Spec.cat x1 x2) = cat (from_stack x1) (from_stack x2)
