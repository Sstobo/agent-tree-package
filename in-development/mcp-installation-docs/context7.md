# Context7 MCP

Context7 MCP provides access to library documentation through two main tools.

## To install:

```claude mcp add --transport http context7 https://mcp.context7.com/mcp```

## Available Tools

### `resolve-library-id`
Resolves a general library name into a Context7-compatible library ID.

**Parameters:**
- `libraryName` (required): The name of the library to search for

### `get-library-docs`
Fetches documentation for a library using a Context7-compatible library ID.

**Parameters:**
- `context7CompatibleLibraryID` (required): Exact Context7-compatible library ID (e.g., `/mongodb/docs`, `/vercel/next.js`)
- `topic` (optional): Focus the docs on a specific topic (e.g., "routing", "hooks")
- `tokens` (optional, default 10000): Max number of tokens to return

## Usage
1. Use `resolve-library-id` to find the correct library ID
2. Use `get-library-docs` with the resolved ID to fetch documentation
