(* sujet
(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-33-34-37-39"]
  /sujet *)

open Fold
open Rose

(*****************************************************************)
(* Algebra                                                       *)
(*****************************************************************)

module AlgFlatten = struct
  module F = CRose

  (* sujet
     type carrier1 = NYI1

     type carrier2 = NYI2

        let alg1 _flattena _flattens = failwith "NYI"
        let alg2 _flattena _flattens = failwith "NYI"
           /sujet *)

  (* corrige *)
  type carrier1 = int list

  type carrier2 = int list

  let alg1 (type x1 x2) (_ : x1 -> carrier1) (f2 : x2 -> carrier2) = function
    | CRose.CNode (n, ts) ->
        n :: f2 ts


  let alg2 (type x1 x2) (f1 : x1 -> carrier1) (f2 : x2 -> carrier2) = function
    | CRose.CRNil ->
        []
    | CRose.CRCons (t, ts) ->
        f1 t @ f2 ts

  (* /corrige *)
end

(*****************************************************************)
(* Fixpoint                                                      *)
(*****************************************************************)

(* sujet
let flattena _ = failwith "NYI"
let flattens _ = failwith "NYI"
  /sujet *)

(* corrige *)
let flattena, flattens =
  let module Flatten = Mutual.Fix (AlgFlatten) in
  (Flatten.fix1, Flatten.fix2)


(* /corrige *)

(*****************************************************************)
(* Tests                                                         *)
(*****************************************************************)

let%test _ =
  let x = Spec.RNode (0, Spec.RNil) in
  Spec.flattena x = flattena (from_rose x)

let%test _ =
  let x = Spec.RNode (0, Spec.RCons (Spec.RNode (3, Spec.RNil), Spec.RNil)) in
  Spec.flattena x = flattena (from_rose x)

let%test _ =
  let x =
    Spec.RNode
      ( 0
      , Spec.RCons
          ( Spec.RNode (3, Spec.RNil)
          , Spec.RCons (Spec.RNode (2, Spec.RNil), Spec.RNil) ) )
  in
  Spec.flattena x = flattena (from_rose x)

let%test _ =
  let x =
    Spec.RNode
      ( 0
      , Spec.RCons
          ( Spec.RNode (3, Spec.RCons (Spec.RNode (1, Spec.RNil), Spec.RNil))
          , Spec.RCons (Spec.RNode (2, Spec.RNil), Spec.RNil) ) )
  in
  Spec.flattena x = flattena (from_rose x)
