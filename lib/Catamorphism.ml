open Algebra
open Mu

(*****************************************************************)
(* Generic recursor                                              *)
(*****************************************************************)

module Fix (A : AlgCata) = struct
  module MuF = Mu (A.F)
  open MuF

  (* sujet
     let rec fix _ = failwith "NYI"
        /sujet *)

  (* corrige *)
  let rec fix = function Constr xs -> A.alg fix xs

  (* /corrige *)
end
