open Algebra
open Mu

module Fix (A : AlgCata) : sig
  module MuF : sig
    type t = Mu(A.F).t
  end

  val fix : MuF.t -> A.carrier
end
