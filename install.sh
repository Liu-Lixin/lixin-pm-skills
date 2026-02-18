#!/bin/bash
# install.sh - Install Claude Code skills from this repository
#
# Usage:
#   ./install.sh              # Interactive mode with language selection
#   ./install.sh --lang zh    # Install Chinese version only
#   ./install.sh --lang en    # Install English version only
#   ./install.sh --lang all   # Install both versions
#
# This script detects all skills in the repository (directories with SKILL.md)
# and installs them to ~/.claude/skills/

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Skills installation directory
SKILLS_DIR="$HOME/.claude/skills"

# Parse command line arguments
LANG_CHOICE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --lang|-l)
            LANG_CHOICE="$2"
            shift 2
            ;;
        --help|-h)
            echo "Usage: ./install.sh [OPTIONS]"
            echo ""
            echo "Options:"
            echo "  --lang, -l <zh|en|all>  Language version to install"
            echo "                          zh = Chinese (prd-writer-zh)"
            echo "                          en = English (prd-writer-en)"
            echo "                          all = Both versions"
            echo "  --help, -h              Show this help message"
            echo ""
            echo "Without options, runs in interactive mode."
            exit 0
            ;;
        *)
            echo -e "${RED}Unknown option: $1${NC}"
            exit 1
            ;;
    esac
done

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Claude Code Skills Installer                           ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Step 1: Check if Claude CLI is installed
echo -e "${BLUE}[1/5] Checking Claude CLI installation...${NC}"
if ! command -v claude &> /dev/null; then
    echo -e "${RED}✗ Claude CLI is not installed or not in PATH.${NC}"
    echo ""
    echo "Please install Claude CLI first:"
    echo "  Visit: https://claude.ai/code"
    exit 1
fi

# Step 2: Display Claude version
CLAUDE_VERSION=$(claude --version 2>/dev/null || echo "unknown")
echo -e "${GREEN}✓ Claude CLI found: v${CLAUDE_VERSION}${NC}"
echo ""

# Step 3: Create skills directory if it doesn't exist
echo -e "${BLUE}[2/5] Preparing skills directory...${NC}"
if [ ! -d "$SKILLS_DIR" ]; then
    mkdir -p "$SKILLS_DIR"
    echo -e "${GREEN}✓ Created: ${SKILLS_DIR}${NC}"
else
    echo -e "${GREEN}✓ Exists: ${SKILLS_DIR}${NC}"
fi
echo ""

# Step 4: Language selection
echo -e "${BLUE}[3/5] Select language / 选择语言:${NC}"

if [ -z "$LANG_CHOICE" ]; then
    # Interactive mode
    echo -e "  ${CYAN}1)${NC} 中文 (Chinese) - prd-writer-zh"
    echo -e "  ${CYAN}2)${NC} English - prd-writer-en"
    echo -e "  ${CYAN}3)${NC} All / 全部 - both versions"
    echo ""
    read -p "Enter choice [1-3] (default: 1): " user_choice

    case $user_choice in
        2) LANG_CHOICE="en" ;;
        3) LANG_CHOICE="all" ;;
        *) LANG_CHOICE="zh" ;;
    esac
fi

# Build list of skill folders to install
SKILL_FOLDERS=""

case $LANG_CHOICE in
    zh|1)
        SKILL_FOLDERS="prd-writer/zh"
        echo -e "${GREEN}✓ Selected: Chinese (prd-writer-zh)${NC}"
        ;;
    en|2)
        SKILL_FOLDERS="prd-writer/en"
        echo -e "${GREEN}✓ Selected: English (prd-writer-en)${NC}"
        ;;
    all|3)
        SKILL_FOLDERS="prd-writer/zh prd-writer/en"
        echo -e "${GREEN}✓ Selected: All (both versions)${NC}"
        ;;
    *)
        echo -e "${RED}✗ Invalid language choice: $LANG_CHOICE${NC}"
        echo "  Valid options: zh, en, all"
        exit 1
        ;;
esac
echo ""

# Step 5: Verify skill folders exist and detect skills
echo -e "${BLUE}[4/5] Detecting skills...${NC}"

SKILLS_FOUND=""
FOUND_COUNT=0

for folder in $SKILL_FOLDERS; do
    skill_path="$SCRIPT_DIR/$folder"

    if [ ! -d "$skill_path" ]; then
        echo -e "${YELLOW}  ⚠ Folder not found: ${folder}${NC}"
        continue
    fi

    if [ ! -f "$skill_path/SKILL.md" ]; then
        echo -e "${YELLOW}  ⚠ No SKILL.md in: ${folder}${NC}"
        continue
    fi

    SKILLS_FOUND="$SKILLS_FOUND $skill_path"
    FOUND_COUNT=$((FOUND_COUNT + 1))
    echo -e "  ${YELLOW}→${NC} Found: ${folder}"
done

if [ $FOUND_COUNT -eq 0 ]; then
    echo -e "${YELLOW}⚠ No skills found.${NC}"
    exit 0
fi

echo -e "${GREEN}✓ Found ${FOUND_COUNT} skill(s)${NC}"
echo ""

# Step 6: Install each skill
echo -e "${BLUE}[5/5] Installing skills...${NC}"

INSTALLED=0
UPDATED=0

for skill_path in $SKILLS_FOUND; do
    # Extract skill name from SKILL.md frontmatter
    skill_name=$(grep -m1 "^name:" "$skill_path/SKILL.md" 2>/dev/null | sed 's/^name:[[:space:]]*//' | tr -d '"')

    # Fallback to directory name if name not found in frontmatter
    if [ -z "$skill_name" ]; then
        skill_name=$(basename "$skill_path")
        echo -e "${YELLOW}  ⚠ Could not find 'name' in SKILL.md, using directory name: ${skill_name}${NC}"
    fi

    target_dir="$SKILLS_DIR/$skill_name"

    # Check if skill already exists
    if [ -d "$target_dir" ]; then
        echo -e "  ${YELLOW}↻${NC} Updating: ${skill_name}"
        rm -rf "$target_dir"
        ((UPDATED++))
    else
        echo -e "  ${GREEN}+${NC} Installing: ${skill_name}"
        ((INSTALLED++))
    fi

    # Copy the skill directory
    cp -r "$skill_path" "$target_dir"
done

echo ""
echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Installation Complete                                  ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""
echo -e "  ${GREEN}Installed:${NC} ${INSTALLED}"
echo -e "  ${YELLOW}Updated:${NC}   ${UPDATED}"
echo ""
echo -e "Skills location: ${SKILLS_DIR}"
echo ""
echo -e "To use a skill, run:"
echo -e "  ${BLUE}claude${NC}"
echo -e "  ${BLUE}> /prd-writer-zh${NC}   (Chinese version)"
echo -e "  ${BLUE}> /prd-writer-en${NC}   (English version)"
echo ""
