## Example: Filling Reference
The following example uses real content to demonstrate the depth each module should achieve, helping you align with expected format and granularity when generating PRDs.

```markdown
### Phase 1: Task Submission

#### **US-01: As a POC test user, I want to upload multiple assignment images and configure grading parameters, so that I can initiate a batch grading task at once.**
*   **Value Statement**:
    *   **As a** POC test user
    *   **I want to** complete image upload and standard answer input on one page
    *   **So that** I can trigger batch grading with minimal operations and reduce configuration errors
    *   **Value Type**: [x] User Value  [ ] Business Value  [ ] Technical Debt
    *   **Priority**: P0
    *   **Success Metrics**: Task creation time <30 seconds (from entering page to successful submission)
*   **Business Rules & Logic**:
    1.  **Preconditions**: User is logged in; System has loaded available grading model list.
    2.  **Operation Flow (Happy Path)**:
        1. User enters "Batch Task" page from navigation bar.
        2. In the left "Drag & Drop Upload Area", select ≤20 images, each ≤10MB; file list displays in real-time, supports individual deletion.
        3. In the right "Multi-line Input Box", enter standard answers in "number. word" format; system instantly validates number continuity and English character validity.
        4. User selects grading model (default option), whether to enable "Smart Final Review", and grading weight template (loaded from dropdown).
        5. After all validations pass, "Start Grading" button activates; clicking creates task, page redirects to task monitoring view.
    3.  **Error Handling**:
        * When image size >10MB or extension not in whitelist, system rejects and prompts "Please compress and retry".
        * When standard answer validation fails, specific error displays below input box (e.g., "Line 3 missing number"), and submit button is disabled.
        * When task creation fails with "exceeds batch limit" message, popup reminds "Batch limit is 20 images", preserving entered data for user to adjust.
    4.  **Performance & Capacity Notes**: Single submission supports max 20 images, total size ≤150MB; after clicking "Start Grading", clear feedback should be given within reasonable time; after failure, support retry and minimize user's repeated operations.
*   **Acceptance Criteria**:
    *   **Scenario 1: Successful Submission**
        *   **GIVEN** I have uploaded 10 images and entered valid standard answers
        *   **WHEN** I click "Start Grading"
        *   **THEN** System should redirect to monitoring page, showing task status as "Processing 0/10".
    *   **Scenario 2: Exceeds Batch Limit**
        *   **GIVEN** I try to upload the 21st image
        *   **WHEN** System completes validation
        *   **THEN** Upload is rejected, prompting "Maximum 20 images per batch", uploaded list remains unchanged.
---
*   **Page Layout Wireframe (ASCII Wireframe)**:
    ```text
    +-------------------------------------------------------------+
    | Batch Task Creation                                         |
    +==============================+==============================+
    | Image Upload (Drag & Drop)   | Standard Answers (Multi-line)|
    | - hw_001.jpg   [Delete]      | 1. apple                     |
    | - hw_002.jpg   [Delete]      | 2. banana                    |
    | ...                          | ...                          |
    +------------------------------+------------------------------+
    | Grading Model: [ Default v ]  Smart Review: [x]  Weight: [ Default v ] |
    | [ Cancel ]                                   [ Start Grading ]       |
    +-------------------------------------------------------------+
    ```
```
