# Agent Project Bootstrap

> **[Tiếng Việt](./README.md)** | **[English](./README.en.md)**  
> Tổng hợp & duy trì bởi **[@lucnguyen06](https://github.com/lucnguyen06)**

Kho mẫu **khởi tạo & điều hướng Skills cho AI Coding Agent** gọn nhẹ, di động — bắt buộc dùng quy trình **GitHub Spec Kit** cho mọi dự án và tự động chọn đúng **Agent Skills** theo công nghệ của từng dự án. Tương thích với **Antigravity (Gemini), Claude Code, OpenAI Codex CLI, Gemini CLI, GitHub Copilot, Cursor, Windsurf, OpenCode, Zed và Roo**.

---

## Mục đích — Dự án này giải quyết vấn đề gì?

Khi làm việc trên nhiều dự án và luân phiên nhiều AI Coding Agent khác nhau, thường gặp 2 vấn đề lớn:

1. **AI hay bỏ qua bước thiết kế/đặc tả và lao vào sửa code ngay**, dẫn đến lệch kiến trúc, sót edge-case và mỗi công cụ làm một kiểu.
2. **Nạp toàn bộ 50+ skills ở mọi lượt chat sẽ làm nặng context**, còn copy thủ công file hướng dẫn vào từng dự án thì mất công và rất dễ lệch phiên bản.

**Agent Project Bootstrap** giải quyết trọn vẹn cả hai từ **1 file nguồn duy nhất (`AGENTS.md`)**:
- **Luôn bật quy trình Spec-Driven Development:** Mọi AI Agent đều phải kiểm tra `.specify/` và đi đúng quy trình **GitHub Spec Kit** trước khi viết code chính thức.
- **Tự nhận diện stack & chỉ nạp đúng Skills cần dùng:** AI tự quét file cấu hình dự án (`package.json`, `pyproject.toml`, `Cargo.toml`, `build.gradle*`, `pom.xml`, `*.sql`, `.github/workflows/`) rồi chỉ đọc đúng các `SKILL.md` liên quan đến stack và tác vụ hiện tại.

---

## Dành cho ai & Dành cho loại dự án nào?

- **Lập trình viên dùng nhiều AI Agent cùng lúc** (Antigravity, Claude Code, Codex, Cursor, Windsurf, Gemini CLI, Copilot...) muốn tất cả AI tuân theo cùng một kỷ luật kỹ thuật.
- **Các dự án đa nền tảng / đa ngôn ngữ**, hỗ trợ sẵn:
  - Web Frontend, UI/UX design system & hiệu ứng chuyển động (React, Vue, Next.js, Nuxt, shadcn/ui, Astryx, Tailwind)
  - Debug trình duyệt trực tiếp, tối ưu tốc độ tải trang (LCP / Core Web Vitals) & accessibility qua Chrome DevTools MCP
  - Android native (Kotlin, Jetpack Compose, Material 3, Espresso) & Java (JUnit 5 + Mockito)
  - Python hiện đại (`uv`, `ruff`, `ty`), Rust chuẩn idiom, và truy vấn/báo cáo SQL
  - Review bảo mật theo diff, kiểm tra cấu hình kém an toàn (insecure defaults), và sửa lỗi GitHub Actions CI
- **Cá nhân hoặc nhóm phát triển** muốn dùng chế độ **tự đọc toàn máy (không cần copy vào dự án)** hoặc tạo repo mới từ **GitHub Template**.

---

## Chức năng chi tiết

### 1. Cổng bắt buộc dùng GitHub Spec Kit (Always On)
Quy định tại Mục 1 của [`AGENTS.md`](./AGENTS.md):
- Kiểm tra xem máy đã cài `specify` (`github/spec-kit`) chưa; nếu thiếu sẽ có sẵn lệnh cài qua `uv tool install`.
- Kiểm tra thư mục `.specify/` ở gốc dự án; nếu chưa có thì tự khởi tạo (`specify init --here --non-interactive --script ps`) trước khi viết tính năng mới.
- Bắt buộc đi đủ 5 bước Spec-Driven cho mọi tính năng/thay đổi lớn:
  `Constitution` → `Specify` → `Plan` → `Tasks` → `Implement & Verify`.

### 2. Tự động nhận diện stack & Bảng điều hướng 6 nhóm Skills (51 Skills)
Quy định tại Mục 2 của [`AGENTS.md`](./AGENTS.md), bao phủ **14 standalone skills** và **4 plugins (37 skills)**:

| Nhóm công nghệ | Dấu hiệu nhận diện / Ngữ cảnh | Các Skills được điều hướng |
| :--- | :--- | :--- |
| **A. Kỹ thuật phần mềm tổng quát** | Mọi dự án (tra docs thư viện, phân tích kế hoạch, TDD, debug, review code, viết PR) | `context7-mcp`, `grilling`, `grill-me`, `grill-with-docs`, `research`, `domain-modeling`, `codebase-design`, `improve-codebase-architecture`, `prototype`, `tdd`, `diagnosing-bugs`, `code-review`, `pr`, `wayfinder`, `triage`, `handoff`, `wizard`, `writing-for-agents` *(+ 10 skill phụ trợ workflow)* |
| **B. Bảo mật & CI/CD** | Repo Git, kiểm tra cấu hình production, `.github/workflows/` | `differential-review`, `insecure-defaults`, `gh-fix-ci` |
| **C. Web Frontend, UI/UX & Motion** | `package.json`, React/Vue/Next/Nuxt/HTML/CSS/shadcn/Astryx | `impeccable` *(hơn 25 lệnh thiết kế & audit UI)*, `frontend-design`, `animate-ui`, `web-design-guidelines`, `astryx` |
| **D. Debug trình duyệt & Hiệu năng Web** | Debug web live qua Chrome DevTools MCP | `chrome-devtools`, `a11y-debugging`, `debug-optimize-lcp`, `cookie-debugging`, `memory-leak-debugging`, `troubleshooting` |
| **E. Android, Kotlin & Java** | `build.gradle*`, `AndroidManifest.xml`, `pom.xml` | `android-native-dev`, `android-cli`, `compose-preview`, `android-device-hub`, `espresso-skill`, `junit-5-skill` |
| **F. Python, Rust & SQL** | `pyproject.toml`, `Cargo.toml`, `*.sql`, báo cáo dữ liệu | `modern-python`, `rust-best-practices`, `sql-queries` |

### 3. Đồng bộ Global đa AI Agent bằng 1 lệnh (`sync-global.ps1`)
Đồng bộ cùng một file `AGENTS.md` tới đường dẫn cấu hình global của 5 AI Agent trên Windows — giúp **mọi dự án trên máy tự động áp dụng mà không cần copy file vào từng thư mục dự án**:
- **Antigravity (Global Plugin):** `~/.gemini/config/plugins/agent-bootstrap/rules/AGENTS.md`
- **Gemini CLI:** `~/.gemini/GEMINI.md`
- **Claude Code:** `~/.claude/CLAUDE.md`
- **OpenAI Codex CLI:** `~/.codex/AGENTS.md`
- **GitHub Copilot CLI:** `~/.copilot/copilot-instructions.md`

### 4. Danh mục nguồn gốc & lệnh cài lại (`SKILLS-SOURCES.md`)
Lưu đầy đủ link GitHub gốc và lệnh cài đặt cho GitHub Spec Kit, 4 plugins, 14 standalone skills và kho tuyển chọn `VoltAgent/awesome-agent-skills` — giúp bạn (hoặc AI Agent) dễ dàng cài lại đầy đủ khi chuyển sang máy mới.

### 5. Tương thích đa AI trong cùng dự án (`AGENTS.md` + `CLAUDE.md`)
- `AGENTS.md` được đọc trực tiếp bởi Antigravity, Codex, Cursor, Windsurf, Copilot, OpenCode, Zed, Roo.
- `CLAUDE.md` chỉ chứa 1 dòng `@AGENTS.md` để Claude Code tự đọc chung 1 nguồn, không bị trùng lặp nội dung.

---

## Cấu trúc thư mục

| File | Vai trò |
| :--- | :--- |
| [`AGENTS.md`](./AGENTS.md) | File chính chứa quy trình Spec Kit bắt buộc + bảng điều hướng 6 nhóm skills (AI sẽ đọc file này). |
| [`CLAUDE.md`](./CLAUDE.md) | File trỏ 1 dòng `@AGENTS.md` dành cho Claude Code. |
| [`SKILLS-SOURCES.md`](./SKILLS-SOURCES.md) | Link repo gốc và lệnh cài đặt cho Spec Kit, plugins và toàn bộ skills. |
| [`sync-global.ps1`](./sync-global.ps1) | Script PowerShell đồng bộ `AGENTS.md` ra cấu hình global của 5 AI Agent. |
| [`README.md`](./README.md) | Tài liệu hướng dẫn chính (Tiếng Việt — file này). |
| [`README.en.md`](./README.en.md) | Tài liệu hướng dẫn bản tiếng Anh. |

---

## Cài đặt trên máy mới

1. **Cài GitHub Spec Kit** (cần có `uv`):
   ```powershell
   uv tool install specify-cli --from git+https://github.com/github/spec-kit.git
   ```
2. **Cài các skills/plugins cần dùng** theo danh sách lệnh trong [`SKILLS-SOURCES.md`](./SKILLS-SOURCES.md).
3. **Chọn 1 trong 3 cách dùng bên dưới** (hoặc kết hợp cả 3).

---

## Cách sử dụng

### Cách 1: Tự đọc toàn máy — Không cần copy vào từng dự án (Khuyên dùng)
Clone repo này và chạy `sync-global.ps1` một lần (chạy lại mỗi khi bạn sửa `AGENTS.md`):

```powershell
powershell -ExecutionPolicy Bypass -File .\sync-global.ps1
```
Các AI hỗ trợ cấu hình global (Antigravity, Gemini CLI, Claude Code, Codex CLI, Copilot CLI) sẽ tự động nạp `AGENTS.md` ở mọi dự án mà thư mục dự án không cần thêm file nào.

### Cách 2: Tạo dự án mới từ GitHub Template
Bấm **Use this template** trên GitHub hoặc chạy:

```powershell
gh repo create ten-du-an-moi --template lucnguyen06/agent-bootstrap --private --clone
```

### Cách 3: Thả nhanh vào dự án có sẵn (dành cho Cursor / Windsurf / repo nhóm)
Kéo thẳng `AGENTS.md` và `CLAUDE.md` vào thư mục gốc dự án bằng GitHub CLI:

```powershell
gh api repos/lucnguyen06/agent-bootstrap/contents/AGENTS.md -H "Accept: application/vnd.github.raw" | Set-Content -Encoding utf8 AGENTS.md
gh api repos/lucnguyen06/agent-bootstrap/contents/CLAUDE.md -H "Accept: application/vnd.github.raw" | Set-Content -Encoding utf8 CLAUDE.md
```
*(Hoặc gõ `bootstrap-agents` nếu máy đã cài lệnh helper trên PATH.)*

---

## Mẹo nhỏ cho phiên chat đầu tiên ở mỗi dự án

Để chắc chắn bất kỳ AI Agent nào cũng khởi tạo Spec Kit và chọn đúng skills trước khi động vào code, hãy mở màn phiên đầu tiên bằng câu:

> *"Đọc `AGENTS.md`, khởi tạo Spec Kit nếu chưa có, quét `src` hiện tại và cho tôi biết các skills phù hợp với dự án này."*

Sau khi `.specify/` đã được khởi tạo, các lượt chat tiếp theo bạn chỉ cần giao việc bình thường.

---

## Cập nhật khi thêm skill hoặc sửa quy trình

1. Sửa [`AGENTS.md`](./AGENTS.md) (và bổ sung nguồn vào [`SKILLS-SOURCES.md`](./SKILLS-SOURCES.md) nếu có skill mới).
2. Chạy `.\sync-global.ps1` để cập nhật đồng loạt toàn bộ AI Agent trên máy.
3. Commit và push lên GitHub để đồng bộ bản Template.

---

## Tác giả tổng hợp & Nguồn ghi công

- **Người tổng hợp & duy trì:** [@lucnguyen06](https://github.com/lucnguyen06)
- **Nguồn gốc các skills & công cụ:** Toàn bộ bản quyền và mã nguồn từng skill/plugin thuộc về tác giả gốc (GitHub Spec Kit, Matt Pocock, Upstash Context7, Chrome DevTools, Anthropic, OpenAI, Vercel Labs, Trail of Bits, Paul Bakaus / Impeccable, imskyleen / Animate UI, Meta (Astryx), Apollo GraphQL, TestMu AI / LambdaTest, MiniMax AI, pm-skills, VoltAgent). Xem chi tiết từng nguồn tại [`SKILLS-SOURCES.md`](./SKILLS-SOURCES.md).
