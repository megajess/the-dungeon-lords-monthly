# Roadmap & Session Log

Where the Common Lisp rewrite stands, what comes next, and what was decided along the way. **Read "Next Up" first when starting a session.**

`docs/GDD.md` says what the game *is*; `CLAUDE.md` says how we work and the build conventions; this file tracks *where the build is*.

---

## Next Up

### Part 3: Components ← **start here**

Build component registration and storage in `src/ecs/` (new file, e.g. `components.lisp`, added to `dlm.asd` after `world.lisp`).

- [ ] **Registry:** a global table of defined component types. Use `defvar` so recompiling doesn't wipe it.
- [ ] **`define-component`:** the first macro in the project. Registers a component type, and must be **idempotent**: re-evaluating it updates the registration and never loses data.
- [ ] **`add-component` / `get-component` / `remove-component`**
  - **Strict on type:** an unregistered component name signals an error (catches typos like `'moral`).
  - **Lazy on storage:** a registered type with no table in this world gets one created when first needed.
  - All table lookups go through **one internal function**, so "missing table" always means "empty table".
- [ ] **`gethash`'s second value:** `get-component` must tell "has the component, and its value is `nil`" apart from "doesn't have the component".
- [ ] Add a `:description` to the `"dlm"` system in `dlm.asd` (optional).

### Part 4: Queries and systems (concepts first, then code)

- Finding every entity with components A *and* B over hash tables: which table to iterate.
- Adding or removing components **while iterating** (a real hazard).
- How systems are registered and ordered.

### Later

- Component-value conventions in practice: `defclass` by default, plain values for markers and single IDs, avoid `defstruct`; a new object per entity for anything mutable.
- A debug check that reports **dangling entity references** (needs entity references to have their own type).
- Bring over the POC's REPL workflow: main-thread task queue, restarts in the game loop, swank dev mode.
- SDL3 backend and our own immediate-mode UI.
- The game proper: grid, monsters, jobs, …

---

## Decisions So Far

| Decision | Choice | Why |
|---|---|---|
| Build order | ECS first, then the game | Wanted our own ECS in Lisp |
| Rust code | Restart, don't port | It was foundation and experiments |
| UI | Leaning toward our own on SDL (not final) | |
| Storage | One hash table per component type, behind an interface | Simple; plenty fast for a few thousand entities; can become sparse sets later without game code changing |
| Entity IDs | Counter that only goes up, starts at 1; never reused | Stale references stay detectable; saving means saving one counter |
| Liveness | The world tracks live entities explicitly (`world-entities`) | An entity with zero components is still alive |
| Death | The game destroys entities explicitly; references check `entity-alive-p` | The game decides death; references find out about it. Matches one-way claims. Reference counting was considered and rejected: it keeps dead heroes "alive" |
| `destroy-entity` | Idempotent; returns T if the entity was alive | Two systems may kill the same entity in one tick |
| Component values | `defclass` by default | Live redefinition updates existing instances; `defstruct` doesn't |
| Component types | Must be registered with `define-component` | Typos signal errors instead of silently returning `nil` |
| Schema vs data | Global registry; per-world counter, entities and tables | Fresh games, test worlds, save/load |
| ECS independence | `dlm/ecs` system and `dlm.ecs` package depend on nothing from DLM | Can be lifted out as a library later |

---

## Open Items

- `docs/GDD.md` still says **Rust + Bevy / egui** in its preamble and §10, and points at a `docs/decisions/` that doesn't exist in this repo yet (the Decisions So Far table above could become its first entries).
- Decision 0006 from the Rust repo relied on rustc's exhaustive `match`. Lisp's `ecase` only fails at runtime, so we need another way to keep that guarantee (or decide to give it up).
- Save-file versioning: what happens when a save mentions a component type that was renamed or removed.
- Emacs: re-indent-on-save hook suggested (`before-save-hook`, buffer-local, in `lisp-mode-hook`). Not yet confirmed as added.

---

## Session Log

### 2026-10-01 – 2026-10-02

- Read the GDD, the old PDFs, the Rust project and the SDL3 POC.
- ECS design lessons: what an ECS is, storage trade-offs, entity identity, stale references, why not reference counting, components in Lisp (aliasing, literals, `defclass` vs `defstruct`), registration and schema vs data.
- **Part 1 done:** `dlm.asd` (`dlm` + `dlm/ecs`), `src/ecs/package.lisp`, `.gitignore`, `.sbclrc` local-project path. Commit `85c4b25`.
- **Part 2 done:** `src/ecs/world.lisp`: `world` class, `make-world`, `make-entity`, `entity-alive-p`, `destroy-entity`. Commit `fdccdae`.
- Learned along the way: ASDF requires the primary system (`dlm`) to be defined alongside `dlm/ecs`; a docstring alone is a return value; `declare ignore` only silences an unused-variable warning; `when` vs one-armed `if`.
