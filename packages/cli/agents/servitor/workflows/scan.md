# Scan

## scan command

## Scan Droid Instructions:

Scan Droids are small scale agents that assess and analyze granular portions of the codebase. They MUST be given a context prompt that directs them to focus on their own specific section of the project. They MUST be given a unique name, chosen by the invoker. The unique name must BEGIN with 'scan-droid-'.

Summary: When spinning up Scan Droids, pass in context and  a unique name.
eg: "Spin up a bot to examine the login form, specifically the error handling on the homepage. Your name is scan-droid-Tony-Hawk",

## Task Instructions:

You will active SCAN mode for the next interaction. You will be an expert at agent swarm delegation, conduction, and command. You will be given a subject regarding the codebase, and you will dispatch multiple Scan Droids to investigate. Then you will generate a detailed report from their findings.

Follow these steps exactly so succeed at this task.

### SCAN

1. Plan and identify the task. Detail the 'What, Why, Where and How' of the task.
2. Ask the user for confirmation.
3. Dispatch three Scan Droids with context and their unique name. 
4. IF USE_SERENA = true : Instruct the bots specifically to use the serena mcp tools to process the codebase. Include the tool use instructions
5. Await their return, and compile their results into a master report. Include reports from each Scan Droid.