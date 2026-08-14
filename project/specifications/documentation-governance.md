# Documentation Governance Specification

> **Internal governance document.** This file belongs in `project/` and is not public user documentation.

It defines how AI agents, developers, and documentation maintainers organize and maintain the public `docs/` package.

## Purpose

The `docs/` directory is the project's **public documentation workspace**.

Everything written here is intended to help project users or other public readers understand, install, configure, use, and troubleshoot the project.

This directory must remain separate from the private development workspace:

- `project/` = private/internal development
- `docs/` = public/user documentation

Do not use `docs/` as a place for internal planning, private development notes, AI working notes, or confidential project information.

---

## 1. Public Documentation Only

Documentation stored in `docs/` must be suitable for publication.

Allowed content includes:

- Getting Started documentation
- Installation instructions
- User guides
- Feature documentation
- Configuration guides
- Public API documentation
- Tutorials
- FAQs
- Troubleshooting
- Public release notes
- Other user-facing documentation

Do not place the following in `docs/`:

- Private roadmaps
- Internal development plans
- Internal architecture decisions
- ADRs
- Private research
- Internal implementation notes
- Team discussions
- AI working notes
- Private TODOs
- Confidential information
- Unreleased internal decisions

If information is private or internal, keep it inside `project/`.

---

## 2. Documentation Is the Public Product Guide

The purpose of `docs/` is to explain the project from a public/user perspective.

Documentation should answer questions such as:

- What does the project do?
- How do I install it?
- How do I start using it?
- What features are available?
- How do I configure it?
- How do I use a particular feature?
- How do I use the API?
- How do I troubleshoot a problem?
- What changed in a public release?

Write about the user-visible result and the supported behavior.

Do not expose unnecessary internal implementation details merely because they are known to the developer or AI agent.

---

## 3. Documentation Structure

The template provides the following public documentation sections:

```text
docs/
├── index.md
├── getting-started/
├── guides/
├── features/
├── configuration/
├── api/
├── tutorials/
├── faq/
├── troubleshooting/
├── release-notes/
└── media/
```

The purpose of each documentation section is defined separately in:

`project/specifications/documentation-structure.md`

Do not invent a new section when an existing section already matches the documentation purpose.

If a genuinely new public documentation category is required, the documentation structure and `docs.manifest.ygit` must be updated together.

---

## 4. `index.md`

`index.md` is the default entry document for this documentation package.

It is the public documentation landing page.

The documentation manifest identifies the default document through:

```text
documentation.defaultDocument
```

The default document must remain a valid public documentation page.

Do not use `index.md` for private/internal development notes.

---

## 5. `docs.manifest.ygit`

`docs.manifest.ygit` is the machine-readable manifest for this documentation package.

It is not the documentation content itself.

Its purpose is to describe information such as:

- Documentation identity
- Documentation root
- Default document
- Documentation discovery rules
- Documentation structure
- Documentation versions
- Supported vendor-specific extensions

A documentation platform can use the manifest to discover and organize the documentation package automatically.

The manifest must follow the project's adopted DPMS schema.

Do not invent unsupported fields or change the schema contract.

The detailed rules for creating and maintaining the manifest are defined separately in:

`project/specifications/docs-manifest.md`

---

## 6. Documentation Discovery

Documentation files are discovered according to the rules defined by `docs.manifest.ygit`.

The current template is designed to discover supported Markdown documentation recursively.

Documentation assets such as images, diagrams, and videos are kept separately under:

```text
docs/media/
```

The documentation manifest controls which files are included or excluded from documentation discovery.

Do not bypass the manifest by creating undocumented discovery rules elsewhere.

---

## 7. Writing Documentation

Before creating or changing a documentation page:

1. Decide whether the information is public.
2. Select the correct documentation section.
3. Follow the documentation writing rules.
4. Write for the intended reader.
5. Keep internal/private information out.
6. Update the manifest when the documentation structure requires a manifest change.

Detailed writing rules are defined in:

`project/specifications/documentation-writing.md`

---

## 8. Feature Documentation

When a public feature is introduced or materially changed, determine whether its user-facing documentation must be:

- Created
- Updated
- Reorganized
- Extended
- Linked from another public document

Documentation should describe the supported user-facing behavior.

Internal implementation changes do not automatically require exposing implementation details in public documentation.

---

## 9. Public Release Notes

Public release notes belong under:

```text
docs/release-notes/
```

Release notes should describe user-visible changes, such as:

- New features
- Improvements
- Bug fixes
- Compatibility changes
- Public migration requirements
- Other changes relevant to users

Do not include private development discussions, internal decisions, confidential information, or internal workarounds.

---

## 10. Documentation and Private Development Must Stay Separate

Use this decision rule:

> Is the information intended for project users or public readers?

If **yes**:

```text
docs/
```

If **no**:

```text
project/
```

A useful shorthand is:

> `project/` = How we build and manage the project internally.
>
> `docs/` = How users use the project.

When uncertain, do not expose internal information publicly.

---

## 11. AI / Developer Responsibility

AI agents and developers must:

- Keep `docs/` public-facing.
- Select the correct documentation section before writing.
- Follow `project/specifications/documentation-structure.md`.
- Follow `project/specifications/documentation-writing.md`.
- Follow `project/specifications/docs-manifest.md` when working on `docs.manifest.ygit`.
- Preserve the DPMS manifest contract.
- Keep public documentation consistent with the actual supported project behavior.
- Update affected public documentation when a user-visible feature changes.
- Keep private/internal information inside `project/`.
- Avoid creating duplicate documentation when an existing page should be updated.
- Avoid creating new documentation sections without updating the documented structure and manifest.

---

## 12. Source of Truth

For documentation work, use the following responsibility boundary:

```text
Project behavior
    ↓
Actual implemented project

Public documentation
    ↓
docs/

Documentation package metadata
    ↓
docs.manifest.ygit

Private development context
    ↓
project/
```

Documentation must not claim functionality that is not actually supported by the project.

Likewise, a planned or partially implemented feature must not be presented as an actual working feature unless the project state supports that claim.

---

## 13. Documentation Changes Must Remain Traceable

When a public-facing project change requires documentation:

1. Identify the affected documentation.
2. Update the relevant public page.
3. Update the documentation structure only if necessary.
4. Update `docs.manifest.ygit` only when its metadata/discovery/structure/version information actually needs to change.
5. Keep internal development records inside `project/`.

Do not modify the manifest merely because a normal documentation page was edited.

---

## 14. Related Documentation Rules

The documentation workspace is governed by these dedicated documents:

### Documentation Structure

`project/specifications/documentation-structure.md`

Defines where different types of public documentation belong.

### Documentation Writing

`project/specifications/documentation-writing.md`

Defines how public documentation should be written.

### Documentation Manifest

`project/specifications/docs-manifest.md`

Defines how `docs.manifest.ygit` should be created, maintained, and validated.

These documents are part of the template's documentation governance system.

---

## 15. Final Rule

`docs/` is public.

Before putting anything here, ask:

> Would this information be appropriate to publish in the project's public documentation?

If yes, place it in the appropriate documentation section.

If no, keep it in `project/`.

Never use public documentation as a substitute for private development records.
