# Public Documentation Manifest Guide

## Purpose

This document defines how AI agents and developers should create, maintain, and validate:

```text
docs.manifest.ygit
```

The manifest describes the documentation package so a compatible documentation platform can automatically discover, identify, organize, and publish the documentation from the project repository.

The manifest describes the public documentation package under `docs/`. It does **not** describe the internal `project/` workspace, internal development records, or private project-management structure.

Only public documentation paths and sections may participate in DPMS discovery. Internal documents belong under `project/` and must never be added to the public documentation manifest as a privacy workaround.

It does not describe the documentation website, website theme, UI, search engine, analytics, SEO, comments, styling, branding, or portal configuration.

---

# 1. Source of Truth

The `docs.manifest.ygit` file must follow the project's adopted DPMS v1 schema.

The authoritative schema defines:

- Required properties
- Allowed property types
- Allowed values
- Path rules
- Identifier rules
- Semantic-version rules
- Section structure
- Version structure
- Extension behavior

Do not invent fields outside the adopted schema.

The manifest schema uses:

```text
additionalProperties: false
```

at the core manifest and defined object levels.

Therefore unsupported properties must not be added.

---

# 2. Required Top-Level Properties

A valid manifest must contain:

```text
$schema
schemaVersion
manifestVersion
documentation
discovery
structure
```

The following top-level properties are optional:

```text
versions
custom
```

The adopted DPMS schema defines these requirements.

---

# 3. `$schema`

### Purpose

Identifies the schema used to validate the manifest.

It must be a valid URI.

The project's adopted schema identifies the DPMS v1 documentation manifest schema.

Do not replace the schema reference with an unrelated schema.

---

# 4. `schemaVersion`

### Purpose

Identifies the DPMS schema version.

For the currently adopted schema:

```text
schemaVersion: 1
```

This is defined as a constant by the schema.

Do not change this value unless the project formally adopts a different DPMS schema version.

---

# 5. `manifestVersion`

### Purpose

Identifies the version of the individual documentation manifest.

It must follow the schema's semantic-version format:

```text
MAJOR.MINOR.PATCH
```

Optional prerelease and build metadata are supported by the schema's semver pattern.

Examples:

```text
1.0.0
1.1.0
2.0.0
1.0.0-beta
```

Do not use arbitrary version strings.

---

# 6. `documentation`

This object describes the documentation package itself.

Required properties:

```text
id
title
docsRoot
defaultDocument
```

Optional properties:

```text
description
defaultLanguage
status
tags
```

---

## 6.1 `documentation.id`

The documentation package identifier.

It must follow the schema identifier pattern:

```text
^[a-z0-9][a-z0-9._-]*$
```

Therefore identifiers should:

- Start with a lowercase letter or number
- Use lowercase letters, numbers, `.`, `_`, or `-`
- Not contain spaces
- Not contain uppercase characters

Example:

```text
vibproject-template
```

---

## 6.2 `documentation.title`

Human-readable documentation package title.

It must be a non-empty string.

Example:

```text
Vib Project Template Documentation
```

---

## 6.3 `documentation.description`

Optional human-readable description of the documentation package.

Use it to explain what the documentation contains.

Do not place private/internal development information here.

---

## 6.4 `documentation.docsRoot`

Defines the documentation root relative to the repository.

For the standard project template:

```text
docs/
```

The schema requires a non-empty relative path that does not begin with `/`.

The manifest's `docsRoot` must correspond to the actual documentation directory.

---

## 6.5 `documentation.defaultLanguage`

Defines the default documentation language.

The schema accepts:

```text
xx
xx-YY
```

where the language portion is two lowercase letters and the optional region portion is two uppercase letters.

Example:

```text
en
en-US
```

The default specified by the schema is:

```text
en
```

---

## 6.6 `documentation.status`

Allowed values are:

```text
draft
published
deprecated
archived
```

Use the value that accurately represents the documentation package's current status.

Do not mark documentation as `published` merely because the manifest exists.

The status should reflect the actual documentation state.

---

## 6.7 `documentation.tags`

Optional documentation package tags.

Tags are strings and must be unique.

Use tags to describe the documentation package in a useful, consistent way.

Do not place private information in tags.

---

## 6.8 `documentation.defaultDocument`

Defines the default document loaded when users open the documentation package.

Example:

```text
index.md
```

The path must be relative and must correspond to an actual documentation document under `docsRoot`.

Do not point the manifest to a missing or private document.

---

# 7. `discovery`

The `discovery` object defines how a compatible documentation platform discovers documentation files.

All properties are optional according to the schema.

Supported properties:

```text
enabled
recursive
include
exclude
extensions
ignoreHidden
followSymlink
```

---

## 7.1 `discovery.enabled`

Controls whether documentation discovery is enabled.

Default:

```text
true
```

For a normal documentation package intended for automatic discovery, discovery should remain enabled.

---

## 7.2 `discovery.recursive`

Controls recursive discovery.

Default:

```text
true
```

When enabled, supported documentation files can be discovered in nested documentation directories.

---

## 7.3 `discovery.include`

Defines file patterns that should be included during discovery.

The schema accepts a unique array of strings.

For Markdown/MDX documentation, the template may use patterns such as:

```text
**/*.md
**/*.mdx
```

Include rules must match the actual documentation structure and supported file types.

---

## 7.4 `discovery.exclude`

Defines patterns that should be excluded from discovery.

Use exclusions when a path inside the documentation root should not become a documentation page.

For example, documentation media can be excluded when it contains assets rather than documentation pages.

Do not use exclusions to hide private development information inside `docs/`.

Private information belongs in `project/`.

---

## 7.5 `discovery.extensions`

Defines supported documentation file extensions.

The adopted schema allows:

```text
md
mdx
```

Example:

```text
["md", "mdx"]
```

Do not add unsupported extensions to this field.

---

## 7.6 `discovery.ignoreHidden`

Controls whether hidden files are ignored.

The schema default is:

```text
true
```

Follow the project's intended discovery behavior.

---

## 7.7 `discovery.followSymlink`

Controls whether discovery follows symbolic links.

The schema default is:

```text
false
```

Do not enable symbolic-link traversal without a deliberate requirement.

---

# 8. `structure`

The `structure` object defines how the documentation package is logically organized.

Required property:

```text
sections
```

Optional properties:

```text
autoGenerate
sort
maxDepth
```

---

## 8.1 `structure.autoGenerate`

Controls whether the documentation structure can be generated automatically.

Schema default:

```text
true
```

Use the setting that matches the project's documentation platform workflow.

---

## 8.2 `structure.sort`

Allowed values:

```text
manual
alphabetical
filesystem
```

For the current template, the documentation structure is intentionally ordered by explicit section order.

Therefore:

```text
manual
```

is appropriate when the manifest controls section order using `order`.

---

## 8.3 `structure.maxDepth`

Defines the maximum documentation structure depth.

It must be an integer of at least `1`.

The schema default is:

```text
10
```

Do not lower or increase this value without a documentation-structure reason.

---

# 9. `structure.sections`

The `sections` array defines the documentation sections.

At least one section is required.

Each section requires:

```text
id
title
path
```

Optional properties:

```text
description
icon
order
hidden
collapsed
```

---

## 9.1 Section `id`

Must follow the same identifier pattern:

```text
^[a-z0-9][a-z0-9._-]*$
```

Use a stable, descriptive identifier.

Do not change an existing section ID unnecessarily.

---

## 9.2 Section `title`

Human-readable section title.

Example:

```text
Getting Started
```

---

## 9.3 Section `description`

Optional public description of the section.

It should explain what readers will find there.

Do not include private/internal information.

---

## 9.4 Section `icon`

Optional icon identifier/string.

Its meaning depends on the documentation platform.

Do not assume a particular rendering behavior unless the platform defines it.

---

## 9.5 Section `path`

Defines the relative path from `docsRoot`.

Example:

```text
getting-started/
```

The path must correspond to the intended actual directory.

The manifest path and filesystem path must remain synchronized.

---

## 9.6 Section `order`

Defines the section order when:

```text
structure.sort = manual
```

The schema requires a non-negative integer when provided.

For the current template, explicit sequential ordering should be maintained.

---

## 9.7 Section `hidden`

Controls whether the section is hidden.

Default:

```text
false
```

Use `true` only when the documentation platform is intended to hide that section.

Do not use `hidden` as a substitute for private documentation.

---

## 9.8 Section `collapsed`

Controls whether the section is collapsed by the documentation platform.

Default:

```text
false
```

This is a presentation/structure hint, not a privacy mechanism.

---

# 10. `versions`

The `versions` object is optional.

It supports documentation version information.

Supported properties:

```text
enabled
current
latest
available
strategy
```

---

## 10.1 `versions.enabled`

Controls whether documentation versioning is enabled.

Default:

```text
false
```

If documentation versioning is not actually implemented, keep it disabled.

---

## 10.2 `versions.current`

The current documentation version.

Must follow the schema's semantic-version format.

---

## 10.3 `versions.latest`

The latest documentation version.

Must follow the schema's semantic-version format.

---

## 10.4 `versions.available`

List of available documentation versions.

At least one version is required when this property is provided.

Versions must be unique and follow the schema's semantic-version format.

---

## 10.5 `versions.strategy`

Allowed values:

```text
directory
branch
tag
```

The strategy describes how documentation versions are represented.

Do not declare a strategy that the actual documentation platform/project workflow does not use.

---

# 11. `custom`

`custom` is reserved for vendor-specific extensions.

The schema defines it as an object that may contain additional properties.

Use this area only for platform-specific extensions that are intentionally supported.

Do not put standard DPMS properties into `custom` merely because they are unfamiliar.

Do not use `custom` to bypass schema rules.

---

# 12. Manifest vs Documentation Content

Keep these responsibilities separate.

```text
docs.manifest.ygit
    ↓
Documentation metadata
Discovery rules
Logical structure
Version information


docs/*.md / docs/*.mdx
    ↓
Actual public documentation content
```

Do not put documentation text into the manifest.

Do not use Markdown documents to redefine manifest fields.

---

# 13. Manifest vs Filesystem

The manifest and the actual documentation filesystem must agree.

Verify at minimum:

```text
documentation.docsRoot
        ↓
actual docs directory

documentation.defaultDocument
        ↓
actual default document

structure.sections[].path
        ↓
actual section directory

discovery.include / extensions
        ↓
actual documentation file types

discovery.exclude
        ↓
actual paths that should not become documentation pages
```

A manifest entry must not point to a missing path.

A declared section must not remain stale after its directory is renamed or removed.

---

# 14. When the Manifest Must Be Updated

Review and update `docs.manifest.ygit` when:

- Documentation root changes
- Default document changes
- Documentation package identity changes
- Discovery behavior changes
- Supported documentation extensions change
- Documentation sections are added
- Documentation sections are removed
- Documentation sections are renamed
- Section paths change
- Section ordering changes
- Documentation versioning is enabled/changed
- Manifest version changes are required

---

# 15. When the Manifest Does Not Need to Change

A normal documentation content edit does not automatically require a manifest change.

For example:

```text
docs/features/example.md
```

is edited while its location and discovery rules remain unchanged.

In that case:

```text
docs.manifest.ygit
```

does not need to be modified merely because the Markdown content changed.

The manifest describes the package metadata, discovery, structure, and version information—not the content of every page.

---

# 16. Validation Before Completion

Before considering a manifest update complete:

1. Validate the JSON syntax.
2. Validate the manifest against the adopted DPMS schema.
3. Confirm all required top-level properties exist.
4. Confirm identifiers follow the schema.
5. Confirm semantic versions are valid where used.
6. Confirm paths are relative and valid.
7. Confirm `defaultDocument` exists.
8. Confirm section paths match the filesystem.
9. Confirm discovery rules match actual documentation file types.
10. Confirm unsupported properties were not added.
11. Confirm versioning settings match the actual documentation workflow.
12. Confirm the manifest does not expose private information.

A syntactically valid JSON file is not sufficient; it must also conform to the adopted schema and actual documentation structure.

---

# 17. AI Agent Rules for Manifest Changes

When an AI agent works on `docs.manifest.ygit`:

1. Read the adopted DPMS schema before changing the manifest.
2. Follow the schema's required properties and allowed values.
3. Do not invent unsupported fields.
4. Inspect the actual `docs/` filesystem before changing structure-related fields.
5. Keep manifest paths synchronized with real paths.
6. Do not change the manifest merely because a Markdown page was edited.
7. Review discovery rules when documentation file types or excluded paths change.
8. Review `structure.sections` when documentation sections change.
9. Review version settings when documentation versioning changes.
10. Validate the final manifest against the schema.
11. Do not use manifest fields as a privacy mechanism.
12. Keep private/internal information in `project/`.

---

# 18. Safe Manifest Update Sequence

When a structural documentation change is approved, use this sequence:

```text
Approved documentation change
        ↓
Inspect current docs/ structure
        ↓
Determine required manifest change
        ↓
Update actual docs/ structure
        ↓
Update docs.manifest.ygit
        ↓
Validate manifest against schema
        ↓
Verify manifest paths against filesystem
        ↓
Verify discovery behavior
        ↓
Record the completed documentation change
```

Do not change the manifest blindly.

---

# 19. DPMS Responsibility Boundary

DPMS describes the documentation package.

It does not define:

- Website themes
- Website UI
- Navigation rendering
- Search engine configuration
- Analytics
- SEO
- Comments
- Styling
- Branding
- Portal configuration

Those responsibilities belong to the documentation platform.

Therefore, do not add website/platform configuration to standard DPMS fields.

Use `custom` only for intentionally supported vendor-specific extensions.

---

# 20. Final Rule

Before saving `docs.manifest.ygit`, verify:

```text
Schema valid
    +
Required fields present
    +
Allowed fields only
    +
Paths exist
    +
Default document exists
    +
Sections match filesystem
    +
Discovery matches documentation files
    +
Version settings are truthful
    +
No private information
    =
Valid documentation manifest
```

The manifest is the machine-readable contract between the project's `docs/` package and a compatible documentation platform.

Keep that contract accurate, minimal, and synchronized with the real documentation structure.
