#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#   ai_code_her — API Key Manager
#   Author: swordenkisk
# ============================================================

GREEN='\033[0;32m'; CYAN='\033[0;36m'; YELLOW='\033[1;33m'; NC='\033[0m'

echo -e "${CYAN}🔑 ai_code_her — API Key Setup${NC}\n"
echo -e "${YELLOW}Leave blank to skip a provider${NC}\n"

KEYS_FILE=~/.ai_code_her_keys

echo -n "Anthropic API Key (Claude):  "; read -s ANTHROPIC_KEY; echo
echo -n "OpenAI API Key (ChatGPT):    "; read -s OPENAI_KEY; echo
echo -n "Google API Key (Gemini):     "; read -s GOOGLE_KEY; echo
echo -n "DeepSeek API Key:            "; read -s DEEPSEEK_KEY; echo
echo -n "Mistral API Key:             "; read -s MISTRAL_KEY; echo

# Write keys file
cat > $KEYS_FILE << EOF
# ai_code_her API Keys — DO NOT SHARE THIS FILE
export ANTHROPIC_API_KEY="${ANTHROPIC_KEY}"
export OPENAI_API_KEY="${OPENAI_KEY}"
export GOOGLE_API_KEY="${GOOGLE_KEY}"
export DEEPSEEK_API_KEY="${DEEPSEEK_KEY}"
export MISTRAL_API_KEY="${MISTRAL_KEY}"
EOF

chmod 600 $KEYS_FILE

# Source in .zshrc
if ! grep -q "ai_code_her_keys" ~/.zshrc; then
    echo "source ~/.ai_code_her_keys # ai_code_her_keys" >> ~/.zshrc
fi

source $KEYS_FILE

echo -e "\n${GREEN}✅ API keys saved securely to ~/.ai_code_her_keys${NC}"
echo -e "${GREEN}Run: ai claude  (or chatgpt / gemini / deepseek / mistral)${NC}"
