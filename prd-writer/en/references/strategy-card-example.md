# Product Strategy Card Example

The following example demonstrates the expected output format for Step 0 Product Strategy Alignment.

---

## Product Strategy Card: Batch Grading Feature

### Problem Definition
- **Core Problem**: Teachers spend too much time grading assignments, unable to provide timely feedback to students
- **Target Users**: K12 English teachers (POC phase for internal test users)
- **Current Pain Points**: Manually grading each assignment takes 2-3 minutes; one class of 40 students requires 1.5+ hours

### Value Hypothesis
| Value Type | Description |
|------------|-------------|
| User Value | Teachers' grading efficiency improves 10x, more time for instructional design |
| Business Value | Serves as core product selling point, improves B2B sales conversion rate |

### Success Metrics
| Metric Name | Priority | Baseline | Target | Measurement Method |
|-------------|----------|----------|--------|-------------------|
| Grading Efficiency | P0 | 2-3 min/paper | <20 sec/paper | System logs |
| Grading Accuracy | P0 | N/A | ≥90% | Manual spot check |
| User Satisfaction | P1 | N/A | ≥4/5 | POC survey |

### Boundaries and Trade-offs

#### In Scope
- Image upload and standard answer configuration
- Batch grading task execution
- Result viewing and export

#### Out of Scope (Rejected Requirements)
| Requirement Description | Rejection Reason | Include in Future Planning |
|------------------------|------------------|---------------------------|
| Handwriting recognition | Technology immature, accuracy <70% | Yes (Q2) |
| Multi-class combined grading | Adds 50% development effort, non-core scenario | No |
| Auto-push grading results to students | Depends on messaging center infrastructure | Yes (Q2) |

#### Future Candidates
- Support for more subjects (Math, Language Arts)
- Custom grading templates
- Student-side grading result viewing

---

## Usage Notes

This card is produced during the **Step 0: Strategy Alignment** phase and serves as the strategic framework for subsequent PRD writing.

### When to Trigger Step 0

- User explicitly requests "need product strategy alignment"
- Or skill judges the requirement as complex (involving multiple stages/multiple user groups/core business processes)

### Key Points to Fill In

1. **Problem Definition**: Focus on "whose" "what pain point"
2. **Value Hypothesis**: Distinguish between user value and business value
3. **Success Metrics**:
   - P0 must be quantified (have specific numbers)
   - P1/P2 can be qualitative (descriptive goals)
4. **Boundaries and Trade-offs**: Explicitly record "not doing decisions" and reasons - this is the most important part
