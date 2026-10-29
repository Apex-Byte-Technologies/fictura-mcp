---
name: fictura-integration
description: Wire the Fictura SDK, paywalls, onboarding flows or deep links into an Expo / React Native app using the Fictura MCP tools. Use when writing or changing code that integrates Fictura, adds a paywall or onboarding placement, tracks events, or sets up Universal Links / App Links.
---

# Integrate Fictura with real values

The Fictura MCP server knows this app's real configuration. Read it before you write code, so nothing you generate holds a placeholder or a guess.

1. **Call `get_app_setup` first.** It returns the real API base URL and the app's publishable SDK key (`gk_…`). Never leave a placeholder key in generated code. The SDK key is publishable and safe to commit.
2. **Read the docs, don't recall them.** Call `read_doc` on `/implementation/welcome/sdk-quickstart`, then on `/implementation/sdk-reference/expo-react-native`. Use `search_docs` for anything else.
3. **Use real placement names.** Call `list_surfaces` and use a name from `placements`. A placement that does not exist renders nothing and reports no error, so never invent one.
4. **Reuse event names.** Call `get_tracking_plan` before adding instrumentation and reuse an existing event name instead of adding a near-duplicate.
5. **Check features before depending on them.** `get_setup_status` shows which features and integrations are on.
6. **Deep links:** call `get_link_infrastructure` and check `app_links.ios_ready` and `android_ready` rather than assuming the association files are correct.

Rules while writing the code:

- `Growth.init()` runs at module scope, before any component renders. Not inside `useEffect` or a component body.
- Never write a price into code or a paywall document. Prices come from the store at render time (`{{ products.<slot>.price }}` in Studio documents).
- Paywall and onboarding changes go into **drafts** (`create_paywall_draft`, `save_paywall_doc`, `create_onboarding_draft`, `save_onboarding_doc`). They never go live from here; a person publishes them in the Fictura dashboard. Edit the document you read with `get_paywall_doc` / `get_onboarding_doc`, keep node ids, and run the matching `validate_*` tool before saving.

If a data tool answers that you are not signed in, tell the user to sign in to Fictura from their MCP client (for example `/mcp` in Claude Code) or to add an MCP key from Dashboard → Setup → Coding agents (MCP). The documentation tools work without either.
