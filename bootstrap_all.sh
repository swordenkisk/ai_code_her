#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#   ai_code_her — Master Bootstrap
#   Install all AI coding assistants in one shot
#   Author: swordenkisk | https://github.com/swordenkisk
# ============================================================

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
BLUE='\033[0;34m'; CYAN='\033[0;36m'; BOLD='\033[1m'; NC='\033[0m'

echo -e "${CYAN}${BOLD}
  █████╗ ██╗     ██████╗ ██████╗ ██████╗ ███████╗    ██╗  ██╗███████╗██████╗ 
 ██╔══██╗██║    ██╔════╝██╔═══██╗██╔══██╗██╔════╝    ██║  ██║██╔════╝██╔══██╗
 ███████║██║    ██║     ██║   ██║██║  ██║█████╗      ███████║█████╗  ██████╔╝
 ██╔══██║██║    ██║     ██║   ██║██║  ██║██╔══╝      ██╔══██║██╔══╝  ██╔══██╗
 ██║  ██║██║    ╚██████╗╚██████╔╝██████╔╝███████╗    ██║  ██║███████╗██║  ██║
 ╚═╝  ╚═╝╚═╝     ╚═════╝ ╚═════╝ ╚═════╝ ╚══════╝    ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
       🤖 Every AI. One Phone. Zero Bloat.
${NC}"

echo -e "${YELLOW}Starting full installation...${NC}\n"

# --- Base packages ---
echo -e "${BLUE}[1/8] Updating Termux & installing base packages...${NC}"
pkg update -y && pkg upgrade -y
pkg install -y nodejs git curl wget python vim nano zsh unzip openssh
echo -e "${GREEN}✓ Base packages ready${NC}\n"

# --- Storage ---
echo -e "${BLUE}[2/8] Setting up storage...${NC}"
termux-setup-storage
echo -e "${GREEN}✓ Storage configured${NC}\n"

# --- Claude Code ---
echo -e "${BLUE}[3/8] Installing Claude Code (Anthropic)...${NC}"
npm install -g @anthropic-ai/claude-code
echo -e "${GREEN}✓ Claude Code installed${NC}\n"

# --- ChatGPT CLI ---
echo -e "${BLUE}[4/8] Installing ChatGPT CLI (OpenAI)...${NC}"
npm install -g openai-cli 2>/dev/null || pip install openai --break-system-packages
echo -e "${GREEN}✓ ChatGPT CLI installed${NC}\n"

# --- Gemini CLI ---
echo -e "${BLUE}[5/8] Installing Gemini CLI (Google)...${NC}"
npm install -g @google/generative-ai 2>/dev/null
pip install google-generativeai --break-system-packages
echo -e "${GREEN}✓ Gemini CLI installed${NC}\n"

# --- DeepSeek ---
echo -e "${BLUE}[6/8] Installing DeepSeek CLI...${NC}"
pip install openai --break-system-packages  # DeepSeek uses OpenAI-compatible API
echo -e "${GREEN}✓ DeepSeek ready${NC}\n"

# --- Mistral ---
echo -e "${BLUE}[7/8] Installing Mistral CLI...${NC}"
pip install mistralai --break-system-packages
echo -e "${GREEN}✓ Mistral installed${NC}\n"

# --- Shell + aliases ---
echo -e "${BLUE}[8/8] Configuring shell & aliases...${NC}"
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

cat >> ~/.zshrc << 'EOF'

# === ai_code_her aliases ===
alias ai="bash ~/ai_code_her/scripts/switcher.sh"
alias aiserve="bash ~/ai_code_her/scripts/server.sh"
alias ainew="bash ~/ai_code_her/scripts/new_project.sh"
alias aikeys="bash ~/ai_code_her/scripts/set_keys.sh"
alias projects="cd ~/storage/shared/AIProjects"
export AI_PROJECTS=~/storage/shared/AIProjects
EOF

mkdir -p ~/storage/shared/AIProjects
echo -e "${GREEN}✓ Shell configured${NC}\n"

echo -e "${GREEN}${BOLD}
╔══════════════════════════════════════════════╗
║        ✅ ai_code_her installed!             ║
║                                              ║
║  Next step: set your API keys               ║
║  Run: bash ~/ai_code_her/scripts/set_keys.sh ║
║                                              ║
║  Then: ai claude   (or chatgpt/gemini/...)  ║
╚══════════════════════════════════════════════╝
${NC}"
