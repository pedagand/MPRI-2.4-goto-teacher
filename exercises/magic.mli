open Fold
open Functor

module Y : functor (F : ContraFunctor) ->
  sig
    type 'a y = { call : 'x. ('x -> 'a) -> 'x F.f; }
    val phi : 'a y -> 'a F.f
    val psi : 'a F.f -> 'a y
  end

module Mendler : functor (F : Functor) ->
  sig
    type carrier
    type 'a alg = { alg : 'x. ('x -> 'a) -> 'x F.f -> 'a; }

    val phi : carrier alg -> carrier F.f -> carrier
    val psi : (carrier F.f -> carrier) -> carrier alg
  end
