(* sujet
(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-33-39"]
  /sujet *)

open Algebra
open Mu

(*****************************************************************)
(* Generic recursor                                              *)
(*****************************************************************)

module Fix (A : Alg2) = struct
  module MuF = Mu2 (A.F)
  open MuF

  (* sujet
     let rec fix1 _ = failwith "NYI"
     and fix2 _ = failwith "NYI"
        /sujet *)

  (* corrige *)
  let rec fix1 = function RConstr1 xs -> A.alg1 fix1 fix2 xs

  and fix2 = function RConstr2 xs -> A.alg2 fix1 fix2 xs

  (* /corrige *)
end
