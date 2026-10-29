# Contributing

This repository holds the public listing files for Fictura's hosted MCP server: the README, the MCP Registry entry, and the Claude Code, Cursor, Gemini CLI and OpenAI plugin manifests. The server code itself is not here.

- **Fix a doc or a setup snippet:** open a pull request. Say which client and version you tested with.
- **Report a bug in a tool or the server:** open an issue with the client you use, the tool name, and what you expected. Leave out keys, user data and anything else private.
- **Security problems:** don't open an issue. Follow [SECURITY.md](SECURITY.md).
- **Anything else:** <https://fictura.co/contact> or info@fictura.co.

Before you open a pull request that changes a manifest, check it still validates:

```bash
claude plugin validate .                         # Claude Code marketplace and plugin
./scripts/build-openai-zip.sh                    # OpenAI plugin ZIP builds
```

By contributing you agree that your contribution is licensed under the [MIT License](LICENSE).
