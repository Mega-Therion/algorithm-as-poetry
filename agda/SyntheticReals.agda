-- Synthetic Computability: ℕ ↠ ℝ internally
-- In Cubical Agda with propositional truncation and countable choice

module SyntheticReals where

open import Agda.Builtin.Nat
open import Agda.Builtin.Bool
open import Agda.Builtin.Equality
open import Agda.Primitive
open import Data.Product
open import Data.Sum
open import Level
open import Relation.Binary.PropositionalEquality

-- Cauchy reals as used in synthetic computability
record CauchyReal : Set where
  constructor cauchy
  field
    seq : ℕ → ℚ
    mod : ℕ → ℕ
    cauchy : ∀ ε n m → n ≥ mod ε → m ≥ mod ε → | seq n - seq m | < ε

-- INTERNALLY: Every real IS a program → countable
-- EXTERNALLY: Continuum many equivalence classes

-- The internal surjection ℕ ↠ ℝ (requires countable choice + prop truncation)
-- This is PROVABLE in synthetic computability (effective topos, cubical assemblies)
postulate
  ℝ-countable-internal : ∃ (e : ℕ → CauchyReal) → Surjective e

-- But externally: ¬ Countable ℝ (no bijection in meta-theory)
postulate
  ℝ-uncountable-external : ¬ Countable CauchyReal

-- This is your "ladder and shadow ladder all within ℵ₀"
-- The effective topos validates:
--   "ℝ is countable" ∧ "ℝ ≇ ℕ" ∧ "all functions ℝ → ℝ are continuous"
