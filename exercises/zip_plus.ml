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

module AlgZip_Plus = struct
  module F = CStack
  module G = CStack

  (* sujet
     type carrier = NYI

     let alg (type x y) (f: x * y -> carrier) = failwith "NYI"
        /sujet *)

  (* corrige *)
  type carrier = Stack.t

  let alg (type x y) (f : x * y -> carrier) = function
    | CStack.CEmpty, _ ->
        empty ()
    | _, CStack.CEmpty ->
        empty ()
    | CStack.CPush (m, ms), CStack.CPush (n, ns) ->
        push (m + n) (f (ms, ns))

  (* /corrige *)
end

(*****************************************************************)
(* Fixpoint                                                      *)
(*****************************************************************)

(* sujet
let zip_plus ms ns = failwith "NYI"
  /sujet *)

(* corrige *)
let zip_plus ms ns =
  let module Zip_Plus = Curryfix.Fix (AlgZip_Plus) in
  Zip_Plus.fix (ms, ns)
(* /corrige *)

(*****************************************************************)
(* Tests                                                      *)
(*****************************************************************)

let%test _ =
  let x1 = Spec.Empty in
  let x2 = Spec.Empty in
  from_stack (Spec.zip_plus x1 x2) = zip_plus (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Push (42, Spec.Empty) in
  let x2 = Spec.Empty in
  from_stack (Spec.zip_plus x1 x2) = zip_plus (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Empty in
  let x2 = Spec.Push (42, Spec.Empty) in
  from_stack (Spec.zip_plus x1 x2) = zip_plus (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Push (1, Spec.Push (2, Spec.Push (3, Spec.Empty))) in
  let x2 = Spec.Push (42, Spec.Empty) in
  from_stack (Spec.zip_plus x1 x2) = zip_plus (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Push (42, Spec.Empty) in
  let x2 = Spec.Push (1, Spec.Push (2, Spec.Push (3, Spec.Empty))) in
  from_stack (Spec.zip_plus x1 x2) = zip_plus (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Push (1, Spec.Push (2, Spec.Push (3, Spec.Empty))) in
  let x2 = Spec.Push (4, Spec.Push (1, Spec.Push (5, Spec.Empty))) in
  from_stack (Spec.zip_plus x1 x2) = zip_plus (from_stack x1) (from_stack x2)
