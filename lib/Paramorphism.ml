open Algebra
open Mu

(*****************************************************************)
(* Generic recursor                                              *)
(*****************************************************************)

module Fix (A : AlgPara) = struct
  module MuF = Mu (A.F)
  open MuF

  (* sujet
     let rec fix1 _ = failwith "NYI"
     and fix2 _ = failwith "NYI"
      /sujet *)

  (* corrige *)
  let rec fix1 = function Constr xs -> A.alg1 fix1 fix2 xs

  and fix2 = function Constr xs -> A.alg2 fix1 fix2 xs

  (* /corrige *)
end

(* Section 5.5 *)
