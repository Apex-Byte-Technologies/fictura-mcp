<p align="center">
  <img src="assets/fictura-icon-128.png" width="96" height="96" alt="Fictura">
</p>

<h1 align="center">Fictura MCP server</h1>

<p align="center">
  Give your AI agent your mobile app's real paywalls, funnels, experiments, attribution and crashes, and let it build paywall and onboarding drafts you review before anything goes live.
</p>

<!-- Glama badge: add after the server is listed on glama.ai, for example
[![Fictura MCP server](https://glama.ai/mcp/servers/<id>/badge)](https://glama.ai/mcp/servers/<id>) -->

[Fictura](https://fictura.co) is the growth platform for Expo and React Native apps: paywalls and onboarding flows built in the Studio editor, subscription analytics and funnels, A/B experiments, attribution and ad spend, deep links, App Store and Google Play analytics, and error tracking with stack traces. This server puts all of it in reach of Claude, ChatGPT, Codex, Cursor, VS Code, Windsurf, Gemini CLI and any other MCP client.

```text
https://mcp.fictura.co/mcp
```

Streamable HTTP, stateless, JSON responses. `https://api.fictura.co/mcp` serves the same server.

## What your agent can do

| Ask | What happens |
| --- | --- |
| "Add Fictura to this Expo app and show the onboarding flow at the right placement." | Reads the app's real SDK key and API base (`get_app_setup`), the docs (`read_doc`) and the placements that exist (`list_surfaces`), then writes the integration with no placeholders. |
| "Why did trial-to-paid drop last week? Show me where people leave the funnel." | Pulls the funnel with drop-off per step and compares cohorts (`get_analytics`). |
| "Fix the top crash in the latest release." | Finds the issue, reads its source-mapped stack, breadcrumbs and a fix prompt (`list_error_issues`, `get_error_issue_brief`), then edits your code. |
| "Draft an annual-plan paywall from a template so I can review it in Studio." | Picks a real template (`list_templates`) and creates a **draft** (`create_paywall_draft`). You publish it in the dashboard, or don't. |

More: "Which campaigns paid back this month?" (`get_acquisition_report`), "Which experiment is winning, and how sure are we?" (`list_experiments`), "Are Universal Links set up right?" (`get_link_infrastructure`).

## Connect

### One-click

[![Add to Cursor](https://cursor.com/deeplink/mcp-install-dark.svg)](https://cursor.com/install-mcp?name=fictura&config=eyJ1cmwiOiJodHRwczovL21jcC5maWN0dXJhLmNvL21jcCJ9)
[![Install in VS Code](https://img.shields.io/badge/VS_Code-Install_Fictura-0098FF?logo=visualstudiocode&logoColor=white)](https://vscode.dev/redirect/mcp/install?name=fictura&config=%7B%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fmcp.fictura.co%2Fmcp%22%7D)

Both buttons add the URL only; sign in with your Fictura account when the editor asks. If the buttons do nothing on your system, open these links directly:

```text
cursor://anysphere.cursor-deeplink/mcp/install?name=fictura&config=eyJ1cmwiOiJodHRwczovL21jcC5maWN0dXJhLmNvL21jcCJ9
vscode:mcp/install?%7B%22name%22%3A%22fictura%22%2C%22type%22%3A%22http%22%2C%22url%22%3A%22https%3A%2F%2Fmcp.fictura.co%2Fmcp%22%7D
```

### Claude (claude.ai, Claude Desktop, Cowork)

1. Open **Customize → Connectors**, select **+ Add**, then **Add custom connector**.
2. Name it `Fictura`, paste `https://mcp.fictura.co/mcp` and select **Continue**.
3. Keep the detected sign-in settings, select **Add**, then connect and sign in with Fictura. To use an MCP key instead, choose **No sign in** and add the key under **Request headers** as `X-API-Key`.

On Team and Enterprise plans an Owner adds the connector first under **Organization settings → Connectors**, then each member connects.

### ChatGPT

1. Go to [chatgpt.com/plugins](https://chatgpt.com/plugins), select **+**, then **Add custom MCP server**.
2. Enter `https://mcp.fictura.co/mcp` and choose OAuth for authentication.
3. Select **Create as a plugin**, then sign in with Fictura.

Your account or workspace policy must allow custom MCP servers.

### Claude Code

Install the plugin from this repository. It adds the server and a skill that makes Claude read your app's real setup before it writes integration code:

```bash
claude plugin marketplace add Apex-Byte-Technologies/fictura-mcp
claude plugin install fictura@fictura
```

Or add only the server:

```bash
claude mcp add --transport http fictura https://mcp.fictura.co/mcp
```

Then run `/mcp`, pick `fictura` and sign in. To use an MCP key instead:

```bash
claude mcp add --transport http fictura https://mcp.fictura.co/mcp \
  --header "X-API-Key: $FICTURA_MCP_KEY"
```

### Codex (CLI, IDE extension, ChatGPT desktop app)

```bash
codex mcp add fictura --url https://mcp.fictura.co/mcp
codex mcp login fictura
```

With an MCP key instead of sign-in, keep the key in an environment variable:

```bash
export FICTURA_MCP_KEY=fk_mcp_...
codex mcp add fictura --url https://mcp.fictura.co/mcp --bearer-token-env-var FICTURA_MCP_KEY
```

The same thing in `~/.codex/config.toml`:

```toml
[mcp_servers.fictura]
url = "https://mcp.fictura.co/mcp"
bearer_token_env_var = "FICTURA_MCP_KEY"
```

### Cursor

Use the button above, or add this to `.cursor/mcp.json` (project) or `~/.cursor/mcp.json` (global):

```json
{
  "mcpServers": {
    "fictura": {
      "url": "https://mcp.fictura.co/mcp"
    }
  }
}
```

With an MCP key, add `"headers": { "X-API-Key": "${env:FICTURA_MCP_KEY}" }` to the `fictura` entry.

### VS Code

Use the button above to sign in with Fictura. To use an MCP key instead, add this to `.vscode/mcp.json`; VS Code asks for the key once and stores it securely.

```json
{
  "inputs": [
    {
      "type": "promptString",
      "id": "fictura-mcp-key",
      "description": "Fictura MCP key (fk_mcp_...)",
      "password": true
    }
  ],
  "servers": {
    "fictura": {
      "type": "http",
      "url": "https://mcp.fictura.co/mcp",
      "headers": { "X-API-Key": "${input:fictura-mcp-key}" }
    }
  }
}
```

### Windsurf

Open the Cascade panel's `...` menu, then **Open MCP config file**, and add:

```json
{
  "mcpServers": {
    "fictura": {
      "serverUrl": "https://mcp.fictura.co/mcp",
      "headers": { "X-API-Key": "${env:FICTURA_MCP_KEY}" }
    }
  }
}
```

### Gemini CLI

```bash
gemini extensions install https://github.com/Apex-Byte-Technologies/fictura-mcp
```

The installer asks for an optional MCP key and keeps it in your system keychain. Change it later with `gemini extensions config fictura`.

### Claude Desktop with a local bridge (npx)

For clients that only run local (stdio) servers, the [`@fictura/mcp`](https://www.npmjs.com/package/@fictura/mcp) package bridges to the hosted server. In Claude Desktop, open **Settings → Developer → Edit Config** and add:

```json
{
  "mcpServers": {
    "fictura": {
      "command": "npx",
      "args": ["-y", "@fictura/mcp"],
      "env": { "FICTURA_MCP_KEY": "fk_mcp_..." }
    }
  }
}
```

The bridge reads `FICTURA_MCP_KEY` and, optionally, `FICTURA_API_BASE` (default `https://api.fictura.co`). Claude Desktop also supports the custom connector above, which needs no local install.

## Authentication

| Option | How | Best for |
| --- | --- | --- |
| **Sign in with Fictura** (OAuth 2.1) | Add the URL only. Your client opens Fictura's sign-in; on the consent screen you pick **one app** and an **access level** (read, or read and edit drafts). | Claude, ChatGPT, Claude Code, Codex, Cursor, VS Code |
| **MCP key** | Create one in the Fictura dashboard under **Setup → Coding agents (MCP)**. Send it as `Authorization: Bearer fk_mcp_...` or `X-API-Key: fk_mcp_...`. | CI, scripts, clients without MCP sign-in |
| **None** | Connect without signing in. | Reading the Fictura docs before you have an account |

Without sign-in or a key, only the three documentation tools work: `search_docs`, `list_docs` and `read_doc`. Every other tool answers with how to connect.

A key is read-only unless you tick **Can edit draft paywalls** when you create it (those keys start with `fk_mcpw_`). The AppsFlyer import needs a key created with **Can connect and import data**. App data over MCP needs an active Fictura subscription with AI access.

## Tools

44 tools and one prompt. "Read" tools change nothing.

| Area | Tool | What it does | Access |
| --- | --- | --- | --- |
| Docs | `search_docs` | Search Fictura documentation | No sign-in |
| Docs | `list_docs` | List Fictura documentation pages | No sign-in |
| Docs | `read_doc` | Read a Fictura documentation page | No sign-in |
| Setup | `get_app_setup` | Get this app's Fictura credentials and endpoints | Read |
| Setup | `get_setup_status` | Get integration and feature status | Read |
| Setup | `list_store_products` | List App Store subscription products | Read |
| Setup | `get_link_infrastructure` | Get deep link and tracking domain configuration | Read |
| Setup | `get_push_config` | Get push notification configuration | Read |
| Analytics | `get_analytics` | Get funnel, overview or cohort analytics | Read |
| Analytics | `get_tracking_plan` | Get the event tracking plan | Read |
| Users | `list_users` | List users | Read |
| Users | `get_user` | Get one user's full history | Read |
| Users | `check_entitlement` | Check whether a user is subscribed | Read |
| Paywalls & onboarding | `list_surfaces` | List paywalls, onboarding flows and placements | Read |
| Paywalls & onboarding | `get_surface` | Get one paywall or onboarding flow's config | Read |
| Paywalls & onboarding | `list_templates` | List built-in paywall and onboarding templates | Read |
| Paywalls & onboarding | `get_paywall_doc` | Get a Studio paywall's document | Read |
| Paywalls & onboarding | `validate_paywall_doc` | Check a paywall document without saving it | Read |
| Paywalls & onboarding | `save_paywall_doc` | Save a DRAFT paywall's document | Edit drafts |
| Paywalls & onboarding | `create_paywall_draft` | Create a new DRAFT Studio paywall | Edit drafts |
| Paywalls & onboarding | `get_onboarding_doc` | Get an onboarding flow's document | Read |
| Paywalls & onboarding | `validate_onboarding_doc` | Check an onboarding document without saving it | Read |
| Paywalls & onboarding | `save_onboarding_doc` | Save a DRAFT onboarding flow's document | Edit drafts |
| Paywalls & onboarding | `create_onboarding_draft` | Create a new DRAFT onboarding flow | Edit drafts |
| Studio editor | `pair_editor` | Pair with an open Studio editor | Read |
| Studio editor | `editor_get_doc` | Read the document open in the paired editor | Read |
| Studio editor | `editor_set_doc` | Put a document on the paired editor's canvas (not saved) | Edit drafts |
| Studio editor | `unpair_editor` | End the pairing with the editor | Read |
| Experiments | `list_experiments` | List experiments | Read |
| Experiments | `get_experiment` | Get one experiment | Read |
| Acquisition | `get_attribution_report` | Get attribution, install and KPI reporting | Read |
| Acquisition | `get_acquisition_report` | Get paid acquisition performance | Read |
| Acquisition | `list_campaigns` | List live ad campaigns | Read |
| Acquisition | `list_creators` | List creators and their performance | Read |
| Store | `get_store_analytics` | Get App Store and Google Play analytics (Appfigures) | Read |
| Errors | `list_error_issues` | List error issues | Read |
| Errors | `search_error_issues` | Search error issues | Read |
| Errors | `get_error_issue` | Get one error issue with stack traces | Read |
| Errors | `get_error_issue_brief` | Get an issue brief and a fix prompt | Read |
| Errors | `update_error_issue` | Change an error issue | Write, if the app allows it |
| Errors | `get_trace` | Get one distributed trace | Read |
| AppsFlyer import | `get_appsflyer_import_status` | Get AppsFlyer import status | Read |
| AppsFlyer import | `start_appsflyer_import` | Start the AppsFlyer import | Write, import key |
| AppsFlyer import | `get_appsflyer_attribution_summary` | Summarize imported AppsFlyer attribution | Read |

Prompt: `integrate_fictura_sdk` (Integrate the Fictura SDK) walks the agent through wiring `@fictura/sdk` into an Expo / React Native app with the app's real credentials.

## Security

- **The app comes from your sign-in or key, never from the agent.** No tool takes an app id, so there is no argument an agent could pass to read another app's data. A sign-in reaches only the one app you chose on the consent screen.
- **Drafts never go live.** The paywall and onboarding tools create and edit drafts only. Saving a live paywall or flow is refused, and going live is a click in the Fictura dashboard. Every save is a new version you can roll back; the history marks it `mcp: <note>`.
- **The editor stays yours.** `editor_set_doc` changes the canvas of a Studio editor you paired with a one-time code. It does not save; you see the change, can undo it, and save it yourself.
- **Other writes are opt-in.** `update_error_issue` works only after you turn on **Let MCP keys change issues** in the app's Issues settings. `start_appsflyer_import` needs a key created with **Can connect and import data**.
- **Revocation is immediate.** A revoked or invalid key is rejected on its next request with an error, never silently downgraded.
- **Keep keys out of code.** MCP keys (`fk_mcp_...`) read revenue and user data: store them in environment variables or your client's secret storage, never in a repository. The SDK key that `get_app_setup` returns (`gk_...`) is different: it is publishable and safe to ship in your app.

Report a vulnerability as described in [SECURITY.md](SECURITY.md).

## This repository

This repository holds the public listing files for the hosted server. The server itself runs at Fictura; there is no server code here.

| Path | What it is |
| --- | --- |
| [`server.json`](server.json) | Entry for the [official MCP Registry](https://modelcontextprotocol.io/registry/about) as `co.fictura/mcp` |
| [`.claude-plugin/marketplace.json`](.claude-plugin/marketplace.json), [`plugins/fictura/`](plugins/fictura) | Claude Code plugin marketplace and plugin |
| [`.cursor-plugin/plugin.json`](.cursor-plugin/plugin.json), [`mcp.json`](mcp.json) | Cursor plugin |
| [`gemini-extension.json`](gemini-extension.json) | Gemini CLI extension |
| [`openai/`](openai) | ChatGPT and Codex plugin bundle; build the upload ZIP with `scripts/build-openai-zip.sh` |
| [`assets/`](assets) | Icons (SVG, and PNG at 48, 128, 256, 400 and 512 px) |

## Links

- Documentation: <https://docs.fictura.co/connections/outgoing/mcp-server>
- Website: <https://fictura.co>
- Privacy policy: <https://fictura.co/privacy>
- Terms: <https://fictura.co/terms>
- Support: <https://fictura.co/contact> or [info@fictura.co](mailto:info@fictura.co)

## License

[MIT](LICENSE) © Apex Byte Technologies
