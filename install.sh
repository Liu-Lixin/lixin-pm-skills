#!/bin/bash
# install.sh - Install Claude Code skills from this repository
#
# Usage: ./install.sh
#
# This script detects all skills in the repository (directories with SKILL.md)
# and installs them to ~/.claude/skills/

set -e

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Skills installation directory
SKILLS_DIR="$HOME/.claude/skills"

echo -e "${BLUE}╔════════════════════════════════════════════════════════════╗${NC}"
echo -e "${BLUE}║     Claude Code Skills Installer                           ║${NC}"
echo -e "${BLUE}╚════════════════════════════════════════════════════════════╝${NC}"
echo ""

# Step 1: Check if Claude CLI is installed
echo -e "${BLUE}[1/4] Checking Claude CLI installation...${NC}"
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
echo -e "${BLUE}[2/4] Preparing skills directory...${NC}"
if [ ! -d "$SKILLS_DIR" ]; then
    mkdir -p "$SKILLS_DIR"
    echo -e "${GREEN}✓ Created: ${SKILLS_DIR}${NC}"
else
    echo -e "${GREEN}✓ Exists: ${SKILLS_DIR}${NC}"
fi
echo ""

# Step 4: Find all skills in the repository
echo -e "${BLUE}[3/4] Detecting skills in repository...${NC}"

SKILLS_FOUND=()

# Find directories containing SKILL.md (skip hidden directories like .git)
while IFS= read -r -d '' skill_file; do
    skill_dir=$(dirname "$skill_file")
    # Get relative path for display
    rel_path="${skill_dir#$SCRIPT_DIR/}"
    SKILLS_FOUND+=("$skill_dir")
    echo -e "  ${YELLOW}→${NC} Found: ${rel_path}"
done < <(find "$SCRIPT_DIR" -name "SKILL.md" -not -path "*/\.*" -print0 2>/dev/null)

if [ ${#SKILLS_FOUND[@]} -eq 0 ]; then
    echo -e "${YELLOW}⚠ No skills found in this repository.${NC}"
    exit 0
fi

echo -e "${GREEN}✓ Found ${#SKILLS_FOUND[@]} skill(s)${NC}"
echo ""

# Step 5: Install each skill
echo -e "${BLUE}[4/4] Installing skills...${NC}"

INSTALLED=0
UPDATED=0

for skill_path in "${SKILLS_FOUND[@]}"; do
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
echo -e "  ${BLUE}> /<skill-name>${NC} (e.g., /prd-writer)"
echo ""
