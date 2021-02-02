open Algebra
open Mu

module Fix (A : Alg2) : sig
  module MuF : sig
    type t1 = Mu2(A.F).t1

    type t2 = Mu2(A.F).t2
  end

  val fix1 : MuF.t1 -> A.carrier1

  val fix2 : MuF.t2 -> A.carrier2
end
