# CLAUDE.md

Standing context for Claude Code working on this repo.

## The Project

**The Dungeon Lord's Monthly** (DLM): a real-time dungeon management sim in the Dwarf Fortress / RimWorld lineage, with a Pratchett-esque tone. You run the dungeon and manage an incompetent monster workforce, and nearly all information reaches the player through in-universe publications.

The game is being **rewritten in Common Lisp (SBCL)** with an **SDL3** backend, targeting macOS, Linux and Windows. SBCL is the only supported Lisp.

- **`docs/GDD.md`**: what the game *is*. Authoritative on design. Its preamble and §10 still describe the old Rust + Bevy / egui stack; that part is stale.
- **`docs/ROADMAP.md`**: where the build *is*: next steps, decisions so far, open items, session log. **At the start of every session, read its "Next Up" section.** Update it as parts are finished.

Always *The Dungeon Lord's Monthly* / DLM. Any "Dungeon Master's Monthly" / "DMM" is a stale name (trademark conflict) and should be corrected.

## How We Work

**Use the role-play skill (`anthropic-skills:role-play`) in Professor mode for every session in this project.** Treat Professor mode as active from the start of the session, as if `/anthropic-skills:role-play professor` had been run, so `/anthropic-skills:role-play current` reports **Professor**. It stays active until I name another mode or ask to exit.

What that means here:

- **I write the code; Claude reviews it.** Before each part, Claude gives guidance (concepts, the shape of what to write, gotchas) but doesn't write the source files. Claude edits files only when I explicitly ask (docs like this one, one-off chores such as converting tabs).
- **Compare concepts to Swift**, my day-job language, not Rust.
- **Include a worked example from a different domain** in the guidance: a short example that uses the same Lisp idioms the task needs (like the coat-check example used for the ECS world), followed by a table mapping each piece onto the real task, then a checklist. Use a different domain each time, and don't let it become the solution.
- **Build understanding incrementally.** Check that a concept has landed before moving on; correct a right answer reached for the wrong reason.
- **Reviews:** load the code in a fresh SBCL and run the checks rather than reviewing by eye alone. Report problems most important first.
- My Lisp is rusty: I studied it a long time ago and have only written small things since. Expect gaps around packages, ASDF, CLOS, conditions/restarts and macros, and explain them as they come up.

## REPL Loop (Emacs + SLIME)

1. `M-x slime`
2. `(ql:quickload :dlm/ecs)`: loads every file in `.asd` order (`dlm.asd` also defines `dlm`, which depends on `dlm/ecs`)
3. Set the REPL package: `C-c M-p` → `dlm.ecs`
4. Edit, then `C-c C-c` (one form) or `C-c C-k` (whole file)
5. Use `setf`, not `defvar`, to replace a REPL variable: `defvar` never reassigns

The repo root is registered with Quicklisp via `ql:*local-project-directories*` in `~/.sbclrc`. If a new system isn't found, `(ql:register-local-projects)`.

## Layout

```
dlm.asd               systems: dlm (the game, depends on dlm/ecs), dlm/ecs
src/ecs/package.lisp  the dlm.ecs package and its exports
src/ecs/world.lisp    world, entities
```

## Conventions

The reasons behind these are in `docs/ROADMAP.md` → Decisions So Far.

- **The ECS knows nothing about DLM.** `dlm/ecs` and the `dlm.ecs` package depend on nothing from the game, so they can become a library later.
- **The ECS interface hides its storage.** Callers use the exported functions; world internals and the component registry stay unexported.
- **Package names carry the `dlm.` prefix** (package names are global to the image).
- **Accessors are prefixed with their class name** (`world-entities`), since accessors are generic functions shared across the package.
- **Prefer `defclass` over `defstruct`** for anything that may change while the game runs: CLOS updates live instances on redefinition; structs don't.
- **Anything that holds state must survive recompiling.** Use `defvar` for registries and global state; definition macros must be idempotent.
- **Create a new object per entity** for mutable component values; never share one instance or a quoted literal.
- **Docstrings say what a function returns**, and explain *why* for non-obvious behaviour.
- **Indent with spaces**, Emacs-style; no tabs.
- Prior work for reference, not to port as is: the Rust/Bevy version at `~/code/dungeon_lords_monthly` (its `CLAUDE.md` and `docs/decisions/` hold design rules that still apply) and the SDL3 POC at `~/code/dc-poc/sdl3` (its REPL/live-coding workflow is the valuable part).
