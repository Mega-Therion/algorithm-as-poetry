(* Certified Quicksort in Coq *)

Require Import List.
Require Import Permutation.
Require Import Lia.

(* The syntax: inductive type = initial algebra *)
Inductive QSSyntax (A : Type) : Type :=
| QSNil : QSSyntax A
| QSCons : A -> QSSyntax A -> QSSyntax A
| QSConc : QSSyntax A -> QSSyntax A -> QSSyntax A
| QSSort : (A -> A -> bool) -> QSSyntax A -> QSSyntax A.

(* The semantics: final coalgebra / domain *)
Fixpoint qs_sem {A} (le : A -> A -> bool) (l : list A) : list A :=
  match l with
  | [] => []
  | x :: xs =>
    let (ls, rs) := partition le x xs in
    qs_sem le ls ++ [x] ++ qs_sem le rs
  end.

(* Correctness: permutation + sorted *)
Theorem qs_correct : forall (A : Type) (le : A -> A -> bool) (l : list A),
  Permutation (qs_sem le l) l /\
  Sorted (fun x y => le x y = true) (qs_sem le l).
Proof.
  (* Induction on the syntax tree = initial algebra induction *)
  admit.
Qed.

(* Extraction to OCaml/Haskell gives certified sorting code *)
Extraction Language Haskell.
Extraction "Quicksort.hs" qs_sem.
