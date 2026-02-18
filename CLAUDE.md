# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a **Claude Code skill definition project** for collaborative PRD (Product Requirements Document) writing. The main skill is defined in `SKILL.md` and is used when users want to 梳理/撰写/完善 PRD、需求文档、用户故事、验收标准.

## Key Files

- `SKILL.md` - Main skill definition with the complete prompt template and workflow
- `assets/prd-template.md` - Final PRD output template structure
- `references/example-us01.md` - Example of a properly formatted user story
- `references/mermaid-examples.md` - Mermaid diagram examples (flowchart, state, sequence)
- `references/ui-wireframe-examples.md` - ASCII wireframe quality standards and examples
- `references/prd-registry-demo.md` - PRD version management registry example
- `references/strategy-card-example.md` - Product strategy card example for Step 0 alignment

## Architecture: Confirmation-Driven Workflow

The PRD writing skill follows a strict **"确认驱动" (confirmation-driven)** interaction model:

0. **Step 0: Product Strategy Alignment (Optional)** - Triggered for complex requirements. Guide user to define problem, value hypothesis (user/business value), success metrics (P0 must be quantified), and boundaries/trade-offs including rejected requirements
1. **Step 1: Define Framework & Seek Alignment** - Guide user to establish the core user journey map/business flow with phases, then confirm with Mermaid flowchart
2. **Step 2: Detail Stories & Confirm Each Point** - Discuss each user story systematically with value type, priority, success metrics; draw ASCII wireframes for UI stories; add product decision log for important requirements; get single-point confirmation before moving to next story
3. **Step 3: Final Review & Generation** - Request explicit "可以生成" (ready to generate) confirmation before outputting final PRD

## Core Principles

- **PRD = Collection of Stories**: Every feature requirement is expressed as a self-contained user story card
- **Visual Alignment Required**: UI stories MUST include ASCII wireframes; dynamic behavior uses Mermaid diagrams
- **Never Guess**: All content must come from user dialogue - no assumptions or made-up details
- **One-Question-One-Answer-One-Confirmation**: Interactive rhythm with explicit confirmation checkpoints
- **Product Strategy First**: For complex requirements, align on problem definition, value hypothesis, and success metrics before diving into stories
- **Graded Quantification**: P0 requirements must have quantifiable success metrics; P1/P2 can be qualitative
- **Record Decisions**: Document product decision logs for important requirements and explicitly record "not doing" decisions with reasons

## PRD Version Management

After PRD generation, maintain a registry in the target project repository:
- Registry: `docs/PRD_REGISTRY.md`
- Individual PRDs: `docs/prd/<version>.md`
- Output a single table row for the registry when PRD is finalized
