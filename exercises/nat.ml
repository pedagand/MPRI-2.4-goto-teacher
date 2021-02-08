(* sujet
(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-34-37-39"]
  /sujet *)

open Fold
open Mu

module CNat = struct
  (* sujet
     type 'a f = NYI

     let map _ _ = failwith "NYI"
        /sujet *)

  (* corrige *)
  type 'a f =
    | CZero
    | CSucc of 'a
  [@@deriving map]

  let map = map_f

  (* /corrige *)
end

module Nat = Mu (CNat)

(* sujet
let zero () = failwith "NYI"
let succ n = failwith "NYI"

let rec from_nat (n: Spec.nat): Nat.t = failwith "NYI"
  /sujet *)

(* corrige *)
let zero () = Nat.Constr CNat.CZero

let succ n = Nat.Constr (CNat.CSucc n)

let rec from_nat = function
  | Spec.Zero ->
      zero ()
  | Spec.Succ n ->
      succ (from_nat n)

(* /corrige *)
