# Claude Code Skills Collection

A curated collection of Claude Code skills for product management, design collaboration, and content creation workflows.

## Skills Included

### prd-writer-zh (Chinese PRD Writer)

A confirmation-driven PRD writing skill that helps you create structured, comprehensive product requirements documents through interactive dialogue.

**Key Features:**
- Story-driven structure - every feature expressed as self-contained user story cards
- Visual alignment with ASCII wireframes for UI stories
- Mermaid diagrams for flows, states, and sequences
- Strict confirmation checkpoints to ensure alignment
- Product strategy alignment for complex requirements
- Graded quantification (P0 metrics must be quantifiable)

**Usage:** Invoke with `/prd-writer-zh` or simply describe your PRD needs in Chinese:
```
我需要写一个用户登录功能的PRD
```

### prd-writer-en (English PRD Writer)

English version of the PRD writing skill with the same features and workflow as the Chinese version.

**Usage:** Invoke with `/prd-writer-en` or describe your PRD needs in English:
```
I need to write a PRD for a user login feature
```

### ui-design (UI Collaboration Workflow)

A structured workflow for UI style modifications that reduces miscommunication through systematic collaboration: screenshot localization → current state description → solution proposals → code changes → fine-tuning.

**Key Features:**
- Screenshot-first communication
- ASCII wireframes for layout proposals
- Iterative refinement with clear checkpoints
- No assumptions - every change is confirmed before implementation

**Usage:** Invoke with `/ui-design` or describe UI changes in Chinese:
```
我想调整这个页面的布局
```

### image-assistant (Infographic Generator)

Transforms article/module content into consistent, readable 16:9 infographic prompts with minimal text. Follows a structured workflow: requirement clarification → image planning → copy finalization → prompt generation → iteration.

**Key Features:**
- Multi-stage workflow from content analysis to ready-to-use image prompts
- High-readability design principles (large fonts, minimal text, clear hierarchy)
- Batch prompt generation for multiple images
- Built-in iteration and refinement

**Usage:** Invoke with `/image-assistant` or request image generation in Chinese:
```
这段内容做几张配图
给我三张出图提示词
```

## Installation

### Prerequisites

- [Claude Code CLI](https://claude.ai/code) installed on your system

### Setup

1. Clone this repository into your Claude Code skills directory:

```bash
# If ~/.claude/skills doesn't exist yet
mkdir -p ~/.claude/skills

# Clone directly into the skills directory
cd ~/.claude/skills
git clone <your-repo-url> .
```

Or manually copy individual skill folders:

```bash
# Copy specific skills
cp -r /path/to/repo/prd-writer-zh ~/.claude/skills/
cp -r /path/to/repo/prd-writer-en ~/.claude/skills/
cp -r /path/to/repo/ui-design ~/.claude/skills/
cp -r /path/to/repo/image-assistant ~/.claude/skills/
```

2. Restart Claude Code or reload skills:

```bash
claude
```

The skills will be automatically detected and available for use.

## Repository Structure

```
.
├── README.md              # This file
├── CLAUDE.md              # Instructions for Claude Code when working with this repository
├── prd-writer-zh/         # Chinese PRD writing skill
│   ├── SKILL.md           # Main skill definition and prompt
│   ├── assets/
│   │   └── prd-template.md   # Final PRD output template
│   └── references/
│       ├── example-us01.md          # Example user story
│       ├── mermaid-examples.md      # Mermaid diagram examples
│       ├── ui-wireframe-examples.md # ASCII wireframe standards
│       ├── prd-registry-demo.md     # PRD version management example
│       └── strategy-card-example.md # Product strategy card template
├── prd-writer-en/         # English PRD writing skill
│   ├── SKILL.md
│   ├── assets/
│   │   └── prd-template.md
│   └── references/
│       ├── example-us01.md
│       ├── mermaid-examples.md
│       ├── ui-wireframe-examples.md
│       ├── prd-registry-demo.md
│       └── strategy-card-example.md
├── ui-design/             # UI collaboration workflow skill
│   └── SKILL.md
└── image-assistant/       # Infographic generator skill
    ├── SKILL.md
    └── stages/            # Multi-stage workflow definitions
        ├── 01-brief.md
        ├── 02-plan.md
        ├── 03-copy.md
        ├── 04-prompts.md
        └── 05-iterate.md
```

## PRD Writer Workflow

Both PRD writer skills (Chinese and English) follow a **confirmation-driven** interaction model:

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

## Creating Custom Skills

Skills in this repository follow the Claude Code skill format. Each skill is defined in a `SKILL.md` file with YAML frontmatter:

```markdown
---
name: your-skill-name
description: Brief description of what the skill does
---

# Skill Title

Your skill prompt content here...
```

Place the skill in its own directory within `~/.claude/skills/` and Claude Code will automatically detect it.

For detailed guidance on creating effective skills, refer to the `document-skills:skill-creator` skill or [Claude Code documentation](https://claude.ai/code).

## Version Management

This repository uses git for version control. When making changes:

1. Work on a feature branch
2. Commit changes with clear, descriptive messages
3. Test skills thoroughly before merging to main

## Contributing

Contributions are welcome! Feel free to:
- Report issues or suggest improvements
- Submit pull requests with new skills or enhancements
- Share feedback on existing skills

## License

MIT License
