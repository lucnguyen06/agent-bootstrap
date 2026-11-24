# Project Bootstrap: Spec Kit & Skill Router

Read this file before starting work in this repository.

## 1. Mandatory Workflow: GitHub Spec Kit (Always On)

Every project uses **GitHub Spec Kit** (`specify` CLI) as the primary source of truth for specifications, plans, and tasks.

### Startup Gate
1. Check whether `.specify/` exists in the repository root.
2. If `.specify/` is missing, initialize Spec Kit before writing feature code:
   ```powershell
   specify init --here --non-interactive --script ps
   ```
   Verify installation with `specify check` if tools or integrations appear missing.
3. For every non-trivial feature, refactor, or architecture change, complete the Spec-Driven sequence in order:
   - **Constitution**: establish or review project principles in `.specify/`.
   - **Specify**: write or update the feature specification (requirements, acceptance criteria, edge cases).
   - **Plan**: produce the technical implementation plan against the spec.
   - **Tasks**: break the plan into ordered, verifiable tasks.
   - **Implement & Verify**: execute tasks against the spec and confirm every acceptance criterion passes.

**Completion criterion for Step 1**: `.specify/` exists and the active task maps to a written spec/plan before production code changes begin.

---

## 2. Project Stack Detection & Skill Selection

Before implementing, inspect repository manifests (`package.json`, `pyproject.toml`, `Cargo.toml`, `build.gradle*`, `pom.xml`, `*.sql`, `.github/workflows/`) and the user's request, then select **only** the skills that match the project stack and current task.

- Announce the selected skills in one short line when starting a new project or major task.
- Read each selected skill's `SKILL.md` before applying it.
- Local skill roots:
  - Standalone skills: `~/.gemini/config/skills/<name>/SKILL.md`
  - Plugin skills: `~/.gemini/config/plugins/<plugin>/skills/<name>/SKILL.md`

### Skill Routing Matrix

#### A. Universal Engineering (Any Project — Match by Task)
| Trigger / Branch | Skill | Path (relative to `~/.gemini/config/`) |
| :--- | :--- | :--- |
| Library/framework docs or API examples | `context7-mcp` | `plugins/context7/skills/context7-mcp/SKILL.md` |
| Stress-test a plan/design before speccing | `grilling` / `grill-me` | `plugins/mattpocock-skills/skills/grilling/SKILL.md` |
| Stress-test design + write ADRs & glossary | `grill-with-docs` | `plugins/mattpocock-skills/skills/grill-with-docs/SKILL.md` |
| Deep primary-source technical research | `research` | `plugins/mattpocock-skills/skills/research/SKILL.md` |
| Terminology, `GLOSSARY.md`, or ADRs | `domain-modeling` | `plugins/mattpocock-skills/skills/domain-modeling/SKILL.md` |
| Module boundaries, deep modules, seams | `codebase-design` | `plugins/mattpocock-skills/skills/codebase-design/SKILL.md` |
| Architecture audit & deepening report | `improve-codebase-architecture` | `plugins/mattpocock-skills/skills/improve-codebase-architecture/SKILL.md` |
| Throwaway prototype to test state/UI | `prototype` | `plugins/mattpocock-skills/skills/prototype/SKILL.md` |
| Test-first / red-green-refactor / integration tests | `tdd` | `plugins/mattpocock-skills/skills/tdd/SKILL.md` |
| Hard bugs or performance regressions | `diagnosing-bugs` | `plugins/mattpocock-skills/skills/diagnosing-bugs/SKILL.md` |
| Review diff against Standards + Spec | `code-review` | `plugins/mattpocock-skills/skills/code-review/SKILL.md` |
| Write a Pull Request body | `pr` | `plugins/mattpocock-skills/skills/pr/SKILL.md` |
| Multi-session roadmap / issue triage / handoff | `wayfinder` / `triage` / `handoff` | `plugins/mattpocock-skills/skills/<name>/SKILL.md` |
| Interactive human-only setup steps | `wizard` | `plugins/mattpocock-skills/skills/wizard/SKILL.md` |
| Edit `AGENTS.md`, `CLAUDE.md`, or `SKILL.md` | `writing-for-agents` | `plugins/mattpocock-skills/skills/writing-for-agents/SKILL.md` |

*(Additional workflow helpers in `plugins/mattpocock-skills/skills/`: `ask-matt`, `setup-matt-pocock-skills`, `to-spec`, `to-tickets`, `implement`, `implement-spec`, `to-questionnaire`, `retro`, `teach`, `wait-what`. Keep Spec Kit as the primary spec system when both could apply.)*

#### B. Security & CI/CD (Any Project with Git / Configs / GitHub Actions)
| Trigger / Branch | Skill | Path |
| :--- | :--- | :--- |
| Security diff review, blast radius, test gaps | `differential-review` | `skills/differential-review/SKILL.md` |
| Hardcoded secrets, fail-open flags, prod audit | `insecure-defaults` | `skills/insecure-defaults/SKILL.md` |
| Failing GitHub Actions PR checks (`gh`) | `gh-fix-ci` | `skills/gh-fix-ci/SKILL.md` |

#### C. Web Frontend, UI/UX & Motion (`package.json`, React/Vue/Next/Nuxt/HTML/CSS)
| Trigger / Branch | Skill | Path |
| :--- | :--- | :--- |
| Full UI/UX craft, critique, audit, polish, design system (`DESIGN.md`) | `impeccable` | `skills/impeccable/SKILL.md` |
| Distinctive visual direction & typography for new UI | `frontend-design` | `skills/frontend-design/SKILL.md` |
| Motion animations (React/Vue/Nuxt/shadcn/Radix/icons) | `animate-ui` | `skills/animate-ui/SKILL.md` |
| Web Interface Guidelines & UX/a11y compliance | `web-design-guidelines` | `skills/web-design-guidelines/SKILL.md` |

#### D. Browser Debugging & Web Performance (Chrome DevTools MCP)
| Trigger / Branch | Skill | Path |
| :--- | :--- | :--- |
| Live web debugging, network, browser automation | `chrome-devtools` | `plugins/chrome-devtools-plugin/skills/chrome-devtools/SKILL.md` |
| Accessibility audit (ARIA, focus, keyboard, contrast) | `a11y-debugging` | `plugins/chrome-devtools-plugin/skills/a11y-debugging/SKILL.md` |
| Slow page load / Core Web Vitals / LCP | `debug-optimize-lcp` | `plugins/chrome-devtools-plugin/skills/debug-optimize-lcp/SKILL.md` |
| Cookies, 401/403 auth redirects, SameSite, consent | `cookie-debugging` | `plugins/chrome-devtools-plugin/skills/cookie-debugging/SKILL.md` |
| JS/Node memory leaks, OOM, heap snapshots | `memory-leak-debugging` | `plugins/chrome-devtools-plugin/skills/memory-leak-debugging/SKILL.md` |
| Chrome DevTools MCP connection errors | `troubleshooting` | `plugins/chrome-devtools-plugin/skills/troubleshooting/SKILL.md` |

#### E. Android, Kotlin & Java (`build.gradle*`, `AndroidManifest.xml`, `pom.xml`)
| Trigger / Branch | Skill | Path |
| :--- | :--- | :--- |
| Native Android, Material 3, Kotlin/Jetpack Compose | `android-native-dev` | `skills/android-native-dev/SKILL.md` |
| `android` CLI for SDK/AVD/device management | `android-cli` | `plugins/android-cli-plugin/skills/SKILL.md` |
| Render Jetpack Compose `@Preview` functions | `compose-preview` | `plugins/android-cli-plugin/skills/compose-preview/SKILL.md` |
| Mirror/control AVDs & adb devices | `android-device-hub` | `plugins/android-cli-plugin/skills/device-hub/SKILL.md` |
| Android Espresso UI instrumentation tests | `espresso-skill` | `skills/espresso-skill/SKILL.md` |
| Java JUnit 5 + Mockito unit/integration tests | `junit-5-skill` | `skills/junit-5-skill/SKILL.md` |

#### F. Python, Rust & SQL
| Trigger / Branch | Skill | Path |
| :--- | :--- | :--- |
| Python tooling (`uv`, `ruff`, `ty`), scripts, migration | `modern-python` | `skills/modern-python/SKILL.md` |
| Idiomatic Rust, borrowing, `Result`, perf, tests | `rust-best-practices` | `skills/rust-best-practices/SKILL.md` |
| SQL queries (PostgreSQL, MySQL, BigQuery), reporting | `sql-queries` | `skills/sql-queries/SKILL.md` |

---

## 3. Execution Discipline
- Load only the skills matched in Section 2 to keep context focused.
- Keep Spec Kit artifacts in sync with implementation changes.
- Before finishing any task, verify tests/builds pass and run `code-review` or `differential-review` on significant diffs.
