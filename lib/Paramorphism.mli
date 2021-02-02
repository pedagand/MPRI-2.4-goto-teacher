open Algebra
open Mu

module Fix (A : AlgPara) : sig
  module MuF : sig
    type t = Mu(A.F).t
  end

  val fix1 : MuF.t -> A.carrier1

  val fix2 : MuF.t -> A.carrier2
end
