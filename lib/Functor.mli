module type Functor = sig
  type 'a f

  val map : ('a -> 'b) -> 'a f -> 'b f
end

module type ContraFunctor = sig
  type 'a f

  val map : ('b -> 'a) -> 'a f -> 'b f
end

module type Functor2 = sig
  type ('a, 'b) f1

  type ('a, 'b) f2

  val map1 : ('a -> 'c) -> ('b -> 'd) -> ('a, 'b) f1 -> ('c, 'd) f1

  val map2 : ('a -> 'c) -> ('b -> 'd) -> ('a, 'b) f2 -> ('c, 'd) f2
end
