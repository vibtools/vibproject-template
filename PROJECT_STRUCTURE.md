# Project Structure Standard

## Purpose

This document defines the repository structure of the Vib Project Template and the responsibility of each major location.

The structure is technology-neutral. A generated project selects its own language, runtime, framework, package manager, build system, and deployment model.

## Standard Repository Structure

```text
.
├── .github/
├── assets/
├── config/
├── data/
├── docs/
├── examples/
├── project/
├── scripts/
├── src/
├── tests/
│
├── .editorconfig
├── .gitattributes
├── .gitignore
├── AGENTS.md
├── CHANGELOG.md
├── LICENSE
├── PROJECT_STRUCTURE.md
├── README.md
├── VERSIONING.md
├── setup-project.ps1
└── vibproject.ygit
```

## Architecture Principles

1. Give each top-level location one clear responsibility.
2. Keep implementation, internal project management, and public documentation separate.
3. Keep internal project-development and management material under `project/`.
4. Keep public/user documentation under `docs/`.
5. Keep the root `README.md` focused on repository structure.
6. Avoid unnecessary top-level folders.
7. Keep the template technology-neutral.
8. Update this document when the approved structure changes.

## Folder Responsibilities

### `src/`

Actual project implementation/source code.

### `tests/`

Automated tests for the actual project.

### `scripts/`

Project utilities such as setup, build, test, release, development, and maintenance scripts.

### `assets/`

Project assets such as images, icons, fonts, themes, or other static resources when required.

### `config/`

Project configuration when required.

### `data/`

Project/runtime data or other data resources when required.

### `examples/`

Public examples and sample usage when required.

### `docs/` — Public user documentation

`docs/` is exclusively for public/user-facing documentation.

Typical sections include:

- Getting Started
- Guides
- Features
- Configuration
- API Reference
- Tutorials
- FAQ
- Troubleshooting
- Release Notes
- Documentation media

Internal project-development or management material does not belong in `docs/`.

### `project/` — Internal project development and management

`project/` is the canonical internal development and management workspace.

It contains the internal records, standards, plans, decisions, research, specifications, architecture material, and governance needed to manage the project.

#### Template repository context

The Vib Project Template repository intentionally includes and tracks the template `project/` structure, its internal governance documents, and its placeholders. This is part of the template architecture.

#### Fresh-project context

When the template is copied into a fresh project, that project's `project/` directory becomes private/internal project-development and management material. It is not public user documentation.

### `.github/`

GitHub-specific repository configuration and community/workflow files.

## Root File Responsibilities

### `README.md`

Explains the repository/project structure only.

### `AGENTS.md`

Repository-level behavior and document-placement rules for AI agents and developers. Detailed internal governance remains under `project/`.

### `PROJECT_STRUCTURE.md`

The detailed repository structure standard.

### `vibproject.ygit`

Technology-neutral VPMS v2 project metadata.

### `docs/docs.manifest.ygit`

DPMS v1 manifest for the public `docs/` package.

### `CHANGELOG.md`

Public change history when maintained.

### `VERSIONING.md`

Public versioning information when maintained.

### `LICENSE`

Open-source licensing terms.

### `.gitignore`

Repository ignore rules. The template repository must not hide its tracked `project/` structure; fresh-project privacy is prepared by the setup workflow.

### `setup-project.ps1`

Fresh-project workspace preparation without automatic Git publishing operations.

## Responsibility Boundary

```text
project/  → INTERNAL project development and management
docs/     → PUBLIC user documentation
README.md → PROJECT STRUCTURE only
```

This responsibility boundary applies to the template architecture and should remain clear in projects derived from it.
