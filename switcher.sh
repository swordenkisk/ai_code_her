#!/data/data/com.termux/files/usr/bin/bash
# ============================================================
#   ai_code_her — AI Switcher
#   Usage: ai <provider> | ai status | ai ask "prompt"
#   Author: swordenkisk
# ============================================================

GREEN='\033[0;32m'; CYAN='\033[0;36m'; YELLOW='\033[1;33m'
RED='\033[0;31m'; BOLD='\033[1m'; NC='\033[0m'

CONFIG=~/.ai_code_her_active
source ~/.ai_code_her_keys 2>/dev/null

set_active() {
    echo "$1" > $CONFIG
    echo -e "${GREEN}✅ Active AI set to: ${BOLD}$1${NC}"
}

get_active() {
    cat $CONFIG 2>/dev/null || echo "claude"
}

case "$1" in
    claude)
        set_active "claude"
        claude ;;
    chatgpt)
        set_active "chatgpt"
        echo -e "${CYAN}Starting ChatGPT CLI...${NC}"
        python3 -c "
import openai, os
client = openai.OpenAI(api_key=os.environ.get('OPENAI_API_KEY'))
print('ChatGPT ready. Type your message:')
while True:
    try:
        msg = input('You: ')
        if msg.lower() in ['exit','quit']: break
        r = client.chat.completions.create(model='gpt-4o', messages=[{'role':'user','content':msg}])
        print('ChatGPT:', r.choices[0].message.content)
    except KeyboardInterrupt:
        break
" ;;
    gemini)
        set_active "gemini"
        echo -e "${CYAN}Starting Gemini CLI...${NC}"
        python3 -c "
import google.generativeai as genai, os
genai.configure(api_key=os.environ.get('GOOGLE_API_KEY'))
model = genai.GenerativeModel('gemini-1.5-pro')
chat = model.start_chat()
print('Gemini ready. Type your message:')
while True:
    try:
        msg = input('You: ')
        if msg.lower() in ['exit','quit']: break
        r = chat.send_message(msg)
        print('Gemini:', r.text)
    except KeyboardInterrupt:
        break
" ;;
    deepseek)
        set_active "deepseek"
        echo -e "${CYAN}Starting DeepSeek CLI...${NC}"
        python3 -c "
import openai, os
client = openai.OpenAI(api_key=os.environ.get('DEEPSEEK_API_KEY'), base_url='https://api.deepseek.com')
print('DeepSeek ready. Type your message:')
while True:
    try:
        msg = input('You: ')
        if msg.lower() in ['exit','quit']: break
        r = client.chat.completions.create(model='deepseek-chat', messages=[{'role':'user','content':msg}])
        print('DeepSeek:', r.choices[0].message.content)
    except KeyboardInterrupt:
        break
" ;;
    mistral)
        set_active "mistral"
        echo -e "${CYAN}Starting Mistral CLI...${NC}"
        python3 -c "
from mistralai import Mistral
import os
client = Mistral(api_key=os.environ.get('MISTRAL_API_KEY'))
print('Mistral ready. Type your message:')
while True:
    try:
        msg = input('You: ')
        if msg.lower() in ['exit','quit']: break
        r = client.chat.complete(model='mistral-large-latest', messages=[{'role':'user','content':msg}])
        print('Mistral:', r.choices[0].message.content)
    except KeyboardInterrupt:
        break
" ;;
    status)
        ACTIVE=$(get_active)
        echo -e "${CYAN}Active AI: ${BOLD}${ACTIVE}${NC}"
        echo -e "\nAvailable providers:"
        for p in claude chatgpt gemini deepseek mistral; do
            [ "$p" = "$ACTIVE" ] && echo -e "  ${GREEN}● $p (active)${NC}" || echo -e "  ○ $p"
        done ;;
    ask)
        ACTIVE=$(get_active)
        PROMPT="$2"
        echo -e "${CYAN}Asking ${ACTIVE}...${NC}"
        case "$ACTIVE" in
            claude)   echo "$PROMPT" | claude -p "$PROMPT" ;;
            chatgpt)  python3 -c "import openai,os; c=openai.OpenAI(api_key=os.environ['OPENAI_API_KEY']); r=c.chat.completions.create(model='gpt-4o',messages=[{'role':'user','content':'$PROMPT'}]); print(r.choices[0].message.content)" ;;
            gemini)   python3 -c "import google.generativeai as g,os; g.configure(api_key=os.environ['GOOGLE_API_KEY']); print(g.GenerativeModel('gemini-1.5-pro').generate_content('$PROMPT').text)" ;;
            deepseek) python3 -c "import openai,os; c=openai.OpenAI(api_key=os.environ['DEEPSEEK_API_KEY'],base_url='https://api.deepseek.com'); r=c.chat.completions.create(model='deepseek-chat',messages=[{'role':'user','content':'$PROMPT'}]); print(r.choices[0].message.content)" ;;
            mistral)  python3 -c "from mistralai import Mistral; import os; c=Mistral(api_key=os.environ['MISTRAL_API_KEY']); r=c.chat.complete(model='mistral-large-latest',messages=[{'role':'user','content':'$PROMPT'}]); print(r.choices[0].message.content)" ;;
        esac ;;
    *)
        echo -e "${CYAN}${BOLD}ai_code_her — AI Switcher${NC}"
        echo -e "\nUsage:"
        echo -e "  ${YELLOW}ai claude${NC}           Start Claude Code"
        echo -e "  ${YELLOW}ai chatgpt${NC}          Start ChatGPT"
        echo -e "  ${YELLOW}ai gemini${NC}           Start Gemini"
        echo -e "  ${YELLOW}ai deepseek${NC}         Start DeepSeek"
        echo -e "  ${YELLOW}ai mistral${NC}          Start Mistral"
        echo -e "  ${YELLOW}ai status${NC}           Show active AI"
        echo -e "  ${YELLOW}ai ask \"prompt\"${NC}     Ask active AI"
        ;;
esac
