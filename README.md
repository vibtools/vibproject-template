# Vib Project Template — Project Structure

This README explains only the structure and responsibility boundaries of the Vib Project Template.

The template is technology-neutral. A project created from it chooses its own implementation language, runtime, framework, package manager, build system, and deployment model.

## Repository Structure

```text
.
├── .github/              GitHub repository configuration
├── assets/               Project assets
├── config/               Project configuration
├── data/                 Project or runtime data
├── docs/                 Public/user documentation
├── examples/             Public examples and sample usage
├── project/              Internal project development and management workspace
├── scripts/              Project utility scripts
├── src/                  Project implementation/source code
├── tests/                Automated tests
│
├── .editorconfig
├── .gitattributes
├── .gitignore
├── AGENTS.md             Repository behavior and document-placement rules
├── CHANGELOG.md          Public change history when maintained
├── LICENSE               Open-source license
├── PROJECT_STRUCTURE.md  Detailed structure reference
├── README.md              Structure overview
├── VERSIONING.md          Public versioning information when maintained
├── setup-project.ps1     Fresh-project workspace preparation
└── vibproject.ygit       Technology-neutral VPMS v2 project manifest
```

## Folder Responsibilities

### `project/`

Internal project development and management workspace.

The Vib Project Template repository intentionally includes and tracks this structure. In a fresh project created from the template, the same directory is used as that project's private/internal workspace.

### `docs/`

Public, user-facing documentation. It is the documentation package described by `docs/docs.manifest.ygit`.

### `src/`

Actual project implementation/source code.

### `tests/`

Automated tests for the actual project.

### `scripts/`

Project utilities such as setup, build, test, release, and maintenance scripts.

### `assets/`

Project assets such as images, icons, fonts, themes, or other static resources when required.

### `config/` and `data/`

Project configuration and project/runtime data when required.

### `examples/`

Public examples or sample usage when required.

### `.github/`

GitHub-specific repository configuration.

## Root File Responsibilities

- `AGENTS.md` defines repository behavior and document-placement rules.
- `PROJECT_STRUCTURE.md` defines the detailed repository structure standard.
- `vibproject.ygit` describes the repository through VPMS v2.
- `LICENSE` contains the open-source license.
- `CHANGELOG.md` is reserved for public change history when used.
- `setup-project.ps1` prepares a copied template as a fresh project workspace without performing Git publishing operations.

## Responsibility Boundary

```text
project/  → INTERNAL project development and management workspace
docs/     → PUBLIC user documentation
README.md → PROJECT STRUCTURE only
```
