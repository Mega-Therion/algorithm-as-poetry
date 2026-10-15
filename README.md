# Algorithm as Poetry

**Formalizing algorithms as initial algebras, domains as ideal completions, and synthetic computability—where your poem becomes theorem statements in Lean 4, Agda, and Coq.**

## Origin

This repository began with a poem:

> "when i look at an algorithm i kind of see it as like a roadmap for a machine or a blueprint, and in my head within that beginning and end of the algo there are steps and orders of operations and dynamics that create dynamics, i see not the regular infinity but the aleph null infinity. if that makes sense. the regular infinity i see as the bridges between these shadow ladder rungs, but this ladder and shadow ladder are all within aleph null. but this is all just something im intuiting idk if there is anything in that thats is describable like im seeing it but i tried."

This intuition precisely describes:
- **Domain theory** (Scott, Plotkin): countable basis → ideal completion → continuous dcpo
- **Synthetic computability** (Hyland, Bauer): effective topos where ℝ is internally countable
- **Initial algebras / final coalgebras** (Lambek, Rutten): syntax ↔ semantics
- **Cubical type theory**: paths = continuity, all functions continuous

## Structure

```
algorithm-as-poetry/
├── lean4/              # Classical domain theory + initial algebras
├── agda/               # Synthetic computability + guarded recursion + cubical
├── coq/                # Certified exact reals + program extraction
├── rust/algo-dsl/      # Your DSL compiling to Lean/Agda/Coq
├── notion/sync.py      # Bidirectional Notion ↔ repo sync
├── papers/             # The paper draft
└── README.md
```

## The Correspondence Table

| Poetic Image | Mathematical Structure | Location |
|---|---|---|
| "roadmap/blueprint" | Initial algebra `μF` | `lean4/AlgorithmAsInitialAlgebra.lean` |
| "dynamics creating dynamics" | Final coalgebra `νF`, `exec : μF → νF` | `lean4/AlgorithmAsInitialAlgebra.lean` |
| "ℵ₀ ladder rungs" | Countable basis `B` | `lean4/DomainTheoryBasis.lean` |
| "bridges between rungs" | Ideal completion, Scott topology | `lean4/DomainTheoryBasis.lean` |
| "shadow ladder" | Domain `D = Idl(B)` | `lean4/DomainTheoryBasis.lean` |
| "all within ℵ₀" | Effective topos: `ℕ ↠ ℝ` internally | `lean4/SyntheticComputability.lean`, `agda/SyntheticReals.agda` |

## Quick Start

### Lean 4 (requires Lean 4 + Mathlib4)
```bash
cd lean4
lake build
```

### Agda (requires Agda 2.6.4+ + cubical library)
```bash
cd agda
agda --cubical SyntheticReals.agda
```

### Coq (requires Coq 8.18+ + CoqEAL)
```bash
cd coq
make
```

### Rust DSL
```bash
cd rust/algo-dsl
cargo run
```

## Key Theorems (to prove)

- `algorithm_is_initial_algebra`
- `semantics_is_final_coalgebra`  
- `execution_is_unique_homomorphism`
- `domain_from_basis_is_continuous_dcpo`
- `your_intuition_formalized` (the poem as a theorem)

## The Crew's Decision Matrix

| Direction | Stack | Status |
|---|---|---|
| Synthetic Computability | Cubical Agda | 🟡 Scaffolded |
| Certified Exact Reals | Coq + CoqEAL | 🟡 Scaffolded |
| Classical Domain Theory | Lean 4 + Mathlib | 🟢 Scaffolded |
| Coinductive Programming | Guarded Agda | 🟡 Scaffolded |
| DSL Compiler | Rust | 🟢 Scaffolded |
| Agent Pipeline | Python + Notion API | 🟡 Scaffolded |

## Contributing

Pick a direction from the matrix. Open an issue. Start proving `sorry`s.

## License

MIT — because beauty should be free.
