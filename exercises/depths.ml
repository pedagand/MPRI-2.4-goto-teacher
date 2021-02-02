open Fold
open Tree

module AlgDepths = struct
  module F = CTree

  (* sujet
     type carrier = NYI

     let alg _total = failwith "NYI"
        /sujet *)

  (* corrige *)
  type carrier = Tree.t

  type ctxt = int

  let alg (type x) (_depth : x * int -> carrier) = function
    | CTree.CLeaf, _ ->
        leaf ()
    | CTree.CNode (l, _, r), n ->
        node (_depth (l, n + 1)) n (_depth (r, n + 1))

  (* /corrige *)
end

(* sujet
let depths _ = failwith "NYI"
   /sujet *)

(* corrige *)
let depths t n =
  let module Depths = Curry.Fix (AlgDepths) in
  Depths.fix (t, n)


(* /corrige *)

(* Tests *)

let%test _ =
  let x = Spec.Leaf in
  from_tree (Spec.depths x 0) = depths (from_tree x) 0

let%test _ =
  let x = Spec.Node (Spec.Leaf, 1, Spec.Leaf) in
  from_tree (Spec.depths x 0) = depths (from_tree x) 0

let%test _ =
  let x = Spec.Node (Spec.Node (Spec.Leaf, 2, Spec.Leaf), 1, Spec.Leaf) in
  from_tree (Spec.depths x 0) = depths (from_tree x) 0

let%test _ =
  let x = Spec.Node (Spec.Leaf, 1, Spec.Node (Spec.Leaf, 2, Spec.Leaf)) in
  from_tree (Spec.depths x 0) = depths (from_tree x) 0
