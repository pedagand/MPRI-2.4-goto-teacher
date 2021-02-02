open Algebra
open Mu

(*****************************************************************)
(* Generic recursor                                              *)
(*****************************************************************)

module Fix (A : AlgCurry) = struct
  module MuF = Mu (A.F)
  open MuF

  (* sujet
     let rec fix _ = failwith "NYI"
        /sujet *)

  (* corrige *)
  let rec fix = function Constr xs, ctxt -> A.alg fix (xs, ctxt)

  (* /corrige *)
end
