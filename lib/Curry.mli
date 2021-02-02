open Algebra
open Mu

module Fix (A : AlgCurry) : sig
  module MuF : sig
    type t = Mu(A.F).t
  end

  val fix : MuF.t * A.ctxt -> A.carrier
end
