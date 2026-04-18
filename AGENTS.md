# AGENTS.md

This file gives repository-specific guidance for coding agents working in this project.

## Project Summary

This repository contains a Zed extension for the Templ language.

The extension provides:

- Templ language configuration for Zed
- Tree-sitter-based syntax features for `.templ` files
- Templ language server integration
- extra editor support for HTML, CSS, JavaScript, Emmet, and Go-shaped syntax inside Templ

The runtime extension logic is implemented in Rust. Most editor behavior for Templ files is defined through Tree-sitter query files under `languages/templ/`.

## Important Directories

- `src/templ.rs`
  Extension entry point. Handles language server setup, binary download/caching, and workspace configuration.

- `languages/templ/config.toml`
  Zed language metadata and editor behavior for Templ files.

- `languages/templ/*.scm`
  Tree-sitter queries used by Zed.

- `grammars/templ/`
  Local tree-sitter grammar source used for parser investigation and rebuilds.

- `grammars/templ.wasm`
  Built grammar artifact used by the extension.

- `examples/`
  Manual verification fixtures for highlighting, embedded languages, raw Go blocks, and mixed templ/Go constructs.

## Current Query Architecture

The query layout is intentionally consolidated.

Use the main query files in `languages/templ/`:

- `highlights.scm`
- `brackets.scm`
- `indents.scm`
- `injections.scm`
- `outline.scm`
- `overrides.scm`
- `textobjects.scm`

Go-shaped syntax inside templ files is handled directly in these main query files.

Important:

- do not assume Neovim-style `; inherits:` behavior exists in Zed
- Zed loads query files by filename prefix, so files such as `highlights_go.scm` used to work by concatenation, but the current preferred direction in this repo is to keep behavior in the main query files unless there is a strong reason not to
- avoid reintroducing Go injection for general templ expressions unless there is a clear, verified regression that requires it

## Known Design Direction

The repository currently prefers:

- parser correctness first
- a minimal query surface
- direct host-language highlighting for Go AST nodes exposed by the templ grammar
- injections only for true embedded-language regions such as JavaScript, CSS, comment content, and regex string arguments

If you change highlighting behavior, verify whether the issue is actually:

- a grammar problem
- a query problem
- a theme/capture fallback problem

Do not assume every visual issue should be solved with more injection.

## Grammar Notes

The templ grammar inherits from Go and exposes many Go nodes directly in the templ parse tree.

This means syntax such as these often appears as normal Go AST nodes inside `.templ` files:

- declarations
- call expressions
- selectors
- literals
- `if`, `for`, `switch`, `range`
- raw Go blocks

Hybrid templ nodes like these are not suitable for whole-node Go injection:

- `component_for_statement`
- `component_if_statement`
- `component_switch_statement`
- `component_declaration`

If parser behavior looks wrong, inspect `grammars/templ/grammar.js` and rebuild the grammar artifact before changing queries aggressively.

## Commands

Common commands:

- `cargo check`
- `cargo build`
- `cargo build --release`
- `cargo fmt`
- `cargo clippy`

Grammar/parsing workflow:

- `npx tree-sitter parse <file>` from `grammars/templ/`
- `npx tree-sitter test` from `grammars/templ/`
- `npx tree-sitter build --wasm` from `grammars/templ/`

## Validation Workflow

When changing syntax behavior, prefer this order:

1. inspect parse output for a focused `.templ` example
2. update query files minimally
3. run `cargo check`
4. manually verify in Zed using files from `examples/`

Good manual verification targets:

- `examples/04-raw-go-blocks.templ`
- `examples/07-for-loop-with-dynamic-attrs.templ`
- basic component and attribute examples in `examples/`

## Extension Behavior Notes

- The templ language server binary is downloaded from `a-h/templ` GitHub releases.
- Cached binaries are versioned and older cached versions are cleaned up.
- The extension also supports workspace configuration for additional language servers such as Tailwind CSS, HTML, and Emmet.
- `gopls` is an external prerequisite for the templ language server to work correctly.

## Editing Guidance

- Keep changes small and local.
- Prefer updating existing query files over introducing parallel alternatives.
- Preserve the current consolidated query approach unless a regression is proven.
- If you add new query captures, prefer standard Zed capture names and use fallback captures when theme compatibility matters.
- If you touch grammar behavior, keep parser fixtures or corpus expectations in sync.
