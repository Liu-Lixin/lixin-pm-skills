# Claude Code Skills - PRD Writer

A collection of Claude Code skills for collaborative PRD (Product Requirements Document) writing.

## Skills Included

### prd-writer (Chinese)

A confirmation-driven PRD writing skill that helps you create structured, comprehensive product requirements documents through interactive dialogue.

**Key Features:**
- Story-driven structure - every feature expressed as self-contained user story cards
- Visual alignment with ASCII wireframes for UI stories
- Mermaid diagrams for flows, states, and sequences
- Strict confirmation checkpoints to ensure alignment
- Product strategy alignment for complex requirements
- Graded quantification (P0 metrics must be quantifiable)

### prd-writer-en (English)

English version of the PRD writing skill with the same features and workflow.

## Installation

### Prerequisites

- [Claude Code CLI](https://claude.ai/code) installed on your system

### Quick Install

```bash
# Clone the repository
git clone https://github.com/your-username/lixin-pm-skills.git
cd lixin-pm-skills

# Run the installer
./install.sh
```

You will be prompted to select a language:
- **1) 中文 (Chinese)** - installs `prd-writer`
- **2) English** - installs `prd-writer-en`
- **3) All / 全部** - installs both versions

### Command Line Options

```bash
./install.sh --lang zh    # Install Chinese version only
./install.sh --lang en    # Install English version only
./install.sh --lang all   # Install both versions
./install.sh --help       # Show help
```

### Manual Installation

Copy the skill folder to your Claude Code skills directory:

```bash
# Chinese version
cp -r PRD-WRITER ~/.claude/skills/prd-writer

# English version
cp -r PRD-WRITER-EN ~/.claude/skills/prd-writer-en
```

## Usage

After installation, use the skill in Claude Code:

```bash
claude
```

Then invoke the skill:

```
/prd-writer        # Chinese version
/prd-writer-en     # English version
```

Or simply start describing your PRD needs and Claude will recognize when to use the skill:

```
我需要写一个用户登录功能的PRD
```

```
I need to write a PRD for a user login feature
```

## Skill Structure

```
PRD-WRITER/              # Chinese version
├── SKILL.md              # Main skill definition and prompt
├── assets/
│   └── prd-template.md   # Final PRD output template
└── references/
    ├── example-us01.md          # Example user story
    ├── mermaid-examples.md      # Mermaid diagram examples
    ├── ui-wireframe-examples.md # ASCII wireframe standards
    ├── prd-registry-demo.md     # PRD version management example
    └── strategy-card-example.md # Product strategy card template

PRD-WRITER-EN/           # English version
├── SKILL.md
├── assets/
│   └── prd-template.md
└── references/
    ├── example-us01.md
    ├── mermaid-examples.md
    ├── ui-wireframe-examples.md
    ├── prd-registry-demo.md
    └── strategy-card-example.md
```

## Workflow

The skill follows a **confirmation-driven** interaction model:

1. **Step 0 (Optional)**: Product Strategy Alignment
   - Define problem, value hypothesis, success metrics
   - Set boundaries and trade-offs

2. **Step 1**: Framework & Alignment
   - Establish user journey map / business flow
   - Confirm with Mermaid flowchart

3. **Step 2**: Detail Stories
   - Discuss each user story systematically
   - Draw ASCII wireframes for UI stories
   - Get single-point confirmation before moving on

4. **Step 3**: Final Review & Generation
   - Explicit "ready to generate" confirmation required
   - Output final PRD document

## Creating Your Own Skills

To add a new skill to this repository:

1. Create a new directory with your skill name
2. Add a `SKILL.md` file with YAML frontmatter:

```markdown
---
name: your-skill-name
description: Brief description of what the skill does
---

# Skill Title

Your skill prompt content here...
```

3. Run `./install.sh` to install the new skill

## Contributing

Contributions are welcome! Please feel free to submit issues or pull requests.

## License

MIT License
