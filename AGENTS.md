# VibProject AI & Developer Repository Rules

## Purpose

This file is the repository-level behavior and document-placement entrypoint for AI agents and developers.

Detailed internal project governance belongs under `project/`.

## 1. Template Repository vs Fresh Project

These contexts must remain distinct.

### Vib Project Template repository

- `project/` is an intentional, tracked part of the template structure.
- Template governance files and placeholders under `project/` remain in the template.
- Do not hide, delete, untrack, or remove that structure during normal template maintenance.

### Fresh project created from the template

- `project/` becomes that specific project's private/internal development and management workspace.
- Public user documentation belongs in `docs/`, not in the private workspace.
- Git initialization and publishing remain manual.

## 2. Document Placement

```text
Internal project development/management → project/
Public user documentation               → docs/
Repository structure explanation        → README.md
```

### `project/`

Use for internal project planning, architecture, research, specifications, development governance, AI/developer instructions, update records, implementation records, progress records, and other private project-management context.

The governing workspace policy is `project/README.md`. The controlled update lifecycle is `project/PROJECT_UPDATE_WORKFLOW.md`.

### `docs/`

Use only for public, user-facing documentation such as getting started, guides, features, configuration, public APIs, tutorials, FAQ, troubleshooting, release notes, and other verified user-visible information.

Do not place private development or management information in public documentation.

### Root `README.md`

The root README has one responsibility: explain the project/template structure.

Do not use it as the project's internal development-management guide or as end-user feature documentation.

## 3. `vibproject.ygit`

The template manifest uses VPMS v2 and remains technology-neutral.

A generated project should update the manifest with metadata that reflects its actual implementation.

## 4. Git Behavior

Git initialization and publishing are manual.

Repository automation and setup scripts must not automatically run:

```text
git init
git add
git commit
git push
```

Do not modify Git history, remotes, tracked state, or publish changes unless explicitly authorized.

## 5. Scope and Internal Governance

AI agents and developers must follow the approved internal policies defined under `project/`, including `project/README.md` and `project/PROJECT_UPDATE_WORKFLOW.md`.

Do not make unrelated structural, behavioral, documentation, or implementation changes without explicit authorization.
