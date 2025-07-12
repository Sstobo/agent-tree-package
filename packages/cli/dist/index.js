#!/usr/bin/env node
import { cpSync, mkdirSync, existsSync } from 'fs';
import { join, dirname } from 'path';
import { fileURLToPath } from 'url';
import readline from 'readline';
const __dirname = dirname(fileURLToPath(import.meta.url));
// Hardcoded agent list - no registry needed
const agents = {
    'servitor': 'Project management and agent coordination',
    'convex-bot': 'Convex database specialist',
    'pm': 'Project management assistant',
    'lil-fixit': 'Quick fixes and small tasks',
    'prospector': 'Business lead generation and client prospecting'
};
// Get agent name from args
const agent = process.argv[2];
// Validate agent exists
if (!agent || !agents[agent]) {
    console.log('\x1b[90mUsage:\x1b[0m npx agent-tree <agent-name>');
    console.log('\n\x1b[90mAvailable agents:\x1b[0m');
    Object.entries(agents).forEach(([name, desc], index) => {
        const colors = ['\x1b[96m', '\x1b[95m', '\x1b[96m', '\x1b[95m']; // cyan/magenta alternating
        console.log(`  ${colors[index % 4]}•\x1b[0m ${name} \x1b[90m-\x1b[0m ${desc}`);
    });
    console.log('');
    process.exit(1);
}
// Show what will be installed
console.log(`\n\x1b[90m┌\x1b[0m agent-tree`);
console.log('\x1b[90m│\x1b[0m');
console.log(`\x1b[90m├─\x1b[0m \x1b[1m${agent}\x1b[0m`);
console.log(`\x1b[90m│\x1b[0m  ${agents[agent]}`);
console.log('\x1b[90m│\x1b[0m');
console.log('\x1b[90m├─\x1b[0m Install to:');
console.log(`\x1b[90m│\x1b[0m  \x1b[96m•\x1b[0m agent-tree/${agent}/`);
console.log(`\x1b[90m│\x1b[0m  \x1b[95m•\x1b[0m .claude/commands/${agent}.md`);
console.log('\x1b[90m│\x1b[0m');
console.log(`\n\x1b[90m┌\x1b[0m Press Enter to install`);
console.log('\x1b[90m│\x1b[0m');
// Ask for confirmation (default yes)
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});
const answer = await new Promise(resolve => {
    process.stdout.write('\x1b[90m└─\x1b[0m Continue with install? [y/n] (default: y): ');
    rl.question('', resolve);
});
rl.close();
if (answer.trim() && answer.trim().toLowerCase() !== 'y') {
    console.log('\n   \x1b[90m✗\x1b[0m Cancelled');
    process.exit(0);
}
// Create directories if needed
mkdirSync(join(process.cwd(), 'agent-tree'), { recursive: true });
mkdirSync(join(process.cwd(), '.claude', 'commands'), { recursive: true });
// Copy files - simple and direct
try {
    console.log('\n   \x1b[90mCopying files...\x1b[0m');
    // Check if agent has a directory structure
    const agentDir = join(__dirname, '..', 'agent-tree', 'agents', agent);
    const hasAgentDir = existsSync(agentDir);
    if (hasAgentDir) {
        // Copy agent directory for agents with directory structure
        cpSync(agentDir, join(process.cwd(), 'agent-tree', agent), { recursive: true });
        console.log(`   \x1b[96m•\x1b[0m agent-tree/${agent}/`);
    }
    else {
        console.log(`   \x1b[96m•\x1b[0m agent-tree/ (self-contained agent)`);
    }
    // Always ensure core agent-tree config files exist for all agents
    const coreFiles = ['agent-tree-config.md', 'active-context.md'];
    for (const file of coreFiles) {
        const targetPath = join(process.cwd(), 'agent-tree', file);
        if (!existsSync(targetPath)) {
            cpSync(join(__dirname, '..', 'agent-tree', file), targetPath);
        }
    }
    // Copy MCP installation docs if they don't exist
    const mcpDocsDir = join(process.cwd(), 'agent-tree', 'mcp-installation-docs');
    if (!existsSync(mcpDocsDir)) {
        cpSync(join(__dirname, '..', 'agent-tree', 'manuals', 'mcp-installation-docs'), mcpDocsDir, { recursive: true });
    }
    console.log(`   \x1b[96m•\x1b[0m agent-tree/ (core config files)`);
    // Copy command file from agent directory
    cpSync(join(__dirname, '..', 'agent-tree', 'agents', agent, `${agent}.md`), join(process.cwd(), '.claude', 'commands', `${agent}.md`));
    console.log(`   \x1b[95m•\x1b[0m .claude/commands/${agent}.md`);
    console.log(`\n   \x1b[32m✓\x1b[0m Installed. Use \x1b[1m\x1b[96m/${agent}\x1b[0m in Claude Code\n`);
}
catch (error) {
    console.error('\n   \x1b[91m✗\x1b[0m Error:', (error instanceof Error ? error.message : error));
    process.exit(1);
}
//# sourceMappingURL=index.js.map