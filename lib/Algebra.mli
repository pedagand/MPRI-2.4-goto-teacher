open Functor

module type AlgCata = sig
  module F : Functor

  type carrier

  val alg : ('x -> carrier) -> 'x F.f -> carrier
end

module type AlgCurry = sig
  module F : Functor

  type carrier

  type ctxt

  val alg : ('x * ctxt -> carrier) -> 'x F.f * ctxt -> carrier
end

module type AlgCurryFix = sig
  module F : Functor

  module G : Functor

  type carrier

  val alg : ('x * 'y -> carrier) -> 'x F.f * 'y G.f -> carrier
end

module type AlgPara = sig
  module F : Functor

  type carrier1

  type carrier2

  val alg1 : ('x -> carrier1) -> ('x -> carrier2) -> 'x F.f -> carrier1

  val alg2 : ('x -> carrier1) -> ('x -> carrier2) -> 'x F.f -> carrier2
end

module type Alg2 = sig
  module F : Functor2

  type carrier1

  type carrier2

  val alg1 : ('x -> carrier1) -> ('y -> carrier2) -> ('x, 'y) F.f1 -> carrier1

  val alg2 : ('x -> carrier1) -> ('y -> carrier2) -> ('x, 'y) F.f2 -> carrier2
end
