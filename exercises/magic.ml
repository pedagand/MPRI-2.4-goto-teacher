(* sujet
(* Once you are done writing the code, remove this directive,
   whose purpose is to disable several warnings. *)
[@@@warning "-27-32-33-34-37-39"]
  /sujet *)

open Fold
open Functor

module Y (F: ContraFunctor) = struct
  type 'a y = { call: 'x. ('x -> 'a) -> 'x F.f }

  (* claim:  'a F.f 
             = forall 'x. ('x -> 'a) -> 'x F.f
             (= 'a y *)

  (* sujet
  let phi (type a) (f: a y): a F.f = failwith "NYI"
  let psi (type a) (af: a F.f): a y = failwith "NYI"
     /sujet *)

  (* corrige *)
  let phi (type a) (f: a y): a F.f =
    f.call (fun x -> x)

  let psi (type a) (af: a F.f): a y =
    { call = fun k -> F.map k af }
 (* /corrige *)

  (* expect: \forall x, phi (psi x) = x *)
  (* expect: \forall x, psi (phi x) = x *)

end

module Mendler (F: Functor) = struct
  type carrier

  type 'a alg = { alg : 'x. ('x -> 'a) -> 'x F.f -> 'a }

  (* claim:  carrier F.f -> carrier 
             = forall 'x. ('x -> carrier) -> 'x F.f -> carrier
             (= carrier alg) *)

  (* sujet
  let phi (f: carrier alg)(af: carrier F.f): carrier = failwith "NYI"
  let psi (af: carrier F.f -> carrier): carrier alg = failwith "NYI"
     /sujet *)

  module M = Y(struct
                 type 'a f = 'a F.f -> carrier
                 let map f k af = k (F.map f af)
               end)
  let phi (f: carrier alg)(af: carrier F.f): carrier =
    M.phi { call = fun  k2 af -> f.alg k2 af} af

  let psi (af: carrier F.f -> carrier): carrier alg =
    { alg = fun a -> (M.psi af).call a  }


  (* expect: \forall x, phi (psi x) = x *)
  (* expect: \forall x, psi (phi x) = x *)

end
