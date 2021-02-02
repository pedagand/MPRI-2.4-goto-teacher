(* sujet
(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-33-34-37-39"]
  /sujet *)

open Fold
open Nat

module AlgFib = struct
  module F = CNat

  (* sujet
     type carrier1 = NYI
     type carrier2 = NYI

     let alg1 _fib _fib' = failwith "NYI"
     let alg2 _fib _fib' = failwith "NYI"
        /sujet *)

  (* corrige *)
  type carrier1 = int

  type carrier2 = int

  let alg1 (type x) (_ : x -> carrier1) (f2 : x -> carrier2) = function
    | CNat.CZero ->
        0
    | CNat.CSucc n ->
        f2 n


  let alg2 (type x) (f1 : x -> carrier1) (f2 : x -> carrier2) = function
    | CNat.CZero ->
        1
    | CNat.CSucc n ->
        f1 n + f2 n

  (* /corrige *)
end

(* sujet
let fib _ = failwith "NYI"
   /sujet *)

(* corrige *)
let fib =
  let module Fib = Paramorphism.Fix (AlgFib) in
  Fib.fix1


(* /corrige *)

(* Tests *)

let%test _ =
  let x = Spec.Zero in
  Spec.fib x = fib (from_nat x)

let%test _ =
  let x = Spec.Succ Spec.Zero in
  Spec.fib x = fib (from_nat x)

let%test _ =
  let x = Spec.Succ (Spec.Succ Spec.Zero) in
  Spec.fib x = fib (from_nat x)

let%test _ =
  let x = Spec.Succ (Spec.Succ (Spec.Succ Spec.Zero)) in
  Spec.fib x = fib (from_nat x)
