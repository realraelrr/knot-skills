# Knot Skills

**Knot 数字员工运行底座的默认 skill 集成包。**

[English README](README.md)

`knot-skills` 为 Codex 驱动的企业数字员工提供办公文件、文档 ingestion、Markdown 渲染、文件化规划和 handoff 能力。它关注的是让 agent 能稳定产出业务交付物、保留可恢复工作状态，并在多用户 workflow 中继续推进任务。

`knot-skills` 负责维护 Knot 默认启用的 skill 清单和安装器。它不试图复制整个上游仓库，只维护必要的 vendored skill，以及指向一等 first-party component 的链接规则。

## 它包含什么

默认 skill 分为两组。

### Office Pack

Office Pack 是面向用户交付物的办公能力，vendored 在本仓库中：

- `office-xlsx`：Excel、CSV、公式和表格格式
- `office-pptx`：原生 PowerPoint 读取、编辑和生成
- `web-ppt`：浏览器可打开的单文件 HTML 演示
- `office-docx`：Word 文档创建、编辑、填充和排版
- `office-pdf`：精排 PDF、PDF 表单和内容重排

### Agent Workbench

Agent Workbench 是 agent 自用工具，源码保留在 Knot `components/` 下的一等组件仓库中，由本安装器统一链接：

- `planning-with-files`：可恢复的文件化规划
- `docling-skill`：本地文档转换为 agent-ready `source.*` sidecar
- `md-for-human`：将 Markdown 交付物渲染为人类友好的 HTML 站点
- `handoff`：将当前会话压缩为可恢复的交接文档

## Skill 集成

安装到 Codex：

```sh
bash scripts/install-codex-skills.sh
```

安装器会把以下 skill 链接到 `SKILLS_HOME`、`$CODEX_HOME/skills` 或
`~/.codex/skills`：

- Office Pack：`office-xlsx`、`office-pptx`、`web-ppt`、`office-docx`、`office-pdf`
- Agent Workbench：`planning-with-files`、`docling-skill`、`md-for-human`、`handoff`

已有同名 symlink 会被替换；已有同名非 symlink 目录会被移动到带时间戳的 `.backup.*` 目录，避免直接覆盖。

运行集成 canary 可验证 curated 安装入口，不测试上游 Office 行为：

```sh
bash tests/canary.sh
```

## 组件边界

- 本仓库 vendored Office Pack 和 `web-ppt` 所需的 skill 内容。
- `planning-with-files`、`docling-skill`、`md-for-human`、`handoff` 不在本仓库维护源码，只从 sibling component repo 链接。
- first-party component 默认解析自 Knot 根目录的 `components/`。必要时可用 `KNOT_ROOT=/path/to/knot-agent` 覆盖。
- Python helper 的运行时依赖固定在 `requirements.txt`；CI 和本地校验工具使用 `requirements-dev.txt`。
- 上游来源和同步记录见 [UPSTREAMS.md](UPSTREAMS.md)。

## License

Knot-specific packaging 使用 Apache License 2.0，见 [LICENSE](LICENSE)。

Vendored skill 内容保留各自上游协议，见 [NOTICE](NOTICE)。
