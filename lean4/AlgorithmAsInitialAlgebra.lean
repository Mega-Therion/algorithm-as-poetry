-- Algorithms as Initial Algebras
-- The "blueprint" = finite syntax = initial algebra μF

/-- Polynomial functors: the "shape" of one computation step -/
class PolyFunctor (F : Type → Type) where
  sup   : ∀ {α β}, F α → F β → F (α ⊕ β)
  prod  : ∀ {α β}, F α → F β → F (α × β)
  map   : ∀ {α β}, (α → β) → F α → F β

/-- INITIAL ALGEBRA = finite syntax = YOUR BLUEPRINT -/
inductive μ (F : Type → Type) [PolyFunctor F] : Type where
  | mk : F (μ F) → μ F

/-- FINAL COALGEBRA = infinite behavior = YOUR DYNAMICS -/
coinductive ν (F : Type → Type) [PolyFunctor F] : Type where
  | mk : F (ν F) → ν F

/-- The UNIQUE HOMOMORPHISM μF → νF = EXECUTION = "dynamics creating dynamics" -/
def execute {F : Type → Type} [PolyFunctor F] : μ F → ν F :=
  fun x => ⟨fun _ => x⟩

/-- Concrete example: Quicksort's polynomial functor -/
inductive QSF (α : Type) : Type where
  | done : QSF α
  | split : α → List α → List α → (α → α → Bool) → (List α → List α) → QSF α

def QuickSortSyntax : Type := μ QSF
