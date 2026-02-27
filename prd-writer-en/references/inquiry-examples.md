# Inquiry Strategy Examples

## Core Principles

- ✅ **Structured Questions**: Provide 2-4 concrete options, let users choose
- ❌ **Open-Ended Questions**: Avoid "What do you think?" type questions
- 💡 **Decision Trees**: Progressively deepen questions based on user responses

---

## Scenario 1: Feature Scope Definition

### ❌ Open-Ended Question (Avoid)
"What should the search feature cover?"

**Problem**: User might answer "I don't know" or "whatever", leading to vague requirements.

### ✅ Structured Question (Recommended)

**Question**: "What content should the search feature cover?"

**Options**:
- (A) Homepage features only
- (B) Homepage features + forum content
- (C) Homepage features + forum content + resource library
- (D) Other (please specify)

**Confirmation after user selection**:
> "Got it, you want search to cover [A/B/C]. This means we'll need to place a search box at [specific location] and integrate with [related systems]. Is that correct?"

---

## Scenario 2: Priority Confirmation

### ❌ Open-Ended Question (Avoid)
"What's the priority of this feature?"

**Problem**: User might not understand priority levels.

### ✅ Structured Question (Recommended)

**Question**: "How important is this feature to the product?"

**Options**:
- (A) P0 - Core feature, must ship in first release
- (B) P1 - Important feature, should ship in first release but can be delayed if time is tight
- (C) P2 - Nice-to-have feature, can be added in later releases
- (D) Unsure, need discussion

**Confirmation after user selection**:
> "You think this is [P0/P1/P2]. This means [specific implication]. Is that right?"

---

## Scenario 3: User Role Definition

### ❌ Open-Ended Question (Avoid)
"Who are the users for this feature?"

**Problem**: User might list many roles, complicating requirements.

### ✅ Structured Question (Recommended)

**Question**: "Who are the primary users for this feature?"

**Options**:
- (A) New users only
- (B) Active users only
- (C) Both new and active users
- (D) All users (including inactive)

**Follow-up question after selection**:
> "Primary users are [A/B/C/D]. For [other user roles], do they also need this feature, or not at all?"

---

## Scenario 4: Interaction Method Selection

### ❌ Open-Ended Question (Avoid)
"How should users interact with this?"

**Problem**: User might give multiple ways, creating ambiguity.

### ✅ Structured Question (Recommended)

**Question**: "How should users complete this action?"

**Options**:
- (A) Single click on button
- (B) Long press on button
- (C) Swipe gesture
- (D) Other (please specify)

**Confirmation after user selection**:
> "You chose [A/B/C/D]. This means users need to [specific steps]. Correct?"

---

## Scenario 5: Analytics Field Definition

### ❌ Open-Ended Question (Avoid)
"What information should we track?"

**Problem**: User might miss important fields or add unnecessary ones.

### ✅ Structured Question (Recommended)

**Question**: "What information should analytics track?"

**Options**:
- (A) Basic fields only (user_id, timestamp, event_name)
- (B) Basic fields + location info (page_name, section_name)
- (C) Basic fields + location + content info (item_id, item_title)
- (D) Other (please specify)

**Confirmation after user selection**:
> "You chose [A/B/C/D]. We'll track [specific fields]. Does that work?"

---

## Scenario 6: Error Handling Approach

### ❌ Open-Ended Question (Avoid)
"What happens if the operation fails?"

**Problem**: User might not consider all error scenarios.

### ✅ Structured Question (Recommended)

**Question**: "If the operation fails, what should users see?"

**Options**:
- (A) Error message + retry button
- (B) Error message + go back option
- (C) Error message + contact support
- (D) Other (please specify)

**Follow-up question after selection**:
> "You chose [A/B/C/D]. For [specific error type], do we need special handling?"

---

## Scenario 7: Data Display Format

### ❌ Open-Ended Question (Avoid)
"How should data be displayed?"

**Problem**: User might not understand display format trade-offs.

### ✅ Structured Question (Recommended)

**Question**: "How should data be displayed?"

**Options**:
- (A) List format (good for quick browsing)
- (B) Card format (good for detailed info)
- (C) Table format (good for comparison)
- (D) Chart format (good for trends)

**Confirmation after user selection**:
> "You chose [A/B/C/D]. Users can [specific actions]. Right?"

---

## Scenario 8: Permission Control

### ❌ Open-Ended Question (Avoid)
"Who can access this feature?"

**Problem**: User might miss permission requirements for some roles.

### ✅ Structured Question (Recommended)

**Question**: "Which user roles can access this feature?"

**Options**:
- (A) Admins only
- (B) Admins + editors
- (C) All authenticated users
- (D) All users (including unauthenticated)

**Follow-up question after selection**:
> "You chose [A/B/C/D]. For [other roles], can they view but not edit?"

---

## Scenario 9: Time Constraints

### ❌ Open-Ended Question (Avoid)
"Does this feature have time limits?"

**Problem**: User might not consider timing factors.

### ✅ Structured Question (Recommended)

**Question**: "Does this feature have time constraints?"

**Options**:
- (A) No time limit
- (B) Fixed deadline (please specify)
- (C) Relative time limit (e.g., within 7 days)
- (D) Other (please specify)

**Confirmation after user selection**:
> "You chose [A/B/C/D]. This means [specific time constraint]. Correct?"

---

## Scenario 10: Cost vs. Benefit Trade-off

### ❌ Open-Ended Question (Avoid)
"Is this feature worth building?"

**Problem**: User might not have clear decision criteria.

### ✅ Structured Question (Recommended)

**Question**: "Considering implementation cost and expected benefit, how should we prioritize this?"

**Options**:
- (A) High benefit, low cost → P0 (must do)
- (B) High benefit, high cost → P1 (should do)
- (C) Low benefit, low cost → P2 (can do)
- (D) Low benefit, high cost → Don't do (add to backlog)

**Confirmation after user selection**:
> "You think this is [A/B/C/D]. This means we should [specific action]. Right?"

---

## Decision Tree Example

### User Story Discussion Flow

```
Start
  ↓
Question 1: Does this story involve UI?
  ├─ Yes → Need ASCII wireframe
  │   ↓
  │   Question 2: What's the interaction method?
  │   ├─ Click → Confirm button position and text
  │   ├─ Swipe → Confirm swipe direction and range
  │   └─ Other → Describe in detail
  │
  └─ No → Skip wireframe
      ↓
      Question 3: Does this story involve data processing?
      ├─ Yes → Confirm data source and logic
      └─ No → Continue to next step
```

---

## Anti-Patterns (What to Avoid)

### ❌ Anti-Pattern 1: Over-Open Questions
"Do you have any other ideas?"

**Problem**: User might give vague or irrelevant answers.

**Fix**: Provide specific options or questions.

### ❌ Anti-Pattern 2: Assuming User Knowledge
"Should this feature support multi-tenancy?"

**Problem**: User might not understand "multi-tenancy".

**Fix**: Explain the concept first, then provide options.

### ❌ Anti-Pattern 3: Asking Too Many Questions at Once
"What's the scope, priority, users, and interaction method?"

**Problem**: User doesn't know where to start.

**Fix**: Ask one question at a time.

### ❌ Anti-Pattern 4: Ignoring User Uncertainty
User says "I don't know", you continue anyway.

**Problem**: Requirements become vague.

**Fix**: Provide reference options or suggestions to help user decide.

---

## Best Practices Summary

| Practice | Example | Effect |
|----------|---------|--------|
| ✅ Structured questions | "Choose A, B, or C?" | User decides quickly |
| ✅ Provide references | "Common approach is..." | User has reference point |
| ✅ Confirm understanding | "I understand you mean..." | Avoid misunderstandings |
| ✅ Progressive deepening | Ask scope first, then details | Requirements clarify gradually |
| ❌ Open-ended questions | "What do you think?" | User might not know |
| ❌ Assume user knowledge | Use jargon without explaining | User might misunderstand |
| ❌ Ask too many at once | Multiple questions mixed | User confused |
| ❌ Ignore uncertainty | User says "I don't know", continue | Requirements become vague |
