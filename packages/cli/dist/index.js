#!/usr/bin/env node
import { cpSync, mkdirSync, existsSync, chmodSync } from 'fs';
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
    'prospector': 'Business lead generation and client prospecting',
    'auto-jury': 'Multi-perspective deliberative analysis system'
};
// Manual dependency mappings for each agent
const agentDependencies = {
    'servitor': {
        tasks: ['status.md', 'list-work.md'],
        workflows: ['scan.md', 'swarm.md', 'test-driven.md', 'worktree.md'],
        scripts: ['agent-assignment.py']
    },
    'convex-bot': {
        tasks: [],
        workflows: ['worktree.md', 'test-driven.md'],
        scripts: ['agent-assignment.py']
    },
    'pm': {
        tasks: ['status.md', 'create-prd.md', 'qa-list.md', 'create-prp.md', 'execute-prp.md'],
        workflows: [],
        scripts: []
    },
    'lil-fixit': {
        tasks: ['status.md'],
        workflows: ['worktree.md', 'grab-ticket.md', 'scan.md', 'get-busy.md'],
        scripts: ['agent-assignment.py']
    },
    'prospector': {
        tasks: ['find-leads.md', 'extract-contact.md', 'qualify-lead.md', 'linkedin-profile.md', 'linkedin-company.md', 'linkedin-job-search.md', 'hunter-gather.md'],
        workflows: ['go-prospectin.md'],
        scripts: ['agent-assignment.py', 'linkedin-profile.sh', 'linkedin-company.sh', 'linkedin-job-search.sh']
    },
    'auto-jury': {
        tasks: [],
        workflows: ['ask-jury.md'],
        scripts: ['agent-assignment.py']
    }
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
// Show dependencies
const deps = agentDependencies[agent];
if (deps.tasks.length > 0 || deps.workflows.length > 0 || deps.scripts.length > 0) {
    console.log('\x1b[90m├─\x1b[0m Dependencies:');
    if (deps.tasks.length > 0) {
        console.log(`\x1b[90m│\x1b[0m  \x1b[93m•\x1b[0m Tasks: ${deps.tasks.length} files`);
    }
    if (deps.workflows.length > 0) {
        console.log(`\x1b[90m│\x1b[0m  \x1b[92m•\x1b[0m Workflows: ${deps.workflows.length} files`);
    }
    if (deps.scripts.length > 0) {
        console.log(`\x1b[90m│\x1b[0m  \x1b[94m•\x1b[0m Scripts: ${deps.scripts.length} files`);
    }
    console.log('\x1b[90m│\x1b[0m');
}
console.log('\x1b[90m├─\x1b[0m Install to:');
console.log(`\x1b[90m│\x1b[0m  \x1b[96m•\x1b[0m agent-tree/${agent}/`);
console.log(`\x1b[90m│\x1b[0m  \x1b[95m•\x1b[0m .claude/commands/${agent}.md`);
if (deps.tasks.length > 0) {
    console.log(`\x1b[90m│\x1b[0m  \x1b[93m•\x1b[0m agent-tree/tasks/`);
}
if (deps.workflows.length > 0) {
    console.log(`\x1b[90m│\x1b[0m  \x1b[92m•\x1b[0m agent-tree/workflows/`);
}
if (deps.scripts.length > 0) {
    console.log(`\x1b[90m│\x1b[0m  \x1b[94m•\x1b[0m agent-tree/scripts/`);
}
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
// Create tasks, workflows, and scripts directories if needed
if (deps.tasks.length > 0) {
    mkdirSync(join(process.cwd(), 'agent-tree', 'tasks'), { recursive: true });
}
if (deps.workflows.length > 0) {
    mkdirSync(join(process.cwd(), 'agent-tree', 'workflows'), { recursive: true });
}
if (deps.scripts.length > 0) {
    mkdirSync(join(process.cwd(), 'agent-tree', 'scripts'), { recursive: true });
}
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
    // Copy tasks
    if (deps.tasks.length > 0) {
        console.log(`   \x1b[93m•\x1b[0m Copying ${deps.tasks.length} tasks...`);
        for (const task of deps.tasks) {
            const taskSrc = join(__dirname, '..', 'agent-tree', 'tasks', task);
            const taskDest = join(process.cwd(), 'agent-tree', 'tasks', task);
            if (existsSync(taskSrc)) {
                cpSync(taskSrc, taskDest);
            }
            else {
                console.log(`   \x1b[90m  Warning: Task ${task} not found in package\x1b[0m`);
            }
        }
    }
    // Copy workflows
    if (deps.workflows.length > 0) {
        console.log(`   \x1b[92m•\x1b[0m Copying ${deps.workflows.length} workflows...`);
        for (const workflow of deps.workflows) {
            const workflowSrc = join(__dirname, '..', 'agent-tree', 'workflows', workflow);
            const workflowDest = join(process.cwd(), 'agent-tree', 'workflows', workflow);
            if (existsSync(workflowSrc)) {
                cpSync(workflowSrc, workflowDest);
            }
            else {
                console.log(`   \x1b[90m  Warning: Workflow ${workflow} not found in package\x1b[0m`);
            }
        }
    }
    // Copy scripts
    if (deps.scripts.length > 0) {
        console.log(`   \x1b[94m•\x1b[0m Copying ${deps.scripts.length} scripts...`);
        for (const script of deps.scripts) {
            const scriptSrc = join(__dirname, '..', 'agent-tree', 'scripts', script);
            const scriptDest = join(process.cwd(), 'agent-tree', 'scripts', script);
            if (existsSync(scriptSrc)) {
                cpSync(scriptSrc, scriptDest);
                // Make scripts executable
                if (script.endsWith('.sh') || script.endsWith('.py')) {
                    try {
                        chmodSync(scriptDest, 0o755);
                    }
                    catch (error) {
                        console.log(`   \x1b[90m  Warning: Could not make ${script} executable\x1b[0m`);
                    }
                }
            }
            else {
                console.log(`   \x1b[90m  Warning: Script ${script} not found in package\x1b[0m`);
            }
        }
    }
    console.log(`\n   \x1b[32m✓\x1b[0m Installed. Use \x1b[1m\x1b[96m/${agent}\x1b[0m in Claude Code\n`);
}
catch (error) {
    console.error('\n   \x1b[91m✗\x1b[0m Error:', (error instanceof Error ? error.message : error));
    process.exit(1);
}
//# sourceMappingURL=index.js.map