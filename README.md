# Agent Project Bootstrap

Reusable `AGENTS.md` and `CLAUDE.md` template enforcing **GitHub Spec Kit** (always on) and stack-based **Skill Routing** for any AI coding agent (Antigravity/Gemini, Claude Code, Codex, Cursor, Windsurf, Copilot, etc.).

## Files
- [`AGENTS.md`](./AGENTS.md) — Core Spec Kit + Skill Routing instructions.
- [`CLAUDE.md`](./CLAUDE.md) — 1-line `@AGENTS.md` pointer for Claude Code.
- [`SKILLS-SOURCES.md`](./SKILLS-SOURCES.md) — Upstream GitHub URLs and install commands for Spec Kit, all 4 plugins, and all 13 standalone skills.
- [`sync-global.ps1`](./sync-global.ps1) — Syncs `AGENTS.md` into global user config paths for Antigravity, Gemini CLI, Claude Code, Codex CLI, and GitHub Copilot CLI.

## Usage

### 1. Zero-Copy Global Mode (All Projects on This Machine)
Run once (and re-run after editing `AGENTS.md`) to auto-load across every project without copying files into repos:

```powershell
powershell -ExecutionPolicy Bypass -File .\sync-global.ps1
```

### 2. New Project from GitHub Template
```powershell
gh repo create my-new-project --template lucnguyen06/agent-bootstrap --private --clone
```

### 3. Drop into an Existing Project (for Cursor / Windsurf / Team Repos)
```powershell
bootstrap-agents
```
Or pull directly via GitHub CLI:
```powershell
gh api repos/lucnguyen06/agent-bootstrap/contents/AGENTS.md -H "Accept: application/vnd.github.raw" | Set-Content -Encoding utf8 AGENTS.md
gh api repos/lucnguyen06/agent-bootstrap/contents/CLAUDE.md -H "Accept: application/vnd.github.raw" | Set-Content -Encoding utf8 CLAUDE.md
```

## First-Session Tip (Mẹo cho phiên chat đầu tiên ở mỗi dự án)

To make sure any AI agent initializes Spec Kit and picks the right skills before touching code, start the first session in a project with:

- **English:**
  > *"Read `AGENTS.md`, initialize Spec Kit if `.specify/` is missing, inspect the current `src/` structure, and list the matching skills for this project."*
- **Tiếng Việt:**
  > *"Đọc `AGENTS.md`, khởi tạo Spec Kit nếu chưa có, quét `src` hiện tại và cho tôi biết các skills phù hợp với dự án này."*

Once `.specify/` is initialized, subsequent sessions can dive straight into normal tasks.
