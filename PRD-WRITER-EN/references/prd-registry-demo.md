# PRD Registry (Example)

Usage Convention:
- For each new PRD, add a new row with a fixed "Version" (serves as unique identifier in the registry, never changes).
- Individual PRD documents can iterate internally using `v0.1 / v0.2 / v1.0`; the registry doesn't record internal minor versions.

| Version | Title | Requirements Content (Detailed Summary) | PRD Link |
|---------|-------|----------------------------------------|----------|
| PRD-001 | Batch Task Creation | Goal: Enable POC users to complete "upload images + enter standard answers + configure grading parameters + initiate task" on one page. Scope: Support ≤20 images, each ≤10MB; support deleting selected images; standard answers in "number. word" format with real-time validation; disable "Start Grading" when validation fails and show reason. Exceptions: Clear prompts when exceeding limits/invalid format without breaking entered content; preserve input on creation failure with retry option. Success: Redirect to task monitoring view showing "Processing x/y". Non-goal: No one-click reuse of historical task configurations. | docs/prd/PRD-001.md |
| PRD-002 | Task Monitoring Page (List + Detail) | Goal: Users can view task progress and results, quickly identify failure reasons. Scope: List shows task status (Processing/Success/Failure) and progress (x/y), supports filtering by status; detail shows each image's result and failure reason (user-readable text). Empty/Error/Loading: Empty state provides guidance; loading failure provides retry without losing filter conditions; processing state provides continuous refresh or manual refresh option. | docs/prd/PRD-002.md |
| PRD-003 | Login State Exception Handling | Goal: Unify user prompts and redirect rules for "session expired/login invalid/no permission" to reduce confusion and misoperation. Scope: Site-wide unified prompt method; clear text, buttons, and redirect destinations for different scenarios; avoid user operation loss (remind to save/retry later when feasible). Boundaries: Don't spam consecutive popups on repeated triggers; deep links should return to correct page. | docs/prd/PRD-003.md |
