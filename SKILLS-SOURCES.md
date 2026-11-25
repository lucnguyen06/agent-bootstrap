# Skills, Plugins & Spec Kit Sources

Upstream repositories and install references for every tool, plugin, and skill referenced in `AGENTS.md`.

---

## 1. Mandatory CLI: GitHub Spec Kit

| Tool | Upstream Repository | Install Command |
| :--- | :--- | :--- |
| **GitHub Spec Kit (`specify`)** | https://github.com/github/spec-kit | `uv tool install specify-cli --from git+https://github.com/github/spec-kit.git` |

---

## 2. Plugins (Installed in `~/.gemini/config/plugins/`)

| Plugin | Skills Included | Upstream Source | Install / Marketplace |
| :--- | :--- | :--- | :--- |
| **mattpocock-skills** | 27 skills (`code-review`, `codebase-design`, `diagnosing-bugs`, `domain-modeling`, `grilling`, `grill-me`, `grill-with-docs`, `pr`, `prototype`, `research`, `tdd`, `wizard`, `writing-for-agents`, etc.) | https://github.com/mattpocock/skills | Clone/package into `~/.gemini/config/plugins/mattpocock-skills` |
| **context7** | `context7-mcp` | https://github.com/upstash/context7 | Antigravity Marketplace (`antigravity-plugins-partners/plugin/context7`) |
| **chrome-devtools-plugin** | `chrome-devtools`, `a11y-debugging`, `cookie-debugging`, `debug-optimize-lcp`, `memory-leak-debugging`, `troubleshooting` | https://github.com/ChromeDevTools/chrome-devtools-mcp | Antigravity Marketplace (`antigravity-plugins-official/plugin/chrome-devtools-plugin`) |
| **android-cli-plugin** | `android-cli`, `compose-preview`, `android-device-hub` | Android Developer Tools Team (Google) | Antigravity Marketplace (`antigravity-plugins-official/plugin/android-cli-plugin`) |

---

## 3. Standalone Skills (Installed in `~/.gemini/config/skills/`)

| Skill | Category | Upstream Repository | Install / Reference |
| :--- | :--- | :--- | :--- |
| **`impeccable`** | Frontend / UI-UX | https://github.com/pbakaus/impeccable | `npx skills add pbakaus/impeccable` or `npx impeccable install` |
| **`animate-ui`** | Frontend / Motion | https://github.com/imskyleen/animate-ui | `npx skills add imskyleen/animate-ui` |
| **`frontend-design`** | Frontend / UI-UX | https://github.com/anthropics/skills | `npx skills add anthropics/skills --skill frontend-design` |
| **`web-design-guidelines`** | Frontend / Audit | https://github.com/vercel-labs/agent-skills | `npx skills add vercel-labs/agent-skills --skill web-design-guidelines` |
| **`astryx`** | Frontend / Design System | https://github.com/meta/astryx | `npm install -g @astryxdesign/cli` + folder `plugins/astryx/skills/astryx` |
| **`differential-review`** | Security / Review | https://github.com/trailofbits/skills | `npx skills add trailofbits/skills --skill differential-review` |
| **`insecure-defaults`** | Security / Audit | https://github.com/trailofbits/skills | `npx skills add trailofbits/skills --skill insecure-defaults` |
| **`modern-python`** | Python | https://github.com/trailofbits/skills | `npx skills add trailofbits/skills --skill modern-python` |
| **`gh-fix-ci`** | GitHub CI/CD | https://github.com/openai/skills | `npx skills add openai/skills --skill gh-fix-ci` |
| **`rust-best-practices`** | Rust | https://github.com/apollographql/rust-best-practices | `npx skills add apollographql/rust-best-practices` |
| **`espresso-skill`** | Android Testing | https://github.com/LambdaTest/agent-skills | `npx skills add LambdaTest/agent-skills --skill espresso-skill` |
| **`junit-5-skill`** | Java Testing | https://github.com/LambdaTest/agent-skills | `npx skills add LambdaTest/agent-skills --skill junit-5-skill` |
| **`android-native-dev`** | Android / Kotlin | https://github.com/MiniMax-AI/skills | Folder `skills/android-native-dev` |
| **`sql-queries`** | Database / SQL | https://github.com/phuryn/pm-skills | Folder `pm-data-analytics/skills/sql-queries` |

---

## 4. Curated Skill Directory (Discovery Source)

Most standalone skills above were curated from the community directory below. Use it to discover and install additional skills for new stacks:

- **Awesome Agent Skills (VoltAgent):** https://github.com/VoltAgent/awesome-agent-skills *(1,000+ community & official agent skills across Claude Code, Antigravity/Gemini, Codex, Cursor, Copilot, Windsurf)*
