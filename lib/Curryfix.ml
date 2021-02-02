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

module Fix (A : AlgCurryFix) = struct
  module MuF = Mu (A.F)
  module MuG = Mu (A.G)

  (* sujet
     let rec fix _ = failwith "NYI"
        /sujet *)

  (* corrige *)
  let rec fix = function MuF.Constr xs, MuG.Constr ys -> A.alg fix (xs, ys)

  (* /corrige *)
end

(* Section 5.4 *)
