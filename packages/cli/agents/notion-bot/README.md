# Notion-Bot Agent

## Overview
Notion-Bot is your Agent Tree project documentation specialist that captures, organizes, and retrieves all project information using Notion's powerful MCP tools. It maintains comprehensive documentation archives and helps track project progress in real-time.

## � CRITICAL: MCP Server Setup Required
**This agent requires the Notion MCP server to be installed and configured before use.**

### Quick Setup Steps:

1. **Install via Smithery**: Visit https://smithery.ai/server/@smithery/notion
2. **Create Notion Integration**: https://www.notion.so/profile/integrations
3. In Smithery, on the Notion page, choose Claude Code from the menu on the right. Enter your Notion api key, and hit Connect. Copy the code produced ie: "claude mcp add --transport http notion "https://server.smithery.ai/@smithery/notion/mcp?api_key="xxx"&profile="xxx"" and run it in the terminal


See detailed setup instructions below.

## Features
- **Project Documentation**: Capture all Agent Tree activities and progress
- **Database Management**: Create and query Notion databases for project tracking
- **Page Operations**: Create, update, and retrieve pages with full content
- **Search Capabilities**: Find any content across your Notion workspace
- **Comment System**: Add and retrieve comments for collaboration
- **Real-time Sync**: Keep project documentation always up-to-date

## Installation
```bash
npx agent-tree add notion-bot
```

## Detailed MCP Setup Instructions

### Step 1: Install Notion MCP Server
1. Go to https://smithery.ai/server/@smithery/notion
2. Follow the installation wizard
3. The server will be added to your Claude Code configuration

### Step 2: Create Notion Integration
1. Visit https://www.notion.so/profile/integrations
2. Click "Create new integration"
3. Name it "Agent Tree MCP Integration"
4. Select your workspace
5. Click "Submit"

### Step 3: Configure Integration (Security First!)
**For Read-Only Access (Recommended for testing):**
1. Go to "Capabilities" tab
2. Under "Content Capabilities", check only "Read content"
3. Uncheck all write permissions initially
4. Save changes

**For Full Access (When ready):**
- Enable additional capabilities as needed
- Always use minimal permissions required

### Step 4: Connect Your Pages
**Method 1 - Bulk Access:**
1. In integration settings, go to "Access" tab
2. Click "Edit access"
3. Select Agent Tree project pages/databases
4. Save

## Available MCP Commands

Once properly configured, notion-bot has access to these Notion MCP commands:

### Database Operations
- **list-databases**: List all databases the integration has access to
- **query-database**: Query a database with optional filtering, sorting, and pagination
- **create-database**: Create a new database in a parent page
- **update-database**: Update an existing database's title, description, or properties

### Page Operations
- **get_page**: Get a Notion page by ID (returns metadata and properties, NOT content blocks)
- **create-page**: Create a new Notion page in a specific parent page or database
- **update_page**: Update an existing page's properties

### Block Operations
- **get-block**: Retrieve a specific block by its ID (everything in Notion is a block)
- **get-block-children**: Retrieve all child blocks within a page or block
- **append-block-children**: Append new children blocks to a parent block
- **update-block**: Update an existing block

### Search & Discovery
- **search**: Search for pages and databases in Notion by title or content

### Comment System
- **get-comments**: Retrieve comments on a specific Notion block or page
- **get-all-page-comments**: Retrieve ALL comments from a Notion page (comprehensive search)
- **create-comment**: Create a new comment on a Notion page or specific block

### Usage Notes
- To get page content after finding it, use `get-block-children` with the page ID
- To get comments on a page, use `get-comments` or `get-all-page-comments` with the page ID
- Comments can be attached to entire pages (use page ID) or specific blocks (use block ID)
- Use `discussionId` to reply to existing comment threads
