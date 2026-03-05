# 🤖 ai_code_her
### Run Any AI Coding Assistant on Android — One Repo, Every Model

<div align="center">

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Platform](https://img.shields.io/badge/platform-Android-green)
![Size](https://img.shields.io/badge/size-~300MB-orange)
![License](https://img.shields.io/badge/license-MIT-purple)
![Author](https://img.shields.io/badge/author-swordenkisk-black)

</div>

---

## 🧠 The Idea

Why install multiple apps for multiple AIs?

**ai_code_her** is a single lightweight Android environment that lets you connect to
**any AI coding assistant** via Termux — no local models, no bloat, just pure API power.

```
Your Phone (~300MB)
    ├── Claude Code     → Anthropic API
    ├── ChatGPT         → OpenAI API
    ├── Gemini          → Google API
    ├── DeepSeek        → DeepSeek API
    └── Mistral         → Mistral API
```

---

## ✨ Features

- 🔀 **Multi-AI support** — switch between AIs with one command
- ⚡ **One-command install** — automated setup for all providers
- 🌐 **Direct API connections** — always latest models, no local overhead
- 🖥️ **Unified server mode** — expose any AI as a local HTTP endpoint
- 📁 **Shared project manager** — one workspace for all your AI projects
- 💾 **~300MB total** — all providers combined
- 🔑 **Bring your own keys** — full control over your API usage

---

## 📋 Requirements

| Requirement | Details |
|------------|---------|
| Device | Android 5.0+ |
| App | Termux (from F-Droid) |
| Storage | ~300MB free |
| Internet | Wi-Fi or Mobile Data |
| API Keys | One or more provider keys |

---

## 🚀 Quick Install

### Step 1 — Install Termux
> ⚠️ Use **F-Droid only** — not Play Store.

🔗 https://f-droid.org/packages/com.termux/

### Step 2 — Run Master Bootstrap
```bash
curl -sL https://raw.githubusercontent.com/swordenkisk/ai_code_her/main/scripts/bootstrap_all.sh | bash
```

### Step 3 — Set Your API Keys
```bash
bash ~/ai_code_her/scripts/set_keys.sh
```

### Step 4 — Pick Your AI & Code! 🎉
```bash
ai claude     # Switch to Claude
ai chatgpt    # Switch to ChatGPT
ai gemini     # Switch to Gemini
ai deepseek   # Switch to DeepSeek
ai mistral    # Switch to Mistral
```

---

## 📂 Project Structure

```
ai_code_her/
├── 📄 README.md
├── 📄 LICENSE
├── 📁 claude/
│   ├── bootstrap.sh          # Claude Code setup
│   └── README.md
├── 📁 chatgpt/
│   ├── bootstrap.sh          # ChatGPT CLI setup
│   └── README.md
├── 📁 gemini/
│   ├── bootstrap.sh          # Gemini CLI setup
│   └── README.md
├── 📁 deepseek/
│   ├── bootstrap.sh          # DeepSeek setup
│   └── README.md
├── 📁 mistral/
│   ├── bootstrap.sh          # Mistral CLI setup
│   └── README.md
├── 📁 scripts/
│   ├── bootstrap_all.sh      # Install everything at once
│   ├── set_keys.sh           # API key manager
│   ├── switcher.sh           # Switch between AIs (ai command)
│   ├── server.sh             # Unified local HTTP server
│   └── new_project.sh        # Project scaffolding
├── 📁 config/
│   └── .ai_code_her.yml      # Global configuration
└── 📁 docs/
    ├── SETUP.md
    ├── KEYS.md               # Where to get each API key
    └── TROUBLESHOOT.md
```

---

## 🤖 Supported AI Providers

| AI | CLI Tool | API Key Source | Size |
|----|----------|---------------|------|
| **Claude** | `claude-code` | console.anthropic.com | ~35MB |
| **ChatGPT** | `chatgpt-cli` | platform.openai.com | ~20MB |
| **Gemini** | `gemini-cli` | aistudio.google.com | ~20MB |
| **DeepSeek** | `deepseek-cli` | platform.deepseek.com | ~15MB |
| **Mistral** | `mistral-cli` | console.mistral.ai | ~15MB |

---

## 🔀 Switching Between AIs

```bash
# Switch active AI
ai claude
ai chatgpt
ai gemini
ai deepseek
ai mistral

# Check current active AI
ai status

# Ask any AI directly
ai ask "Help me fix this bug"

# Use specific AI without switching
ai --use gemini "Explain this code"
```

---

## 🌐 Unified Server Mode

Expose any AI as a local HTTP server accessible from any device on your network:

```bash
# Start server with active AI
bash ~/ai_code_her/scripts/server.sh

# Start with specific AI
bash ~/ai_code_her/scripts/server.sh --ai gemini

# Query from any device on same Wi-Fi
curl -X POST http://YOUR_PHONE_IP:8765/ask \
  -H "Content-Type: application/json" \
  -d '{"prompt": "Hello!", "ai": "claude"}'
```

---

## 📦 Storage Breakdown

| Component | Size |
|-----------|------|
| Termux base | ~80MB |
| Node.js | ~55MB |
| Python | ~15MB |
| Git + tools | ~45MB |
| All AI CLIs | ~105MB |
| **Total** | **~300MB** ✅ |

---

## 🗺️ Roadmap

- [ ] v1.1 — Add Grok (xAI) support
- [ ] v1.2 — Add Ollama bridge (local models option)
- [ ] v1.3 — AI comparison mode (same prompt → multiple AIs)
- [ ] v1.4 — Native Android GUI wrapper
- [ ] v2.0 — Full offline fallback + NetHunter bundle

---

## 🤝 Contributing

1. Fork the repository
2. Create your branch: `git checkout -b feature/new-ai-provider`
3. Commit: `git commit -m "Add: new AI provider"`
4. Push: `git push origin feature/new-ai-provider`
5. Open a Pull Request

---

## 📄 License

MIT License — Copyright (c) 2026 [swordenkisk](https://github.com/swordenkisk)

See [LICENSE](./LICENSE) for full details.

---

## 👤 Author

**swordenkisk**
> Inventor | AI Researcher | Software Architect

🔗 GitHub: https://github.com/swordenkisk
📦 Also see: [In3Pro](https://github.com/swordenkisk/In3Pro) — Claude-only mobile edition

---

<div align="center">

**"Every AI. One phone. Zero bloat."** 🤖📱

⭐ Star this repo if you find it useful!

</div>
