# Neovim Config Notes

## Local MDX Language Server Patch

The Mason-installed `mdx-analyzer` package currently pulls in `vscode-markdown-languageservice@0.5.0`, which imports `vscode-uri` as a default export. `vscode-uri` does not provide a default export, causing `mdx-language-server` to crash under Node 24.

Patched local file:

```txt
~/.local/share/nvim/mason/packages/mdx-analyzer/node_modules/@mdx-js/language-server/node_modules/vscode-markdown-languageservice/out/util/vscodeUri.js
```

Changed:

```js
import uri from 'vscode-uri';
```

To:

```js
import * as uri from 'vscode-uri';
```

This is a temporary local workaround and may be overwritten by Mason reinstalling or updating `mdx-analyzer`.
