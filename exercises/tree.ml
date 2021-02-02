open Fold
open Mu

module CTree = struct
  (* sujet
     type 'a f = NYI

     let map _ _ = failwith "NYI"
        /sujet *)

  (* corrige *)
  type 'a f =
    | CLeaf
    | CNode of 'a * int * 'a
  [@@deriving map]

  let map = map_f

  (* /corrige *)
end

module Tree = Mu (CTree)

(* sujet
let leaf () = failwith "NYI"
let node l a r = failwith "NYI"

let rec from_tree _ = failwith "NYI"
  /sujet *)

(* corrige *)
let leaf _ = Tree.Constr CLeaf

let node l a r = Tree.Constr (CNode (l, a, r))

let rec from_tree = function
  | Spec.Leaf ->
      leaf ()
  | Spec.Node (l, a, r) ->
      node (from_tree l) a (from_tree r)

(* /corrige *)
