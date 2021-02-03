(* sujet
(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-34-37-39"]
  /sujet *)
(* corrige *)
[@@@warning "-27"]

(* /corrige *)

open Fold
open Mu

module CRose = struct
  (* sujet
     type ('a, 'b) f1 = NYI
     type ('a, 'b) f2 = NYI

     let map1 _ _ = failwith "NYI"
     let map2 _ _ = failwith "NYI"
        /sujet *)

  (* corrige *)
  type ('a, 'b) f1 = CNode of int * 'b

  and ('a, 'b) f2 =
    | CRNil
    | CRCons of 'a * 'b
  [@@deriving map]

  let map1 = map_f1

  let map2 = map_f2

  (* /corrige *)
end

module Rose = Mu2 (CRose)

(* sujet
let node n ts = failwith "NYI"
let nil () = failwith "NYI"
let cons t ts = failwith "NYI"

let rec from_rose _ = failwith "NYI"
and from_roses _ = failwith "NYI"
  /sujet *)

(* corrige *)
let node n ts = Rose.RConstr1 (CRose.CNode (n, ts))

let nil () = Rose.RConstr2 CRose.CRNil

let cons t ts = Rose.RConstr2 (CRose.CRCons (t, ts))

let rec from_rose = function Spec.RNode (n, ts) -> node n (from_roses ts)

and from_roses = function
  | Spec.RNil ->
      nil ()
  | Spec.RCons (t, ts) ->
      cons (from_rose t) (from_roses ts)

(* /corrige *)
