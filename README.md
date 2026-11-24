# Agent Project Bootstrap

Reusable `AGENTS.md` and `CLAUDE.md` template enforcing **GitHub Spec Kit** (always on) and stack-based **Skill Routing** for any AI coding agent (Antigravity/Gemini, Claude Code, Codex, Cursor, Windsurf, Copilot, etc.).

## Files
- [`AGENTS.md`](./AGENTS.md) — Drop into any project root; read first by AI agents to enforce Spec Kit and pick matching skills.
- [`CLAUDE.md`](./CLAUDE.md) — 1-line `@AGENTS.md` pointer for Claude Code.
- [`SKILLS-SOURCES.md`](./SKILLS-SOURCES.md) — Upstream GitHub URLs and install commands for Spec Kit, all 4 plugins, and all 13 standalone skills.

## Usage in Any Project

Copy `AGENTS.md` and `CLAUDE.md` into the root of your project, or pull them directly with GitHub CLI:

```powershell
gh api repos/lucnguyen06/agent-bootstrap/contents/AGENTS.md -H "Accept: application/vnd.github.raw" | Set-Content -Encoding utf8 AGENTS.md
gh api repos/lucnguyen06/agent-bootstrap/contents/CLAUDE.md -H "Accept: application/vnd.github.raw" | Set-Content -Encoding utf8 CLAUDE.md
```
