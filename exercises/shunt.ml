open Fold
open Stack

module AlgShunt = struct
  module F = CStack

  (* sujet
     type carrier = NYI
     type ctxt = NYI

     let alg (type x) (f: x * Stack.t -> carrier) = failwith "NYI"
        /sujet *)

  (* corrige *)
  type carrier = Stack.t

  type ctxt = Stack.t

  let alg (type x) (f : x * Stack.t -> carrier) = function
    | CStack.CEmpty, ns ->
        ns
    | CStack.CPush (m, ms), ns ->
        f (ms, push m ns)

  (* /corrige *)
end

let shunt ms ns =
  let module Shunt = Curry.Fix (AlgShunt) in
  Shunt.fix (ms, ns)


let%test _ =
  let x1 = Spec.Empty in
  let x2 = Spec.Empty in
  from_stack (Spec.shunt x1 x2) = shunt (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Push (42, Spec.Empty) in
  let x2 = Spec.Empty in
  from_stack (Spec.shunt x1 x2) = shunt (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Empty in
  let x2 = Spec.Push (42, Spec.Empty) in
  from_stack (Spec.shunt x1 x2) = shunt (from_stack x1) (from_stack x2)

let%test _ =
  let x1 = Spec.Push (1, Spec.Push (2, Spec.Push (3, Spec.Empty))) in
  let x2 = Spec.Push (42, Spec.Empty) in
  from_stack (Spec.shunt x1 x2) = shunt (from_stack x1) (from_stack x2)