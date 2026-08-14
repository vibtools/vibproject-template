# Public Documentation Structure

## Purpose

This document defines the standard structure of the public `docs/` workspace.

Its purpose is to ensure that AI agents and developers place each public documentation page in the correct section and do not create unnecessary or conflicting documentation structures.

The current documentation structure is:

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

This structure must remain consistent with the documentation structure declared by `docs.manifest.ygit`.

---

## 1. `index.md`

### Purpose

The public entry point for the documentation package.

### Use for

- Documentation overview
- What the project documentation contains
- Where users should begin
- High-level navigation/introduction

### Do not use for

- Private development information
- Internal planning
- Detailed internal architecture
- AI working notes
- Private TODOs

The manifest's `documentation.defaultDocument` must point to the actual default entry document.

---

## 2. `getting-started/`

### Purpose

Help a new user begin using the project as quickly as possible.

### Use for

- First-time setup
- Quick start
- Initial usage
- Basic prerequisites
- First successful run
- Basic first steps

### Do not use for

- Advanced internal development
- Private project planning
- Detailed internal implementation notes

---

## 3. `guides/`

### Purpose

Provide task-oriented public instructions for using or managing supported project functionality.

### Use for

- How-to guides
- Task-based instructions
- Practical workflows
- Common usage procedures
- Supported operational tasks

### Do not use for

- Private development planning
- Internal architecture decisions
- AI working notes
- Private research

A guide should help a reader accomplish a defined task.

---

## 4. `features/`

### Purpose

Document public project features and their supported behavior.

### Use for

- Feature descriptions
- Feature capabilities
- Feature usage
- Supported behavior
- User-visible feature configuration
- Feature limitations that users need to know

### Do not use for

- Internal feature planning
- Unreleased private feature ideas
- Internal implementation debates
- Private roadmap information

A planned feature must not be documented as an available feature until the project actually supports it.

---

## 5. `configuration/`

### Purpose

Document public configuration and supported configuration options.

### Use for

- Configuration options
- Environment/configuration requirements
- Supported settings
- User-facing configuration procedures
- Configuration examples
- Configuration-related behavior

### Do not use for

- Private credentials
- Secrets
- Internal deployment notes
- Private infrastructure information
- Unreleased internal configuration decisions

Never publish credentials, tokens, private keys, or other confidential information.

---

## 6. `api/`

### Purpose

Provide public API reference documentation.

### Use for

- Endpoints
- Parameters
- Request formats
- Response formats
- Authentication behavior intended for users
- Error responses
- Public API examples
- Public API usage requirements

### Do not use for

- Private internal APIs
- Internal service-to-service details that are not public
- Private credentials
- Internal architecture discussions

Document only the supported public API contract.

---

## 7. `tutorials/`

### Purpose

Provide guided, step-by-step learning material.

### Use for

- Complete walkthroughs
- Learning-oriented examples
- End-to-end usage scenarios
- Step-by-step practical demonstrations

### Do not use for

- Internal development procedures
- Private implementation notes
- Internal debugging records

A tutorial should guide the reader through a complete learning or usage scenario.

---

## 8. `faq/`

### Purpose

Provide answers to common public questions.

### Use for

- Frequently asked user questions
- Short explanations
- Common usage questions
- Common configuration questions
- Common compatibility questions

### Do not use for

- Private team questions
- Internal project discussions
- Private decisions
- Unresolved internal development questions

---

## 9. `troubleshooting/`

### Purpose

Help users diagnose and resolve supported/common problems.

### Use for

- Common errors
- Installation problems
- Configuration problems
- Runtime problems
- Known user-facing issues
- Diagnostic steps
- Recovery steps available to users

### Do not use for

- Private incident reports
- Internal debugging logs
- Confidential system information
- Internal developer investigations

Internal investigation records belong in `project/`.

---

## 10. `release-notes/`

### Purpose

Record public-facing project updates and releases.

### Use for

- New features
- Improvements
- Bug fixes
- User-visible behavior changes
- Compatibility changes
- Public migration instructions
- Other changes relevant to users

### Do not use for

- Private development discussions
- Internal implementation debates
- Team decisions
- Private workarounds
- Confidential information
- Unreleased internal plans

Release notes must remain public-friendly.

---

## 11. `media/`

### Purpose

Store documentation assets used by public documentation.

Examples include:

- Images
- Diagrams
- Videos
- Other documentation media

`media/` is an asset area, not a documentation-page section.

The documentation manifest may exclude media paths from Markdown/MDX page discovery.

Do not use `media/` to hide or store private documentation.

---

# 12. Choosing the Correct Section

Before creating a new document, ask:

### Is it public?

If no:

```text
project/
```

If yes, continue.

### What is the primary purpose?

Use this quick mapping:

```text
New user starts
    → getting-started/

Task/how-to
    → guides/

Feature behavior
    → features/

Configuration
    → configuration/

Public API
    → api/

Step-by-step learning
    → tutorials/

Common question
    → faq/

Problem diagnosis/fix
    → troubleshooting/

Public release/update
    → release-notes/
```

If it is the documentation package's general landing page:

```text
index.md
```

---

# 13. Do Not Duplicate Documentation

Before creating a new page:

1. Check whether an existing page already covers the topic.
2. If it does, update the existing page when appropriate.
3. Create a new page only when the topic has a distinct documentation purpose.
4. Do not create duplicate pages merely because another section could also contain similar information.

The goal is a clear, maintainable documentation set.

---

# 14. Creating a New Documentation Section

Do not create a new top-level documentation section automatically.

A new section should be considered only when:

- The content represents a distinct public documentation category.
- Existing sections cannot reasonably contain it.
- The new category is useful enough to justify permanent structure.
- The documentation structure requires the new section.

When a new section is approved:

1. Create the required directory.
2. Define its purpose.
3. Update this structure document.
4. Update `docs.manifest.ygit`.
5. Ensure the manifest section path matches the actual directory.
6. Verify discovery behavior.
7. Document the change in the appropriate project records.

Do not create a new section solely for one temporary document.

---

# 15. Manifest and Filesystem Must Match

The documentation structure declared in `docs.manifest.ygit` and the actual `docs/` filesystem must remain consistent.

For every declared documentation section:

```text
Manifest section path
        ↓
Actual docs/ directory
```

must resolve to the intended location.

If a section is renamed, moved, added, or removed, review the manifest at the same time.

Do not leave stale manifest paths.

---

# 16. Discovery Rules Must Be Respected

The documentation platform discovers documentation according to `docs.manifest.ygit`.

Therefore:

- Use supported documentation file extensions.
- Respect the manifest's include rules.
- Respect the manifest's exclude rules.
- Do not assume every file inside `docs/` is a documentation page.
- Keep documentation assets separate from documentation pages.
- Do not create hidden/private documentation and expect the public documentation system to protect it.

The manifest remains the machine-readable source for documentation discovery behavior.

---

# 17. Public Documentation Boundary

The section structure does not override the public/private boundary.

Even if a topic appears to fit a public section, it must not be published if the information is private or confidential.

Examples:

```text
Internal architecture decision
    → project/

Private roadmap
    → project/

AI working notes
    → project/

Public feature guide
    → docs/features/

Public API reference
    → docs/api/

Public release note
    → docs/release-notes/
```

---

# 18. Relationship With Other Documentation Rules

This document answers:

> **Where should a public document go?**

It does not define the full writing style or manifest syntax.

Use:

```text
docs/README.md
    → Public documentation workspace policy

docs/guides/documentation-structure.md
    → Document placement and section structure

docs/guides/documentation-writing.md
    → How public documentation should be written

docs/guides/docs-manifest.md
    → How docs.manifest.ygit should be created and maintained
```

Follow all applicable documents together.

---

# 19. Default Rule

When selecting a documentation location:

1. Determine whether the information is public.
2. Identify the primary purpose of the document.
3. Select the existing section that best matches that purpose.
4. Check for an existing document before creating a new one.
5. Keep the documentation structure consistent with `docs.manifest.ygit`.
6. Keep private/internal information inside `project/`.

The objective is a documentation system that is predictable for users, developers, AI agents, and automated documentation platforms.
