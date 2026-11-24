# Agent Project Bootstrap

> **[English](./README.md)** | **[Tiếng Việt](./README.vi.md)**

A lightweight, portable **AI Agent Bootstrap & Skill Router** repository that enforces **GitHub Spec Kit** (always on) and automatically selects stack-appropriate **Agent Skills** for any project — compatible with **Antigravity (Gemini), Claude Code, OpenAI Codex CLI, Gemini CLI, GitHub Copilot, Cursor, Windsurf, OpenCode, Zed, and Roo**.

---

## Purpose — Why This Exists

When working across multiple projects and multiple AI coding agents, two problems happen repeatedly:

1. **Agents skip planning and jump straight into editing code**, causing architectural drift, missed edge cases, and inconsistent workflows across tools.
2. **Loading every installed skill on every turn wastes context**, while manually copying prompt rules into every repository is tedious and quickly goes out of sync.

**Agent Project Bootstrap** solves both from a **single source of truth (`AGENTS.md`)**:
- **Always-on Spec-Driven Development**: Every AI agent checks for `.specify/` and runs the **GitHub Spec Kit** workflow before writing production code.
- **On-Demand Stack-Based Skill Routing**: Agents inspect the repository's manifests (`package.json`, `pyproject.toml`, `Cargo.toml`, `build.gradle*`, `pom.xml`, `*.sql`, `.github/workflows/`) and read **only** the `SKILL.md` files relevant to that stack and task.

---

## Who & What Is It For?

- **Multi-AI developers** who switch between Antigravity, Claude Code, Codex, Cursor, Windsurf, Gemini CLI, or Copilot and want identical engineering discipline across all of them.
- **Multi-stack codebases**, covering:
  - Web Frontend, UI/UX design systems & motion (React, Vue, Next.js, Nuxt, shadcn/ui, Tailwind)
  - Live browser debugging, accessibility & Core Web Vitals (Chrome DevTools MCP)
  - Native Android (Kotlin, Jetpack Compose, Material 3, Espresso) & Java (JUnit 5 + Mockito)
  - Modern Python (`uv`, `ruff`, `ty`), idiomatic Rust, and SQL analytics
  - Security diff reviews, insecure-default audits, and GitHub Actions CI debugging
- **Solo engineers & teams** who want either **zero-copy global auto-loading** on their machine or a **GitHub Template** for new repositories.

---

## Full Feature Breakdown

### 1. Mandatory GitHub Spec Kit Gate (Always On)
Defined in Section 1 of [`AGENTS.md`](./AGENTS.md):
- Checks whether `specify` (`github/spec-kit`) is installed; provides the `uv tool install` fallback if missing.
- Checks for `.specify/` at the project root and initializes it (`specify init --here --non-interactive --script ps`) before feature implementation.
- Enforces the 5-stage Spec-Driven sequence for non-trivial changes:
  `Constitution` → `Specify` → `Plan` → `Tasks` → `Implement & Verify`.

### 2. Automatic Stack Detection & 6-Domain Skill Router (50 Skills)
Defined in Section 2 of [`AGENTS.md`](./AGENTS.md), routing across **13 standalone skills** and **4 plugins (37 skills)**:

| Domain | Auto-Detection / Triggers | Routed Skills |
| :--- | :--- | :--- |
| **A. Universal Engineering** | Any repo (task-based: docs, planning, TDD, debugging, review, PRs) | `context7-mcp`, `grilling`, `grill-me`, `grill-with-docs`, `research`, `domain-modeling`, `codebase-design`, `improve-codebase-architecture`, `prototype`, `tdd`, `diagnosing-bugs`, `code-review`, `pr`, `wayfinder`, `triage`, `handoff`, `wizard`, `writing-for-agents` *(+ 10 workflow helpers)* |
| **B. Security & CI/CD** | Git repos, config audits, `.github/workflows/` | `differential-review`, `insecure-defaults`, `gh-fix-ci` |
| **C. Web Frontend, UI/UX & Motion** | `package.json`, React/Vue/Next/Nuxt/HTML/CSS/shadcn | `impeccable` *(25+ UI craft commands)*, `frontend-design`, `animate-ui`, `web-design-guidelines` |
| **D. Browser Debugging & Web Perf** | Live web app debugging via Chrome DevTools MCP | `chrome-devtools`, `a11y-debugging`, `debug-optimize-lcp`, `cookie-debugging`, `memory-leak-debugging`, `troubleshooting` |
| **E. Android, Kotlin & Java** | `build.gradle*`, `AndroidManifest.xml`, `pom.xml` | `android-native-dev`, `android-cli`, `compose-preview`, `android-device-hub`, `espresso-skill`, `junit-5-skill` |
| **F. Python, Rust & SQL** | `pyproject.toml`, `Cargo.toml`, `*.sql`, data reporting | `modern-python`, `rust-best-practices`, `sql-queries` |

### 3. Single-Source Multi-Agent Global Sync (`sync-global.ps1`)
Synchronizes `AGENTS.md` to all global AI agent instruction paths on Windows in one command — so **every project on your machine auto-loads it without copying files into repos**:
- **Antigravity (Global Plugin):** `~/.gemini/config/plugins/agent-bootstrap/rules/AGENTS.md`
- **Gemini CLI:** `~/.gemini/GEMINI.md`
- **Claude Code:** `~/.claude/CLAUDE.md`
- **OpenAI Codex CLI:** `~/.codex/AGENTS.md`
- **GitHub Copilot CLI:** `~/.copilot/copilot-instructions.md`

### 4. Full Upstream Source & Reinstall Manifest (`SKILLS-SOURCES.md`)
Lists the verified upstream GitHub repository and install command for GitHub Spec Kit, all 4 plugins, and all 13 standalone skills — making it easy for both humans and AI agents to install missing skills on a fresh machine.

### 5. Cross-Agent Project Entry Points (`AGENTS.md` + `CLAUDE.md`)
- `AGENTS.md` is natively read by Antigravity, Codex, Cursor, Windsurf, Copilot, OpenCode, Zed, and Roo.
- `CLAUDE.md` contains a single `@AGENTS.md` directive so Claude Code reads the exact same file with zero duplication.

---

## Repository Structure

| File | Role |
| :--- | :--- |
| [`AGENTS.md`](./AGENTS.md) | Core Spec Kit gate + compact 6-domain Skill Routing Matrix (loaded by AI agents). |
| [`CLAUDE.md`](./CLAUDE.md) | 1-line `@AGENTS.md` pointer for Claude Code. |
| [`SKILLS-SOURCES.md`](./SKILLS-SOURCES.md) | Upstream GitHub URLs and install commands for Spec Kit, plugins, and standalone skills. |
| [`sync-global.ps1`](./sync-global.ps1) | PowerShell script that syncs `AGENTS.md` to 5 global AI agent config locations. |
| [`README.md`](./README.md) | English documentation (this file). |
| [`README.vi.md`](./README.vi.md) | Vietnamese documentation. |

---

## Getting Started on a New Machine

1. **Install GitHub Spec Kit** (requires `uv`):
   ```powershell
   uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
   ```
2. **Install the skills/plugins you need** using the commands in [`SKILLS-SOURCES.md`](./SKILLS-SOURCES.md).
3. **Choose how you want projects to load `AGENTS.md`** (pick one or combine all three below).

---

## Usage

### Option 1: Zero-Copy Global Mode (All Projects on Your Machine)
Clone this repo and run `sync-global.ps1` once (re-run whenever you update `AGENTS.md`):

```powershell
powershell -ExecutionPolicy Bypass -File .\sync-global.ps1
```
All supported global agents (Antigravity, Gemini CLI, Claude Code, Codex CLI, Copilot CLI) will automatically read `AGENTS.md` in every project without adding files to your project repositories.

### Option 2: Create a New Project from This GitHub Template
Click **Use this template** on GitHub, or run:

```powershell
gh repo create my-new-project --template lucnguyen06/agent-bootstrap --private --clone
```

### Option 3: Drop into an Existing Project (for Cursor / Windsurf / Team Repos)
Pull `AGENTS.md` and `CLAUDE.md` directly into any repository root via GitHub CLI:

```powershell
gh api repos/lucnguyen06/agent-bootstrap/contents/AGENTS.md -H "Accept: application/vnd.github.raw" | Set-Content -Encoding utf8 AGENTS.md
gh api repos/lucnguyen06/agent-bootstrap/contents/CLAUDE.md -H "Accept: application/vnd.github.raw" | Set-Content -Encoding utf8 CLAUDE.md
```
*(Or run `bootstrap-agents` if you installed the local PATH helper.)*

---

## First-Session Tip

To make sure any AI agent initializes Spec Kit and picks the right skills before touching code, start the first session in a project with:

> *"Read `AGENTS.md`, initialize Spec Kit if `.specify/` is missing, inspect the current `src/` structure, and list the matching skills for this project."*

Once `.specify/` is initialized, subsequent sessions can proceed directly with normal tasks.

---

## Updating Rules & Skills

1. Edit [`AGENTS.md`](./AGENTS.md) (and [`SKILLS-SOURCES.md`](./SKILLS-SOURCES.md) if adding a new skill).
2. Run `.\sync-global.ps1` to update all global AI agents on your machine.
3. Commit and push to keep the GitHub template up to date.
