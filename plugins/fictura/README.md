# Fictura plugin

Fictura is a growth platform for Expo and React Native apps: paywalls and onboarding flows, subscription analytics, A/B experiments, attribution, deep links, store analytics and error tracking. This plugin connects your agent to Fictura's hosted MCP server, so it can read your app's real setup and numbers before it writes code, and build paywall and onboarding drafts for you to review.

## What it contains

- **One remote MCP server**, `fictura`, at `https://mcp.fictura.co/mcp` (Streamable HTTP). The plugin runs no local code and installs no packages.
- **One skill**, `fictura-integration`, that tells the agent to read the app's real credentials, placements and event names (`get_app_setup`, `list_surfaces`, `get_tracking_plan`) before it writes integration code.

## Sign in

After you install the plugin, open `/mcp`, pick `fictura` and sign in with your Fictura account. On the consent screen you choose one app and an access level (read only, or read and edit). Until you sign in, only the three documentation tools work: `search_docs`, `list_docs` and `read_doc`.

## What it sends and where

Tool calls go to `mcp.fictura.co`, which Fictura operates. The server decides which app you see from your sign-in alone; no tool takes an app id. It reads by default. With read and edit it can also save paywall and onboarding drafts, the app's identity details and tracking links. Experiments, issue changes, tickets, AI fixes and pull requests stay off until you turn them on in the app's Issue settings. See the [privacy policy](https://fictura.co/privacy) and [terms](https://fictura.co/terms).

## Help

Docs: <https://docs.fictura.co/connections/outgoing/mcp-server>. Support: <https://fictura.co/contact> or info@fictura.co.
