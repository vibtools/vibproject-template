# Internal Project Management Workspace

## Purpose

The `project/` directory is the canonical internal project-management and development workspace for VibProject-based repositories.

It holds the information needed to plan, control, develop, audit, update, and maintain a project without mixing that internal context into public user documentation.

## Template Repository vs Fresh Project

These contexts are intentionally different.

### Vib Project Template repository

The template repository **tracks** its `project/` structure, governance documents, and placeholders. They define the internal workspace that generated projects inherit.

These tracked template documents define generic project-management rules and structure; they must not contain private data for any specific generated project.

The template's tracked `project/` content is therefore intentional and must not be removed, hidden, or untracked merely because generated projects use the folder privately.

### Fresh project created from the template

After the template is copied for a real project, that project's `project/` workspace is private/internal development material. It should not be intentionally published with public project content.

`setup-project.ps1` prepares this fresh-project privacy rule before manual Git initialization.

## What Belongs Here

Use `project/` for internal development-management information such as:

- Project planning and roadmap
- Feature and development planning
- Official Baseline Freeze records
- Scope records
- Zero Freedom policy
- Architecture and ADRs
- Technical research
- Specifications
- Development guidelines
- AI/developer instructions
- Internal implementation notes and records
- Phase roadmaps and progress tracking
- Error-handling planning and records
- Project update workflow
- Internal TODOs and decisions
- Other internal project-management documentation

Do not place end-user documentation here. Public user documentation belongs in `docs/`.

## Workspace Structure

```text
project/
├── README.md
├── PROJECT_UPDATE_WORKFLOW.md
├── planning/
├── architecture/
├── adr/
├── research/
└── specifications/
```

### `planning/`

Roadmaps, phase plans, scope records, progress tracking, and other planning material.

### `architecture/`

Internal system architecture and technical architecture records.

### `adr/`

Architecture Decision Records.

### `research/`

Technical investigation, alternatives, evidence, and research used for project decisions.

### `specifications/`

Internal specifications, development guidelines, documentation-governance specifications, AI/developer rules, and other controlled internal standards.

## Official Baseline Freeze

When an Official Baseline Freeze is established, it becomes the protected reference state for subsequent development.

Unless explicitly approved, development must not:

- Remove existing features or functionality
- Replace existing behavior
- Change existing workflows
- Change existing architecture
- Rename existing components
- Change existing file structure
- Modify unrelated UI/UX
- Perform unrelated refactoring
- Perform unrelated optimization or cleanup
- Introduce unrelated improvements

Any change outside the approved scope requires explicit authorization.

## Scope Lock

Every planned production update must define an approved scope that identifies:

- What may change
- What may be added or updated
- Where the changes may occur
- What existing behavior must remain unchanged

Features, fixes, refactors, optimizations, cleanup, UI changes, architecture changes, or other work outside that scope must not be introduced automatically.

## Zero Freedom Policy

AI agents and developers must not expand an approved scope on their own.

Do not independently:

- Add extra features
- Remove or replace features
- Redesign unrelated UI
- Refactor unrelated code
- Rename unrelated files or components
- Change unrelated workflows
- Optimize or clean up unrelated areas
- Change architecture without approval
- Modify behavior outside the approved scope

Out-of-scope work must be identified separately and explicitly approved before implementation.

## Planning and Implementation Are Separate

Planning may include inspection, forensic audit, comparison, documentation, scoping, and roadmap creation.

Planning does not automatically authorize implementation. Production changes begin only after the applicable plan and scope have been approved.

## Internal Records Stay Internal

Do not copy internal development-management information into:

- `docs/`
- Root `README.md`
- Public release notes
- Public `CHANGELOG.md`
- Other public-facing project files

Public documentation should describe user-facing behavior and results without exposing unnecessary internal development context.

## AI/Developer Use

AI agents and developers working on a VibProject-based repository must:

1. Use `project/` for internal project-management context.
2. Keep public user documentation in `docs/`.
3. Respect the Official Baseline Freeze.
4. Respect the approved Scope Lock.
5. Follow the Zero Freedom Policy.
6. Keep planning and implementation as separate phases.
7. Preserve approved existing behavior outside the current scope.
8. Record approved planning, implementation, and verification information in the appropriate internal project files.
9. Avoid exposing internal project records through public documentation.
10. Follow `PROJECT_UPDATE_WORKFLOW.md` for controlled project updates.

## Documentation Governance

Internal rules for organizing and writing public documentation are stored under `project/specifications/`.

Current internal documentation-governance files include:

- `project/specifications/documentation-governance.md`
- `project/specifications/documentation-structure.md`
- `project/specifications/documentation-writing.md`
- `project/specifications/docs-manifest.md`

They govern the public `docs/` package but are not themselves public user documentation.

## Default Placement Rule

```text
Internal planning, governance, research, architecture, specifications,
AI/developer instructions, and implementation records → project/

Public information intended to help users understand or use the project → docs/

Repository structure explanation → root README.md
```
