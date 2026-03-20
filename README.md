# Zed Templ Extension

A comprehensive language extension for [Templ](https://github.com/a-h/templ) in [Zed](https://zed.dev), providing syntax highlighting, language server support, and integration with web development tools.

## ✨ Features

- 🎨 **Syntax Highlighting** for Templ templates
- 🔧 **Language Server Protocol (LSP)** support via the official Templ language server
- 🌈 **Tailwind CSS** autocomplete support (requires configuration)
- 📝 **HTML/CSS/JavaScript** support within templates
- 🚀 **Emmet** abbreviations (requires configuration)
- 🔍 **Go code** support with gopls integration

## 📋 Prerequisites

Before installing this extension, you must have the following installed:

### 1. Go Language Tools
```bash
# Install Go (if not already installed)
# Visit: https://go.dev/doc/install

# Install gopls (REQUIRED - templ LSP depends on this)
go install golang.org/x/tools/gopls@latest

# Install templ
go install github.com/a-h/templ/cmd/templ@latest
```

### 2. Verify Installation
```bash
# Check that everything is installed correctly
templ version  # Should print an installed templ version
gopls version  # Should print an installed gopls version
```

## 🚀 Installation

1. Open Zed
2. Press `cmd+shift+x` (macOS) or `ctrl+shift+x` (Linux) to open extensions
3. Search for "Templ"
4. Click Install

## ⚙️ Configuration

### Basic Setup
The extension works out of the box for basic Templ syntax highlighting and LSP features.

For manual verification examples, open the `examples/` folder in Zed. It includes a small Go module plus focused `.templ` files for syntax highlighting, Emmet, raw Go blocks, formatting behavior, and embedded language checks.

### Tailwind CSS Autocomplete
To enable Tailwind CSS class autocomplete in Templ files, add this to your Zed settings (`cmd+,` or `ctrl+,`):

```json
{
  "languages": {
    "Templ": {
      "language_servers": [
        "templ",
        "tailwindcss-language-server",
        "vscode-html-language-server",
        "emmet-language-server"
      ]
    }
  },
  "lsp": {
    "tailwindcss-language-server": {
      "settings": {
        "includeLanguages": {
          "templ": "html"
        },
        "experimental": {
          "classRegex": ["class=\"([^\"]*)\"", "className=\"([^\"]*)\""]
        }
      }
    }
  }
}
```

### Emmet Support
Emmet works in Templ markup when `emmet-language-server` is enabled for the `Templ` language. Use it by typing abbreviations and pressing `tab`:
- `div.container` → `<div class="container"></div>`
- `ul>li*3` → Creates a list with 3 items

If Emmet does not expand in `.templ` files:
1. Ensure the `emmet` extension is installed in Zed
2. Keep `emmet-language-server` in `languages.Templ.language_servers`
3. Restart Zed after changing language server settings

### Prettier Formatting
To use Prettier with Templ files:

1. Install the [Prettier plugin for Templ](https://github.com/therealparmesh/prettier-plugin-templ-script):
```bash
npm install --save-dev prettier prettier-plugin-templ-script
```

2. Add to your `.prettierrc`:
```json
{
  "plugins": ["prettier-plugin-templ-script"],
  "overrides": [
    {
      "files": ["*.templ"],
      "options": {
        "parser": "templ"
      }
    }
  ]
}
```

## 🐛 Troubleshooting

### "Language server templ failed to start" or "LSP not starting"
**Solution**: Install gopls (see Prerequisites above). The Templ language server requires gopls to be installed.

### "No Tailwind CSS autocomplete"
**Solution**: 
1. Ensure you have the Tailwind CSS language server installed
2. Add the configuration shown in the Tailwind CSS section above
3. Restart Zed

### "Stuck on 'Setting up workspace: Loading packages'"
**Solution**: This was a compatibility issue with older Zed versions. Update Zed to a recent stable release.

### "Spaces inserted between {{ }}" or "Raw Go code syntax issues"
**Problem**: Raw Go blocks can be sensitive to editor auto-pairing and `templ fmt`. In practice this can show up as `{{` turning into `{ {`, or formatting/highlighting getting confused around raw Go blocks.

**Workarounds**:
1. Type `{{` quickly without pause
2. Use the undo function if spaces are inserted
3. For raw Go blocks, ensure your code is syntactically valid
4. If `templ fmt` rewrites the block, disable format on save for Templ files:

```json
{
  "languages": {
    "Templ": {
      "format_on_save": "off"
    }
  }
}
```

### "Empty lines are deleted on save"
**Note**: This comes from the `templ fmt` formatter rather than the Zed extension itself. You can disable format on save:
```json
{
  "languages": {
    "Templ": {
      "format_on_save": "off"
    }
  }
}
```

## 🌟 Usage Tips

### Basic Templ Syntax
```templ
package main

import "fmt"

templ Hello(name string) {
    <div class="greeting">
        <h1>Hello, { name }!</h1>
        { fmt.Sprintf("Welcome to Templ") }
    </div>
}

// Using Go code blocks
templ Counter(count int) {
    {{ formattedCount := fmt.Sprintf("%d", count) }}
    <div>Count: { formattedCount }</div>
}
```

### Working with Components
```templ
// Define a layout
templ Layout(title string) {
    <!DOCTYPE html>
    <html>
        <head><title>{ title }</title></head>
        <body>
            { children... }
        </body>
    </html>
}

// Use the layout
templ Page() {
    @Layout("My Page") {
        <h1>Content goes here</h1>
    }
}
```

## 🤝 Contributing

Found a bug or have a feature request? Please open an issue on [GitHub](https://github.com/makifdb/zed-templ/issues).

## 📝 License

MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Acknowledgments

- [a-h/templ](https://github.com/a-h/templ) - The Templ templating language
- [vrischmann/tree-sitter-templ](https://github.com/vrischmann/tree-sitter-templ) - Tree-sitter grammar for Templ
- [Zed](https://zed.dev) - The Zed editor
