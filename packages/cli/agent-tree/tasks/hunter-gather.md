# Hunter Gather

## *hunter-gather command

You will be running our hunter-gather workflow. You will be spinning up agents to work in parallel, allowing us must faster actioning of user requirements.

## Input

- Prompt: the users requirement
- Magnitude: How many times to run the workflow

## Agents

- Hunter agents are critical, meticulous and work to track bugs, enforce best practices, and think carefully to return code to its most basic possible state, adhering to the default documentation, while only ever improving functionality.

- Gather agents map out features in the codebase. They gather data from the front end route, to the components, then down into the backend functions all the way to the backend schema. Goal is to provide a Hunter agent with a clear lay of the land.

## Instructions

1. Deploy an 'Gather' agent with instructions to gather information on a specific feature or area in the codebase, as per the users Prompt.
2. Upon that agents return, release a 'Hunter' agent equiped with the 'gathered' information and with instructions to plan out execution of the users requirements.
3. As the 'Hunter' agent makes a plan, deploy another 'Gather' agent to explore the areas close to and overlapping the focused feature.

- Repeat from Step 2 * Magnitude

4. Produce a detailed report and gameplan featuring a detailed map of the problem or opportunity, an ascii map of all interactions. A complete filemap. Psuedo coded descriptions of all functions. Thorough list of numbered steps required to fulfil the users prompted request. 

5. Offer to create an hunter-gather-<subject>.md file for the user in a folder of their choice.