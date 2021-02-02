open Algebra
open Mu

module Fix (A : AlgCurryFix) : sig
  module MuF : sig
    type t = Mu(A.F).t
  end

  module MuG : sig
    type t = Mu(A.G).t
  end

  val fix : MuF.t * MuG.t -> A.carrier
end
