# VibProject Project Update & Production Development Workflow

## Purpose

This document defines the standard workflow for taking a VibProject-based project from its documented current state through controlled production updates.

It defines how development work must be:

- Audited
- Documented
- Planned
- Scope-locked
- Divided into phases
- Approved
- Implemented
- Verified
- Recorded

This document is the operational workflow for project updates.

The rules in `project/README.md` remain the governing policy for the private development workspace, Official Baseline Freeze, Scope Lock, and Zero Freedom Policy.

---

# 1. Development Workflow Overview

Every major production update should follow this sequence:

1. Establish the Official Baseline Freeze
2. Perform forensic audit
3. Document the current project state
4. Document production-readiness requirements
5. Create the A-Z phase roadmap
6. Define phase dependencies and execution order
7. Obtain explicit approval
8. Implement one approved phase
9. Verify the completed phase
10. Record the completed phase
11. Update remaining-work records
12. Move to the next approved phase
13. Repeat until the roadmap is complete
14. Perform final production-readiness verification

The project must not be updated in an uncontrolled or random sequence.

---

# 2. Official Baseline Freeze

Before planning a production update, identify and freeze the current approved project state as the Official Baseline Freeze.

The baseline is the reference point against which the planned update is analyzed.

The baseline audit must establish:

- Current features
- Current workflows
- Current architecture
- Current UI/UX
- Current backend behavior
- Current persistence behavior
- Current recovery behavior
- Current reporting
- Current logging
- Current error handling
- Current documentation
- Current configuration
- Current file/module structure
- Existing integrations and dependencies
- Existing limitations and known issues

No implementation should begin merely because an issue or improvement has been discovered during the audit.

Discovery and implementation remain separate.

---

# 3. Baseline Forensic Audit

The Official Baseline must be inspected before an update plan is finalized.

The audit should determine:

### Existing State

- What already works
- What already exists
- What can be reused
- What workflows already exist
- What components are already available
- What behavior must remain unchanged

### Required State

- What the requested update requires
- What new functionality is required
- What existing functionality must be extended
- What new UI, workflow, backend, persistence, or documentation work is required

### Gap

For every required change, identify the difference between:

- Current baseline state
- Required updated state

The audit must be sufficient to create an implementation plan that matches the real project.

---

# 4. Production-Readiness Report

Before production implementation begins, document all known work required to reach the intended production state.

The production-readiness report should include:

- Required feature updates
- Required workflow updates
- Required UI/UX updates
- Required backend updates
- Required persistence/recovery updates
- Required reporting/logging updates
- Required error handling
- Required configuration
- Required documentation
- Required testing/verification
- Other required production-readiness work discovered during the forensic audit

The report must distinguish between:

- Already working
- Required update
- Optional/unapproved improvement
- Not required

Unapproved improvements must not silently become part of the production scope.

---

# 5. A-Z Phase Roadmap

All approved production work must be organized into logical phases.

Each phase should have a clear purpose and should be executable and verifiable independently where practical.

Each phase record should define:

- Phase number
- Phase name
- Objective
- Features/changes included
- Affected areas
- Dependencies
- Expected result
- Verification requirements
- Documentation requirements
- What must remain unchanged

The roadmap must establish a clear execution order.

Example structure:

```text
Phase 01
   ↓
Phase 02
   ↓
Phase 03
   ↓
...
```

A later phase must not be started before its required predecessor phases are completed and verified.

---

# 6. Scope Lock Per Phase

Before implementing a phase, its scope must be clearly defined.

The approved phase scope determines:

- What will change
- What will be added
- What will be updated
- Where changes may occur
- What existing behavior must remain unchanged

Anything outside the approved scope remains unchanged unless explicitly approved.

This includes:

- Features
- Functions
- Workflows
- Architecture
- UI
- UX
- Naming
- File structure
- Configuration
- Refactoring
- Optimization
- Cleanup

---

# 7. Planning-Only Phase

When an AI agent is asked to prepare an update plan, the task is planning-only until explicit approval is given.

During planning, the agent may:

- Inspect the project
- Perform forensic analysis
- Compare the project against the Official Baseline
- Identify required changes
- Determine affected files/modules
- Determine required UI/UX changes
- Determine workflow impact
- Determine backend impact
- Determine persistence/recovery impact
- Determine documentation changes
- Determine versioning requirements
- Create the phase roadmap
- Prepare the final approval request

During planning, the agent must not:

- Modify production source code
- Implement features
- Fix unrelated bugs
- Refactor code
- Build/package the application
- Generate a replacement patch
- Generate a Replace-Ready Delta Patch ZIP
- Perform production implementation

Planning ends with a clear plan and an exact approval requirement.

---

# 8. Approval Gate

Implementation begins only after explicit approval of the applicable plan/scope.

The approval should correspond to the planned work.

Before approval, the final plan should clearly answer:

- What will be changed?
- Where will it be changed?
- How will it be implemented?
- Why is it required?
- What will remain unchanged?
- What is the expected result?
- What verification is required?

No implementation should begin if the required approval has not been provided.

---

# 9. Phase Implementation

After approval, implement only the approved phase.

Implementation must:

- Follow the approved plan
- Respect the Official Baseline Freeze
- Respect the Zero Freedom Policy
- Preserve existing functionality outside the approved scope
- Reuse existing project capabilities where appropriate
- Avoid unnecessary architectural changes
- Avoid unrelated cleanup
- Avoid unrelated optimization
- Avoid unrelated UI/UX changes

If implementation reveals a requirement outside the approved scope, stop that additional work and record it for separate approval.

---

# 10. Phase Verification

A phase is not considered complete merely because its code has been written.

After implementation, verify:

- New functionality works
- Updated functionality works
- Existing functionality remains working
- Existing workflows remain intact
- No unintended behavior changed
- Required UI/UX behavior works
- Required persistence/recovery behavior works
- Required logging/reporting works
- Required error handling works
- Documentation is updated where required

The verification result must be recorded before the phase is marked complete.

---

# 11. Phase Completion Log

Maintain a clear record of completed phases.

For each completed phase, record:

- Phase number
- Phase name
- Completion status
- Features added
- Features updated
- Affected components
- Verification result
- Documentation updated
- Version/update identifier
- Remaining related work

The project record must always make it possible to answer:

- How many phases are complete?
- Which phases are complete?
- What was completed in each phase?
- Which phases remain?
- What is planned for the next phase?

This prevents development from becoming disorganized.

---

# 12. Remaining Work Tracking

After every completed phase, update the remaining-work record.

At minimum, maintain:

```text
Completed:
- ...

Current:
- ...

Remaining:
- ...

Next:
- ...
```

Only approved work should appear as planned implementation work.

New discoveries that require additional scope must be separately identified rather than silently inserted into the existing roadmap.

---

# 13. Error Handling Documentation

The project must maintain an internal error-handling record.

It should identify:

### Existing Error Handling

- What error handling currently exists
- Where it exists
- Which workflows it protects
- What behavior occurs when errors happen

### Required Error Handling

- Missing error handling
- Known failure cases
- Recovery requirements
- User-facing error behavior
- Logging requirements
- Validation requirements
- Future error-handling work

Each required error-handling improvement should be associated with an appropriate phase when practical.

---

# 14. Actual Working Feature Record

Planning and actual working functionality must never be treated as the same thing.

Maintain a record of the project's actual current working state.

Use a distinction such as:

```text
Working:
✓ Feature A
✓ Feature B

Pending:
○ Feature C
○ Feature D
```

A feature must not be marked as working merely because:

- It is planned
- It is partially implemented
- Code exists
- A UI exists
- An implementation was attempted

It should be recorded as working only after appropriate verification.

---

# 15. Documentation Update Policy

After an approved update is completed, update the required documentation records.

### Internal documentation

Use `project/` for:

- Planning records
- Phase records
- Internal implementation records
- Baseline records
- Internal decisions
- Remaining-work records
- Internal technical context

### Public documentation

Update public-facing documentation when the completed change affects users.

This may include:

- `docs/` for public/user documentation
- `docs/release-notes/` for public release/update information
- Public `CHANGELOG.md` when the project maintains one

The root `README.md` is structure-only and should be updated only when the repository/project structure or folder responsibility changes.

Public documentation must remain public-friendly and must not expose private/internal development information. Internal implementation and management records remain under `project/`.

---

# 16. Versioning

Every approved production update should have a clearly recorded version/update identity according to the project's versioning policy.

When a phase changes the project version, record:

- Previous version
- New version
- Reason for the version change
- Completed update scope

The exact versioning scheme is project-specific and must not be changed without approval.

---

# 17. Git / Repository Record

Git operations are not automatically performed by this workflow.

The project owner/developer controls:

- `git init`
- `git add`
- `git commit`
- `git remote`
- `git push`

When an update requires a Git commit, the required commit information should be documented as part of the phase completion/update record.

This workflow does not authorize an AI agent to perform Git operations unless separately and explicitly instructed.

---

# 18. Phase Dependency and Sequence Rules

Phases must be implemented in the order defined by the approved roadmap unless an explicit change to the roadmap is approved.

If a dependency changes:

1. Stop before making unrelated changes.
2. Document the dependency issue.
3. Determine the required roadmap adjustment.
4. Obtain approval when the approved scope/order must change.
5. Continue only under the updated approved plan.

Do not skip required phases merely because a later phase appears easier.

---

# 19. Final Production-Readiness Review

After all planned phases are complete, perform a final review against:

- Official Baseline
- Approved roadmap
- Completed phase records
- Actual working feature record
- Error-handling record
- Documentation requirements
- Remaining-work record
- Required verification
- Version/update records

The final review should clearly identify:

```text
Completed
Remaining
Known limitations
Production-readiness status
```

A project should not be described as production-ready merely because the planned implementation work has been completed.

The final production-readiness state must be supported by verification.

---

# 20. Core Development Rule

The complete development cycle is:

```text
Official Baseline Freeze
        ↓
Forensic Audit
        ↓
Current-State Documentation
        ↓
Production-Readiness Report
        ↓
A-Z Phase Roadmap
        ↓
Scope Lock
        ↓
Approval
        ↓
Phase Implementation
        ↓
Verification
        ↓
Phase Completion Log
        ↓
Remaining Work Update
        ↓
Next Phase
        ↓
...
        ↓
Final Production-Readiness Review
```

The purpose of this workflow is to ensure that project development remains:

- Controlled
- Traceable
- Scope-locked
- Baseline-safe
- Phase-based
- Verifiable
- Documented
- Predictable

No phase should be implemented outside its approved scope.
