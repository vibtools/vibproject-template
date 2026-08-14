# Documentation Writing Guide

## Purpose

This internal specification defines how AI agents and developers write both internal project-development documentation under `project/` and public/user documentation under `docs/`, while keeping the two responsibilities separate.

The governing placement rule is:

```text
Internal project development/management → project/
Public/user documentation               → docs/
```

## Internal Writing — `project/`

Internal project documentation may record planning, roadmaps, architecture, ADRs, research, specifications, approved governance, development decisions, implementation records, progress records, error-handling plans, and AI/developer working instructions.

Write internal records for project management and development accuracy. Do not copy project-specific private records into public documentation.

## Public Writing — `docs/`

Public documentation should contain only verified information that helps users understand or use the project: getting started, installation or startup when actually applicable, feature usage, configuration, guides, tutorials, public APIs, FAQ, troubleshooting, release notes, and other user-visible updates.

The goal is to keep public documentation:

- Public-facing
- Clear
- Accurate
- Consistent
- Maintainable
- Useful to the intended reader
- Consistent with the actual supported project behavior

This document defines how documentation should be written.

The correct location for a document is defined by:

`project/specifications/documentation-structure.md`

The rules for `docs.manifest.ygit` are defined by:

`project/specifications/docs-manifest.md`

---

# 1. Public Documentation Rule

Everything written inside `docs/` must be suitable for public publication.

Write for:

- Project users
- Public developers
- API consumers
- Operators or administrators when the documentation is intended for them
- Other readers who need to understand supported project behavior

Do not write private development material into public documentation.

Private/internal information belongs in:

```text
project/
```

---

# 2. Accuracy Rule

Documentation must describe the project's actual supported behavior.

Do not document a feature as available merely because:

- It is planned
- It is mentioned in a roadmap
- Code has been partially written
- A UI placeholder exists
- An implementation attempt exists
- A future design has been discussed

A feature should be presented as available only when the project actually supports the documented behavior.

If a limitation is relevant to users, document the limitation clearly.

---

# 3. User-Facing Writing Style

Write documentation so that the intended reader can understand and use the project without needing private development context.

Prefer:

- Clear language
- Direct instructions
- Short, meaningful sections
- Descriptive headings
- Concrete examples
- Explicit prerequisites
- Step-by-step instructions where appropriate

Avoid:

- Internal jargon that users do not need
- Private project terminology
- Team discussions
- Development commentary
- Unnecessary implementation details
- Speculation presented as fact

Documentation should explain what the user needs to know, not expose how the internal development process works.

---

# 4. Standard Page Structure

When appropriate, a documentation page should use a structure similar to:

```text
# Title

Short introduction

## Overview

What this page covers.

## Prerequisites

What the reader needs before following the page.

## Steps / Usage

The actual procedure or explanation.

## Example

A practical example when useful.

## Configuration / Options

Relevant settings when applicable.

## Troubleshooting

Common problems when applicable.

## Related Documentation

Links to relevant public documentation.
```

Not every page requires every section.

Use only sections that are useful for the document's purpose.

---

# 5. Title and Heading Rules

Use clear, descriptive headings.

The title should identify the subject immediately.

Good:

```text
# Installing the Project
# Configuring SMTP
# Using the Browser Engine
# API Authentication
```

Avoid vague titles such as:

```text
# Notes
# Stuff
# Information
# Important
```

Use heading levels in logical order.

Do not use headings only for visual styling.

---

# 6. Getting Started Documentation

Documents under:

```text
docs/getting-started/
```

should help a new user reach a useful first result.

Include relevant information such as:

- Prerequisites
- Installation or setup requirements
- First launch/run
- Initial configuration
- First successful workflow
- Basic next steps

Do not assume the reader already knows the project's internal architecture.

---

# 7. Guide Writing

Documents under:

```text
docs/guides/
```

should normally be task-oriented.

A guide should answer:

> What does the reader want to accomplish, and how do they accomplish it?

Prefer:

```text
1. Prepare ...
2. Configure ...
3. Run ...
4. Verify ...
```

Include expected results when they help the reader confirm that the procedure worked.

---

# 8. Feature Documentation

Documents under:

```text
docs/features/
```

should describe public feature behavior.

A feature page may include:

- What the feature does
- Why it is useful
- How to use it
- Supported options
- Requirements
- Limitations
- Examples
- Related documentation

Do not expose private implementation decisions simply because the feature has a technical implementation.

Document the supported behavior.

---

# 9. Configuration Documentation

Documents under:

```text
docs/configuration/
```

should explain supported configuration.

Where useful, document:

- Configuration name
- Purpose
- Accepted values
- Default behavior
- Example configuration
- Effect of changing the value
- Restart/reload requirements
- Related configuration

Never publish:

- Passwords
- API secrets
- Private keys
- Access tokens
- Confidential infrastructure details

Use safe placeholders in examples.

---

# 10. API Documentation

Documents under:

```text
docs/api/
```

should describe the supported public API contract.

Where applicable, include:

- Endpoint
- HTTP method
- Authentication requirements
- Request parameters
- Request body
- Response format
- Status codes
- Error responses
- Example requests
- Example responses
- Usage notes

Do not document private/internal APIs as public APIs.

Do not include real credentials or private tokens.

---

# 11. Tutorial Writing

Documents under:

```text
docs/tutorials/
```

should guide the reader through a complete learning or usage scenario.

A tutorial should normally:

1. State the goal.
2. Identify prerequisites.
3. Walk through the required steps.
4. Show important examples.
5. Explain the expected result.
6. Provide useful next steps or related documentation.

Avoid turning a tutorial into an internal development diary.

---

# 12. FAQ Writing

Documents under:

```text
docs/faq/
```

should contain concise answers to common public questions.

Prefer:

```text
## Can I ...?

Yes. ...

## How do I ...?

...
```

Answers should be based on supported project behavior.

Do not use the FAQ to record unresolved internal questions.

---

# 13. Troubleshooting Writing

Documents under:

```text
docs/troubleshooting/
```

should help users diagnose and resolve public-facing problems.

Where appropriate, include:

- Problem
- Symptoms
- Likely cause
- Steps to diagnose
- Resolution
- Verification
- When to seek further help

Do not expose:

- Private logs
- Credentials
- Confidential infrastructure information
- Internal incident discussions
- Private debugging notes

Internal investigations belong in `project/`.

---

# 14. Release Notes

Documents under:

```text
docs/release-notes/
```

must remain public-friendly.

Include relevant user-visible changes such as:

- New features
- Improvements
- Bug fixes
- Compatibility changes
- Migration requirements
- Important user-facing behavior changes

Describe the public result.

Do not include:

- Internal development discussions
- Team decisions
- Private implementation debates
- Internal workarounds
- Confidential information
- Private TODOs
- Unreleased internal plans

A release note is not an internal development log.

---

# 15. Code Examples

Use code examples when they make the documentation easier to understand or follow.

Examples should:

- Be relevant to the documented behavior
- Be syntactically clear
- Avoid unnecessary complexity
- Use safe placeholder values
- Avoid real credentials or secrets
- Match the supported project behavior

Do not include sensitive values in examples.

---

# 16. Links and Cross-References

Use links to connect related public documentation.

Prefer linking to:

- Getting Started
- Relevant guides
- Feature documentation
- Configuration
- API reference
- Troubleshooting
- FAQ
- Release notes

Avoid links that expose private project documents.

---

# 17. Documentation for Updates

When a public-facing feature or behavior changes, review the affected documentation.

Depending on the change, this may require updating:

- Feature documentation
- Guides
- Configuration documentation
- API documentation
- Tutorials
- FAQ
- Troubleshooting
- Release notes
- `index.md`

Do not update every document automatically.

Update only the documents affected by the actual public behavior change.

---

# 18. Public vs Internal Change

A code change does not automatically mean that internal implementation details should be added to documentation.

Use this distinction:

```text
Internal implementation change
    ↓
project/

User-visible behavior change
    ↓
docs/
```

If users need to understand the result, document the result.

If only developers need the information, keep it private.

---

# 19. Documentation and Planned Features

Do not present planned work as completed functionality.

Use the appropriate private development records in:

```text
project/
```

for:

- Planned features
- Roadmap items
- Future architecture
- Development plans
- Pending implementation

Public documentation should describe supported functionality unless a public roadmap is intentionally part of the project's documentation strategy.

---

# 20. Documentation Review Before Completion

Before considering a documentation update complete, verify:

- The document is in the correct section.
- The content is public-safe.
- The information matches actual project behavior.
- Instructions are complete enough for the intended reader.
- Examples do not contain secrets.
- Links are valid and relevant.
- No private development information was exposed.
- Related public documentation was updated when required.
- A new documentation section was not created unnecessarily.
- `docs.manifest.ygit` was reviewed if structure/discovery/version metadata changed.

---

# 21. AI Agent Documentation Rules

When an AI agent creates or edits documentation:

1. Determine the document's public purpose.
2. Select the correct section using `documentation-structure.md`.
3. Follow this writing guide.
4. Use only verified project behavior as factual documentation.
5. Keep private/internal information inside `project/`.
6. Do not invent unsupported features, options, commands, or behavior.
7. Do not expose credentials or confidential information.
8. Do not create duplicate pages without first checking existing documentation.
9. Review related documentation when public behavior changes.
10. Review `docs.manifest.ygit` when its metadata, discovery, structure, or version information may be affected.

---

# 22. Final Writing Rule

Before publishing any documentation, ask:

> Can a public reader safely and accurately use this document without access to private development context?

If yes, the document is suitable for `docs/`.

If no, keep the information in `project/` or revise the document so that only the necessary public information remains.

Public documentation explains the supported product.

Private documentation explains the internal development process.
