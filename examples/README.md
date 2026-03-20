# Manual Verification

Open the `examples/` folder in Zed after loading the local extension build.

This folder is a small standalone Go module so `gopls` and the templ language server can resolve imports correctly.

The module tracks the current local Go toolchain used for validation in this repository.

It also includes `examples/.zed/settings.json`, which turns `format_on_save` on for `Templ` inside this folder only so formatter-related issues can be tested even if your global Zed config disables it.

Recommended order:

- `01-basic-templ.templ`: baseline check for ordinary Templ highlighting and Go expressions.
- `02-dynamic-attribute-keys.templ`: verify highlighting stays correct after dynamic attribute key expressions.
- `03-emmet-markup.templ`: try Emmet expansions like `section.hero`, `ul>li*3`, and `div.container>div.row>div.col` with `Tab`.
- `04-raw-go-blocks.templ`: check whether `{{` stays intact while typing and after save.
- `05-formatting-blank-lines.templ`: save the file and check whether blank lines are preserved.
- `06-embedded-languages.templ`: verify embedded CSS, JavaScript, and class expressions still highlight correctly.

Current issue mapping:

- `#23`: `02-dynamic-attribute-keys.templ`
- `#22`: `03-emmet-markup.templ`
- `#16`: `04-raw-go-blocks.templ`
- `#15`: `05-formatting-blank-lines.templ`
