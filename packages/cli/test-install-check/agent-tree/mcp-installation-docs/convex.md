# Convex MCP Server

The Convex Model Context Protocol (MCP) server provides several tools that allow AI agents to interact with your Convex deployment.

## Setup

Add the following command to your MCP servers configuration:

```bash
npx -y convex@latest mcp start
```

## Available Tools

### Deployment Tools

- **status**: Queries available deployments and returns a deployment selector that can be used with other tools. This is typically the first tool you'll use to find your Convex deployment.

### Table Tools

- **tables**: Lists all tables in a deployment along with their:
  - Declared schemas (if present)
  - Inferred schemas (automatically tracked by Convex)
  - Table names and metadata

- **data**: Allows pagination through documents in a specified table.

- **runOneoffQuery**: Enables writing and executing sandboxed JavaScript queries against your deployment's data. These queries are read-only and cannot modify the database.

### Function Tools

- **functionSpec**: Provides metadata about all deployed functions, including:
  - Function types
  - Visibility settings
  - Interface specifications

- **run**: Executes deployed Convex functions with provided arguments.

### Environment Variable Tools

- **envList**: Lists all environment variables for a deployment
- **envGet**: Retrieves the value of a specific environment variable
- **envSet**: Sets a new environment variable or updates an existing one
- **envRemove**: Removes an environment variable from the deployment

---

[Read more about how to use the Convex MCP Server](https://docs.convex.dev/mcp)