# Notion MCP Server Installation Guide

This guide walks you through setting up the Notion MCP server using Smithery, which provides an easy way to integrate Notion with MCP (Model Context Protocol).

## Quick Setup with Smithery

The easiest way to install the Notion MCP server is through Smithery:

1. Go to https://smithery.ai/server/@smithery/notion
2. Follow the installation steps provided on the page
3. Continue with the Notion integration setup below

## Notion Integration Setup

### Step 1: Create a Notion Integration

1. Visit https://www.notion.so/profile/integrations
2. Click "Create new integration" or select an existing integration
3. Give your integration a name (e.g., "MCP Integration")
4. Select the workspace you want to integrate with
5. Click "Submit" to create the integration

### Step 2: Configure Integration Capabilities

**Security Note:** While the MCP server limits the scope of Notion API access (for example, you cannot delete databases), there is still some risk to workspace data when exposing it to LLMs. Security-conscious users should configure the integration's capabilities carefully.

**For Read-Only Access (Recommended):**
1. Go to the "Capabilities" tab in your integration settings
2. Under "Content Capabilities", check only "Read content"
3. Leave "Insert content", "Update content", and "Insert comments" unchecked
4. Save your changes

### Step 3: Connect Pages and Databases

You need to grant your integration access to the specific pages and databases you want to use with MCP.

**Method 1: Bulk Access Configuration**
1. In your integration settings, go to the "Access" tab
2. Click "Edit access"
3. Select the pages and databases you want to connect
4. Click "Save"

**Method 2: Individual Page Access**
1. Navigate to the specific page you want to connect
2. Click the three dots menu (⋯) in the top-right corner
3. Select "Connect to integration"
4. Choose your MCP integration from the list

### Step 4: Get Your Integration Token

1. In your integration settings, go to the "Internal Integration Token" section
2. Copy the token (it starts with `secret_`)
3. Store this token securely - you'll need it for the MCP server configuration

## Next Steps

After completing these steps, your Notion integration should be ready to use with the MCP server. Make sure to:

- Test the connection by accessing a connected page through your MCP client
- Verify that only the intended pages and databases are accessible
- Keep your integration token secure and don't share it publicly

