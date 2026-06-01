---
description: Start an automated Plan, Implement, and Review development cycle.
---
I want to build a new feature/fix a bug. Here is my goal: 
$@

Please execute our standard 3-phase cycle:
1. **Explore & Plan:** use the "grill-to-plan" skill. Ask me probing questions one by one. Once you have asked all questions, write the plan to `docs/plans/plan.md`. I will review the plan and provide feedback as necessary- we may iterate on the plan together.
2. **Implement:** Once I have approved the plan, transition to the execution phase, using the "implement-plan" skill. You **MUST** invoke the "implement-plan" skill  via the Skill tool for this phase- do NOT execute the plan inline.
3. **Review:** Once implementation is complete and tests pass, review your work. If you are working in python, use the "python-code-review" skill. Address any issues found in the review, and repeat the review process until there are no more issues.
