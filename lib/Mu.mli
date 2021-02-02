open Functor

module Mu (F : Functor) : sig
  type t = Constr of t F.f
end

module Mu2 (F : Functor2) : sig
  type t1 = RConstr1 of (t1, t2) F.f1

  and t2 = RConstr2 of (t1, t2) F.f2
end
