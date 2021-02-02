open Fold
open Tree

module AlgDepth = struct
  module F = CTree

  (* sujet
     type carrier = NYI

     let alg _total = failwith "NYI"
        /sujet *)

  (* corrige *)
  type carrier = int

  let alg (type x) (_depth : x -> carrier) = function
    | CTree.CLeaf ->
        0
    | CTree.CNode (l, _, r) ->
        1 + max (_depth l) (_depth r)

  (* /corrige *)
end

(* sujet
let depth _ = failwith "NYI"
   /sujet *)

(* corrige *)
let depth =
  let module Depth = Catamorphism.Fix (AlgDepth) in
  Depth.fix


(* /corrige *)

(* Tests *)

let%test _ =
  let x = Spec.Leaf in
  Spec.depth x = depth (from_tree x)

let%test _ =
  let x = Spec.Node (Spec.Leaf, 1, Spec.Leaf) in
  Spec.depth x = depth (from_tree x)

let%test _ =
  let x = Spec.Node (Spec.Node (Spec.Leaf, 2, Spec.Leaf), 1, Spec.Leaf) in
  Spec.depth x = depth (from_tree x)

let%test _ =
  let x = Spec.Node (Spec.Leaf, 1, Spec.Node (Spec.Leaf, 2, Spec.Leaf)) in
  Spec.depth x = depth (from_tree x)
