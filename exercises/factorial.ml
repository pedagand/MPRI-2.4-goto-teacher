open Fold
open Nat

module AlgFac = struct
  module F = CNat

  (* sujet
     type carrier1 = NYI
     type carrier2 = NYI

     let alg1 _fac _id = failwith "NYI"
     let alg2 _fac _id = failwith "NYI"
        /sujet *)

  (* corrige *)
  type carrier1 = int

  type carrier2 = int

  let alg1 (type x) (f1 : x -> carrier1) (f2 : x -> carrier2) = function
    | CNat.CZero ->
        1
    | CNat.CSucc n ->
        (f2 n + 1) * f1 n


  let alg2 (type x) (_ : x -> carrier1) (f2 : x -> carrier2) = function
    | CNat.CZero ->
        0
    | CNat.CSucc n ->
        1 + f2 n

  (* /corrige *)
end

(* sujet
let fac _ = failwith "NYI"
   /sujet *)

(* corrige *)
let fac =
  let module Fac = Paramorphism.Fix (AlgFac) in
  Fac.fix1


(* /corrige *)

(* Tests *)

let%test _ =
  let x = Spec.Zero in
  Spec.fac x = fac (from_nat x)

let%test _ =
  let x = Spec.Succ Spec.Zero in
  Spec.fac x = fac (from_nat x)

let%test _ =
  let x = Spec.Succ (Spec.Succ Spec.Zero) in
  Spec.fac x = fac (from_nat x)

let%test _ =
  let x = Spec.Succ (Spec.Succ (Spec.Succ Spec.Zero)) in
  Spec.fac x = fac (from_nat x)
