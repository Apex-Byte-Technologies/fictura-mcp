# Security policy

## Report a vulnerability

Email **info@fictura.co** with "Security" in the subject. Please don't open a public issue for a security problem.

Include what you found, how to reproduce it, and what an attacker could do with it. We'll confirm we got it and keep you updated until it is fixed.

In scope: the hosted MCP server at `https://mcp.fictura.co/mcp` (and `https://api.fictura.co/mcp`), its sign-in flow, the `@fictura/mcp` npm package, and the files in this repository.

Please test only against apps and accounts you own, and don't access, change or delete other people's data.

## Supported versions

The hosted server is always the latest version. For the npm bridge, use the latest `@fictura/mcp` release.

## If a key leaks

Revoke it right away in the Fictura dashboard under **Setup → Coding agents (MCP)**. A revoked key stops working on its next request.
