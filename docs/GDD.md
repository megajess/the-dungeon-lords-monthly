# The Dungeon Lord's Monthly

**Game Design Document — v0.3**

*"Largely Factual Since Issue 7"*

---

## About This Document

This consolidates and supersedes two earlier documents:

1. `DungeonLordsMonthly_GDD.docx` (v0.1, March 2026) — correct on naming, superseded on engine
2. `DMM_Game_Concept.pdf` — richer on mechanics and characters, but used the old name

Where they conflicted, this document resolves it. Both originals are kept for reference (the sample publication copy in the PDF is still the best voice reference we have), but **this file is authoritative**.

**On the name:** always *The Dungeon Lord's Monthly* (DLM). An earlier draft used "Dungeon Master's Monthly"; that was changed to avoid trademark conflict with Wizards of the Coast. Any surviving "DMM" or "Dungeon Master" reference in older docs or sample copy is stale and should be corrected on sight.

**On the engine:** the original GDD specified SwiftGodot. That is superseded. The project is built in **Rust with the Bevy engine**.

---

## 1. Core Concept

A real-time dungeon management simulation in the spirit of Dwarf Fortress and RimWorld, with a Pratchett-esque comedic tone. You are not the hero clearing the dungeon — you run the dungeon, manage its incompetent monster workforce, and defend against hero raids.

The distinguishing hook is the **publication ecosystem**: nearly all information reaches the player through in-universe magazines, tabloids, and catalogs rather than conventional menus and HUD elements.

### Core Loop

- **Build** — excavate rooms, place traps, manage resources
- **Manage** — direct monsters who are enthusiastic, loyal, and not very good at their jobs
- **Defend** — survive raids from heroes with distinct personalities and motivations
- **Persist** — long-form play where the dungeon evolves and accumulates history

### Tone

*"What if Terry Pratchett designed a dungeon management sim?"*

The world takes itself entirely seriously; only the player is allowed to notice how funny it is.

**Influences:**
- **Terry Pratchett** — institutional satire, publications with agendas, bureaucracy staffed by people just trying to get through the week
- **Douglas Adams** — confident explanations that are mostly wrong
- **A. Lee Martinez** — weird premises treated with mundane seriousness. Gerald isn't funny *because* he's a goblin; he's funny because he's a middle manager
- **Dwarf Fortress** — emergent stories, "losing is fun"
- **RimWorld** — character-driven chaos, personality-based systems
- **Papers, Please** — UI as world-building
- **Master of Orion 2** — the between-turns news system that makes the world feel populated; also the hireable-leader mechanic (see §5)

### "Losing Is Fun"

Failure should be spectacular and worth retelling. DLM's coverage reframes losses as comedy, which cushions the blow and turns a setback into a story the player wants to share.

---

## 2. The Publication Ecosystem

All game information is delivered through in-universe publications. The player's "menu" is a reading desk.

### The Dungeon Lord's Monthly (DLM)

*"Largely Factual Since Issue 7"*

The core publication, available from the start. A scrappy tabloid — unreliable, entertaining, indispensable.

**Recurring sections:**

| Column | Tagline | Function |
|---|---|---|
| Crumplethwaite's Advice | "Occasionally Wrong, Never Uncertain" | Primary source of deliberately bad tips |
| The Minion Manager | — | Workplace grievances as management advice |
| Hero Rumors | "We Asked Around" | Advance intel, accuracy varies |
| Classifieds | "Probably Helpful" | Monster job listings, supply ads, needs signalling |
| News | "All The News We Could Verify In Time For Print, And Some We Couldn't" | World events |
| Letters | "Your Trusted Source For Most Things" | Reader correspondence |
| Retractions & Clarifications | — | Comedy, world-building, and strategy warnings at once |

### Better Dungeons and Lairs (BDL)

*Better Homes & Gardens for evil overlords.* Glossy, aspirational, slightly out of your price range. Design showcases, product reviews, interviews with successful dungeon lords. **Unlocks mid-game.**

### The Quarterly Review

Same publisher and voice as DLM, but longer-form and retrospective. Arrives every three in-game months as a noticeably thicker issue. Seasonal retrospectives, extended Crumplethwaite essays (more wrong, in greater depth), dungeon-of-the-quarter awards, deep investigative pieces.

The fourth-quarter issue is the annual edition: year in review, Dungeon Lord awards (including "Most Spectacular Failure"), and Crumplethwaite's predictions for the coming year, all of which are wrong.

### The Dungeonist

*The Economist, but underground.* The only publication that is actually accurate. Expensive, respected, sources verified. **Unlocks late game.**

Serves as the "graduate from tabloid to real news" progression reward. Comparing DLM's rumors against The Dungeonist's facts is often illuminating and occasionally horrifying.

**Unlock requires both:**
- A minimum dungeon reputation threshold — the dungeon must be notable enough to warrant serious coverage
- A monetary cost — serious journalism is expensive

The reputation gate exists specifically to prevent grinding gold to skip mid-game progression.

### Ye Olde Dungeon Depot Catalog

The shopping interface, available from the start. Mail-order catalog framing with limited stock, seasonal sales, and back-orders. Product copy in the same unreliable voice as DLM's classifieds.

### Unlock Progression

- **Early:** DLM + Catalog. Chaotic and unreliable. Players learn by reading between the lines and surviving Crumplethwaite's advice.
- **Mid:** Quarterly Reviews begin; BDL becomes available. More variety, longer-term strategic perspective, aspirational design goals.
- **Late:** Everything, plus The Dungeonist. Cross-referencing tabloid rumor against verified fact is the mechanical payoff for building a reputable dungeon.

---

## 3. Mechanical Integration

The publications are not flavor wrapped around a UI — they *are* the UI.

**Tutorial** — framed as a complimentary welcome package for subscribing to DLM, including *"So You've Decided to Become an Evil Overlord: A Practical Guide"* by Crumplethwaite. Contains deliberately bad advice; teaches through failure.

**Economy** — the Ye Olde Dungeon Depot catalog replaces a shop menu. Stock rotates based on what the game thinks you need, making it both procedural and quietly helpful.

**Monster needs** — instead of a popup reading `WARNING: Goblins lack torches`, a classified ad appears: *"Seeking adequate lighting solutions, current working conditions described by colleagues as 'a bit murdery.'"*

**Hero intelligence** — DLM provides advance warning of raids, but as unreliable tabloid journalism. Accurate intel is a late-game unlock. This creates a natural progression from chaos to informed strategy.

**Raid telegraphing** — major raids are foreshadowed through stories about heroes defeating *other* dungeons. Days later, that hero arrives at yours, battle-tested.

**Retractions** — when Crumplethwaite's advice fails spectacularly somewhere, it's covered as a retraction, which simultaneously provides information about other dungeons and warns the player off bad strategies.

### Notable Events Column

A recurring DLM column covering dramatic outcomes. **Sourcing order:** the player's own dungeon first, community content second. A pit trap that finally claimed a victim should be DLM-worthy before the player sees anyone else's highlights.

**The column's tone matches the event, not a house style** — each issue reads like a different writer filed it, which fits DLM's understaffed editorial reality.

| Event type | Tonal register |
|---|---|
| Elaborate trap chain (Rube Goldberg) | Breathless, sensational. "Our reporter was on the scene." Front page. |
| Hero self-sabotage | Dry, deadpan, almost pitying. The facts speak for themselves. |
| Minion accidentally saves the day | Confused, slightly defensive. Pride and embarrassment in unclear proportion. |
| Sheer dumb luck | Conspiratorial. "We're not saying it was divine intervention but we're not *not* saying it." |
| Overwhelmed by numbers | Clinical and corporate, written like an HR incident report. |
| **Epic dungeon victory over a notable hero** | **Triumphant, front-page. A distinct register from the defeat categories.** |

Crumplethwaite's sidebar shifts to match: effusive praise for spectacular defeats, quiet devastation for hero blunders (a single italicised sentence, possibly just *"I see."*). The Minion Manager columnist wants a quote credit regardless of what happened.

**Data model implication:** the underlying event type should represent a *notable dungeon outcome* generally, tagged with type and tone — not "defeat" as the only case.

---

## 4. Characters

### Barnabas Crumplethwaite III — fixed, not randomized

DLM's advice columnist and tutorial-guide author. Pompous, confidently incorrect, long-retired. His dungeon fell decades ago under embarrassing circumstances he does not acknowledge. Outdated advice delivered with absolute certainty.

He is a masthead character *external* to the player's dungeon, so unlike foremen and heroes he is **the same every playthrough**.

> *"Many successful dungeon lords find that a large, centrally located treasure pile serves multiple purposes: it motivates your workforce, impresses visiting dignitaries, and provides an attractive focal point for any dungeon space."*

### The Minion Manager — a role, not a person

The freelance-foreman columnist archetype (originally written as "Gerald"). Desperately professional, perpetually between jobs, put-upon. Files eyewitness accounts that contradict themselves halfway through. Always wants a quote credit.

The column appears in whichever publication will pay the freelance fee that month, which explains its tonal inconsistency:
- **In DLM** — news and grievances
- **In BDL** — lifestyle and self-help framing (he is pretending)
- **In The Dungeonist** — analytical deep dives into dungeon labor economics (he has a spreadsheet now)

The columnist is drawn from the same foreman roster the player hires from (§5), which means the player may recognise — or have employed — the author.

### Heroes — a roster, not a person

Sir Billiam Wrigglesworth Jr. the Third is *one example instance* of a recurring powerful hero, not a unique character. Heroes are generated from a pool of archetypes with rolled names, personalities, and stats.

**Hero archetypes:**
- **Noble's Son** — charges recklessly; ego-based morale
- **Battle-Hardened Knight** — learns dungeon layouts; retreats strategically
- **Greedy Rogue** — baitable with treasure; low combat motivation
- **Traumatized Adventurer** — great stats, unpredictable morale breakpoints

Recurring heroes build cross-dungeon narrative continuity: they appear in DLM coverage defeating other dungeons before arriving at yours, more dangerous each time.

### Dragon Local 7

A monster union run by a dragon with ulterior motives — it unionized monsters not from altruism but to control the labor supply. Can attempt to unionize your workforce. Has excellent legal representation.

Mechanically, the union gives low morale somewhere to *go*: union reps are a channel where workforce grievances get politicized rather than reported neutrally.

---

## 5. Workforce & Delegation

### Incompetent Monsters

Monsters are not interchangeable units. They are enthusiastic idiots with quirks requiring active management:

- **Overconfident Goblin** — charges alone at powerful heroes
- **Distracted Troll** — wanders off if something shiny appears
- **Anxious Skeleton** — rattles loudly, alerting heroes to its position
- **Overly Friendly Slime** — tries to follow the hero around

### Jobs

Work is expressed as **typed jobs**. Excavation is one kind among several, not the general case that the others specialise from.

**Initial taxonomy:**

| Kind | What it covers |
|---|---|
| Excavate | Digging out rock. The first kind implemented |
| Build | Constructing traps, devices, furniture, fortifications |
| Haul | Moving items from where they are to where they're wanted |
| Clean | Upkeep and maintenance. The archetypal job nobody wants |
| Fight | Attack and defence during raids |

The list will grow. What matters is that job kind is a **first-class, enumerable property** rather than something inferred from context — because wants attach directly to it. "Grelda likes mining" is a preference *about a job kind*, and it cannot be expressed at all if excavation is the only thing the system knows how to name.

**Jobs come from several sources, and the job system should not care which:**

- **Player designation** — marking tiles or objects for work
- **Standing orders** — ongoing policy ("keep the stores stocked")
- **Needs** — a hungry monster generates demand for a job that feeds it
- **Events** — a raid generates Fight jobs

**Lifecycle:** created → queued → claimed by a monster → executed over game time → completed, interrupted, or abandoned. Abandonment is not an error case. It is what happens when morale breaks, a raid interrupts, or a foreman reassigns — all of which are normal.

**Design rule:** adding a job kind should mean one new variant plus its execution behaviour. If it requires changes across unrelated systems, the abstraction is wrong.

### Foremen: a hireable roster

Foremen are a **pool of hireable NPCs**, in the style of Master of Orion 2's planetary and ship leaders. Each rolled instance has a name, a personality, and **stats determining how well or poorly they do the job** — competence, cost, and possibly a specialty or quirk.

### The Delegation Arc

This is a core mechanical progression, not flavor:

- **Early game** — the player manages individual monsters directly. Tactile, hands-on, Dwarf-Fortress-style.
- **As the dungeon grows** — the player hires foremen to manage groups, and shifts to giving orders at the foreman level.
- **Direct micromanagement becomes optional, not removed.** The shift from chaos to delegation should feel earned.

Foreman hiring, firing, and matching strengths to horde needs becomes its own resource-management layer — and gives Dragon Local 7 something to threaten.

### Wants & Needs

Morale is driven by **wants and needs**. These are the inputs; morale is the output. Nothing drifts on its own.

#### Needs — large magnitude, derived from kind

A need produces **a penalty when violated and nothing when satisfied.** No monster is delighted to not be starving. This asymmetry is deliberate: needs are the floor, never a source of upside.

Needs come in two mechanically distinct shapes:

- **Condition needs** — evaluated continuously against the monster's surroundings. Light level, temperature, sunlight exposure, crowding. A troll forced to work in the sun is violating a condition need every moment it lasts.
- **Depleting needs** — a meter that drains over game time and is refilled by an action. Food, water, rest. These are notable because they **generate jobs**: a hungry monster creates demand for work that feeds it, closing a loop between the two systems.

Needs are **resolved from monster kind at spawn and then stored on the individual.** There is no universal need set — skeletons neither eat nor drink, and the starting roster contains one. Storing the resolved list per-monster, rather than looking it up from kind at evaluation time, leaves room for individuals to deviate later (an unusual tolerance, a mutation, a defector) without special-casing.

#### Wants — small magnitude, individual, signed

A want is a personal preference, not a property of the species. Two trolls can want opposite things.

Wants are **signed**. A positive want gives a small bonus while the monster is engaged with its subject; an **aversion** gives a small penalty while engaged. Neither does anything when the monster is not engaged.

| Modifier | Applies when | Effect | Otherwise |
|---|---|---|---|
| **Need** — troll must stay out of sunlight | Working in sunlight | Large penalty | Nothing. Shade is baseline, not a reward |
| **Want** — likes mining | Doing excavation work | Small bonus | Nothing |
| **Aversion** — hates cleaning | Doing cleaning work | Small penalty | Nothing |

Representing an aversion as a negative-magnitude want, rather than a separate type, keeps "not cleaning earns no bonus" a property of the model instead of a special case. It also gives a natural intensity spectrum for free — mildly likes, loves, dislikes, loathes is just magnitude.

**Want subjects** begin with job kinds and will extend: locations, equipment, specific co-workers, possibly which publications the dungeon subscribes to.

*(The split is roughly Herzberg's hygiene-versus-motivator distinction, which is a fitting thing to find at the bottom of a game about workplace management.)*

#### Wants are not quirks

`Quirk` and want are **separate axes and must stay separate.** A quirk modifies *behaviour* — the Overconfident Goblin charges heroes alone, the Distracted Troll wanders off. A want modifies *morale*. There is genuine overlap pressure (Distracted could plausibly be written as a want), but merging them would force every behavioural quirk to carry a morale value and every preference to carry a behaviour.

### Morale

**Morale is derived, not stored.** Each tick it is recomputed as a baseline plus the sum of currently-active modifiers from wants and needs. Nothing nudges a running total.

**The list of active modifiers is retained, not just the sum.** This is the load-bearing part, and the reason is not tidiness — that list has three separate consumers:

1. **The morale value itself** — the sum
2. **Direct inspection** (see Three Channels, below) — ground truth, as itemised reasons
3. **The publication layer** (§3) — the classified ad reading *"Seeking adequate lighting solutions, current working conditions described by colleagues as 'a bit murdery'"* **is an unmet need rendered as prose.** So is a foreman's report: a personality can only distort a list of grievances, not a scalar.

If morale were a single accumulating float, all three would have to reconstruct the reasons from nothing.

**Strain is unchanged — pressure buildup, not random rolls.** Monsters tolerate bad conditions for a while, but sustained low morale accumulates *strain*. That accumulation escalates through a ladder the player can learn to read: minor grumbling and friction, then overt problems (fights, refused orders), then serious outbursts. Never a surprise flip from fine to broken.

### Three Channels for Reading Morale

Foremen are the player's morale-sensing interface, and its reliability scales inversely with convenience:

| Channel | Cost | Reliability |
|---|---|---|
| **Ambient/emergent signals** — fights, sabotage, refused orders, desertion | Free, low-attention | Always true, but coarse |
| **Foreman report** — aggregated read on everyone under them | Cheap, scales well | **Distorted by the foreman's personality** |
| **Direct monster inspection** | Expensive, doesn't scale | Ground truth |

**The distortion is the point.** A pessimistic foreman underreports; an oblivious one misses real problems; a perceptive one gives an accurate picture. This uses the same personality mechanism as content generation, applied to diegetic status reporting.

**The ambient channel is what gives the distortion teeth.** Without a competing ground-truth signal, an unreliable report is just flavor text — the player would have no reason to distrust it. The world leaks the truth regardless of what the foreman says.

The tedium of direct inspection is **intentional**. It is what makes hiring a genuinely perceptive foreman valuable rather than cosmetic.

---

## 6. Progression: Two Parallel Systems

Research and publication blueprints are **separate, non-redundant systems** — not two roads to the same tree.

### Research Station

The baseline tech tree. Player-directed, steady, predictable.

### Publication Blueprints

A different tier: *special* items, gated behind reading and choice rather than research investment.

**Reliability scales with publication tier**, consistent with voice everywhere else:
- **DLM** — lower-tier, sometimes ridiculous blueprints that can backfire and cause as much harm as help
- **BDL / Quarterly / The Dungeonist** — increasingly useful and reliable

**Each issue offers two slots:**

**Slot 1 — always a guaranteed, learnable item.** No gating, no randomness. The reliable baseline.

**Slot 2 — variable.** One of:
- Another normal learnable item
- A modest flat research-point boost
- **A prerequisite-gated item** (rare; powerful items only)
  - If the player meets the tech-tree prerequisite → learnable normally
  - If not → choosing it converts to a **randomized** research-point payout, ranging from small to very large

That randomized payout is deliberately a gamble rather than a fixed discount. It gives players a real reason to reach for gated items speculatively, chasing a jackpot — which suits an ecosystem where nothing is quite reliable.

**Unchosen blueprints are reposted in future issues**, never permanently lost. Skipping a risky DLM item for safe research points is a deferral, not a missed chance.

The Dungeonist may allow picking more than one blueprint per issue as a late-game perk.

---

## 7. Starting Scenarios

Three planned starts. All are **configurations of the same systems**, not distinct content paths.

1. **Inherited mine** — a wealthy relative's dungeon, running smoothly but old and outdated. Expand and modernize.
2. **Bought a rundown dungeon** — sold cheap by someone getting out of the business. Unhappy mobs, broken equipment. Same goal, worse position.
3. **Start from scratch** — nothing but a handful of starter minions. Hardest mode. Most heroes ignore you until you cross a threat threshold, but nearby villagers may attack before then.

**Reputation is a single shared stat.** Scenario 3 starts at 0; scenarios 1 and 2 start higher (but not too high). Every reputation-gated system — The Dungeonist's unlock, the hero-vs-villager threat threshold — reads that one stat. Publication unlock thresholds are raised to account for the higher starting values.

**Architecture note:** starting state must be built from a data structure passed into world setup, never inline startup logic. Adding scenarios 1 and 2 later should mean writing two more config constructors, not refactoring game initialization.

---

## 8. Procedural Content

The game needs a large volume of generated text across publication types. The approach is **modular Mad-Libs templates** with typed slots:

```
"{DungeonLord} Reports {Percentage}% Increase in {Monster} Productivity After {Solution}"
```

→ *"Lord Grimfang Reports 40% Increase in Goblin Productivity After Free Torch Distribution"*
→ *"The Dread Baron Reports -15% Increase in Troll Productivity After Complimentary Beetles"*

The humor comes from voice consistency plus unexpected juxtaposition.

### Voice Markers

| Source | Voice |
|---|---|
| Crumplethwaite | Pompous, outdated terminology, absolute certainty, subtle defensiveness |
| The Minion Manager | Professional, put-upon, desperate optimism, bureaucratic precision |
| DLM News | Tabloid speculation, hedging, buried admissions |
| BDL | Aspirational, trend-focused, professional but accessible |
| The Dungeonist | Dense, analytical, academic; makes simple things complex |

### Content Priorities

1. Core DLM templates (news, advice, classifieds) — highest volume, most visible
2. Catalog product descriptions — essential for economy
3. Tutorial guide content — critical for onboarding
4. BDL lifestyle content — secondary flavor
5. The Dungeonist analysis — mid/late unlock

**Initial target:** 200–300 templates. Quality bar is "generates multiple funny permutations," not "one perfect output."

---

## 9. Online Component (Future)

Publications could carry news from other players' dungeons — legendary streaks, improbable victories, spectacular failures becoming shared mythology. Asynchronous and non-competitive.

**Architecture: design the seam now, build the feature later.**

Define a source that returns a list of noteworthy events. The template, tone-matching, and column systems consume that list and don't care where it came from. Local play pulls from the player's own dungeon; the online version is the same data shape from a different source.

**Do not build networking now.** And do not omit the column until online exists — procedural generation from the player's own dungeon is load-bearing regardless, since own-dungeon events are the primary source anyway.

---

## 10. Technical Architecture

**Engine:** Rust + Bevy. See `CLAUDE.md` for current dependency versions and implementation conventions.

### Two UI Modes

**1. Live game view** — the dungeon map. Conventional sprite/tile rendering with direct manipulation: designate rooms, place traps, assign monsters. Modeled on Dwarf Fortress (Steam edition) and RimWorld. **Deliberately not wrapped in publication theming** — direct manipulation needs to be fast and tactile, and skinning it as a magazine would fight the gameplay.

**2. Reading desk** — a separate mode for publications, catalog, and advice columns. This is where the publication conceit lives.

A persistent ticker or notification ("New issue of DLM has arrived") bridges the two so publications don't feel bolted on.

### Reading Desk Rendering: Phased

**Now — egui placeholder.** Fast to iterate, minimal boilerplate. It is a tool-panel UI, not a page-layout engine: it will not produce the physical-magazine look (text wrapping around images, aged-paper textures, per-publication masthead typography).

**Later — custom rendering.** Once the content pipeline is proven, replace the reading desk's renderer with something offering real page layout: custom Bevy UI, or pages as styled textured quads.

The swap is deliberately contained. The reading desk is its own module, so replacing its renderer should not touch sim logic or the publication data model. **Get the template engine, content, and unlock logic working and playtested before investing in visual page design.**

---

## 11. Extension Points & Design Procedure

This project is early, and new design elements will keep arriving. This section exists so that absorbing them is routine rather than a renegotiation each time.

### The Axes

The game grows along a known set of axes. When a new idea appears, the first question is: **does it slot into an existing axis, or is it a new one?**

| Axis | Current members |
|---|---|
| Job kinds | Excavate, Build, Haul, Clean, Fight (§5) |
| Need kinds | Light level, temperature, sunlight exposure, food, water, rest (§5) |
| Want subjects | Job kinds now; locations, equipment, co-workers later (§5) |
| Morale modifier sources | Wants, needs; later events, foremen, union pressure (§5) |
| Tile properties | Rock/floor now; light level, exposure, cleanliness later |
| Monster kinds | Goblin, Troll, Skeleton, Slime (§5) |
| Quirks | Overconfident, Distracted, Anxious, Overly Friendly (§5) |
| Hero archetypes | Noble's Son, Battle-Hardened Knight, Greedy Rogue, Traumatized Adventurer (§4) |
| Foreman personalities | Pessimistic, oblivious, perceptive (§5) |
| Publications & columns | DLM, BDL, Quarterly, The Dungeonist, Catalog (§2) |
| Content templates | Mad-Libs slots (§8) |
| Starting scenarios | Three planned (§7) |
| Blueprint items | Publication-gated specials (§6) |

**Slotting into an existing axis is data** — an afternoon's work, no discussion needed. **A new axis is architecture** — worth a conversation before anything is written.

### The Design Test

Adding to an axis should mean **one new variant plus its behaviour.** If it requires touching several unrelated systems, the abstraction is wrong and should be fixed *before* the content is added.

Cheap extension is the entire point. It is what lets the design keep moving without the codebase resisting, and it is the standard every axis above should be held to.

### Procedure for a New Element

1. **Write it into this document first, in full generality.** Prose before code — prose is where you notice that "needs" is actually two different mechanisms wearing one name.
2. **Record build conventions in `CLAUDE.md`, not here.** This document says what the game *is*; `CLAUDE.md` says how it is *built*. Keeping that split clean is what stops the GDD turning into a spec.
3. **Log non-obvious decisions in `docs/decisions/`.** Short entries: context, decision, consequences. This is what prevents a settled call being silently re-litigated months later.
4. **Build one vertical slice, not the whole axis.** Design the taxonomy in full; implement a single instance end to end. The document holds the shape so the code doesn't have to guess at it.

---

## 12. Open Questions

- Does foreman personality affect flavor text only, or also light mechanics (a competent foreman genuinely reducing mismanagement events)?
- Does the Minion Manager columnist have an arc across a playthrough — does he eventually land steady employment? Does the player have agency over this?
- BDL's unlock cost vs. utility curve needs tuning: it should feel like a treat, not a necessity.
- The Quarterly Review's relationship to performance data — could it deliver season-end rewards or rankings, making its arrival mechanical as well as narrative?
- Working title for the notable-events column. DLM's house style would give it something more sensational: "The Ignominious Exit", "Fallen and Can't Get Up", "This Month's Most Spectacular Failure", "The Dungeon's Finest Hour" (told from the dungeon's POV), "In Memoriam... Just Kidding, They Respawned".
- Are wants fixed at spawn, or can they change over a playthrough? A monster who grows to love mining after years of it is a good story; a monster whose preferences shuffle randomly is noise.
- Can needs ever be permanently altered — by research, equipment, or events? A troll with a parasol is funny and mechanically interesting, but it makes kind-derived needs mutable.
- Relative magnitude of needs versus wants. "Larger" is settled; the actual ratio is a tuning question that needs play to answer.
- Do foremen claim jobs on behalf of their monsters, or only influence which jobs get queued? This determines whether the delegation arc (§5) changes the job system or just sits on top of it.
- Should a monster refuse an aversion job outright at low morale, rather than merely suffering through it? Refusal is a more legible signal, but it takes agency away from the player at exactly the wrong moment.
