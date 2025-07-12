convex-test
The convex-test library provides a mock implementation of the Convex backend in JavaScript. It enables fast automated testing of the logic in your functions.

Example: The library includes a test suite which you can browse to see examples of using it.

Get Started
Install test dependencies
Install Vitest and the convex-test library.

npm install --save-dev convex-test vitest @edge-runtime/vm

Setup NPM scripts
Add these scripts to your package.json

package.json
"scripts": {
  "test": "vitest",
  "test:once": "vitest run",
  "test:debug": "vitest --inspect-brk --no-file-parallelism",
  "test:coverage": "vitest run --coverage --coverage.reporter=text",
}

Configure Vitest
Add vitest.config.mts file to configure the test environment to better match the Convex runtime, and to inline the test library for better dependency tracking.

vitest.config.mts
TS
import { defineConfig } from "vitest/config";

export default defineConfig({
  test: {
    environment: "edge-runtime",
    server: { deps: { inline: ["convex-test"] } },
  },
});

Add a test file
In your convex folder add a file ending in .test.ts

The example test calls the api.messages.send mutation twice and then asserts that the api.messages.list query returns the expected results.

convex/messages.test.ts
TS
import { convexTest } from "convex-test";
import { expect, test } from "vitest";
import { api } from "./_generated/api";
import schema from "./schema";

test("sending messages", async () => {
  const t = convexTest(schema);
  await t.mutation(api.messages.send, { body: "Hi!", author: "Sarah" });
  await t.mutation(api.messages.send, { body: "Hey!", author: "Tom" });
  const messages = await t.query(api.messages.list);
  expect(messages).toMatchObject([
    { body: "Hi!", author: "Sarah" },
    { body: "Hey!", author: "Tom" }
  ]);
});

Run tests
Start the tests with npm run test. When you change the test file or your functions the tests will rerun automatically.

npm run test

If you're not familiar with Vitest or Jest read the Vitest Getting Started docs first.

convexTest
The library exports a convexTest function which should be called at the start of each of your tests. The function returns an object which is by convention stored in the t variable and which provides methods for exercising your Convex functions.

If your project uses a schema you should pass it to the convexTest function:

convex/myFunctions.test.ts
TS
import { convexTest } from "convex-test";
import { test } from "vitest";
import schema from "./schema";

test("some behavior", async () => {
  const t = convexTest(schema);
  // use `t`...
});

Passing in the schema is required for the tests to correctly implement schema validation and for correct typing of t.run.

If you don't have a schema, call convexTest() with no argument.

Calling functions with t.query, t.mutation and t.action
Your test can call public and internal Convex functions in your project:

convex/myFunctions.test.ts
TS
import { convexTest } from "convex-test";
import { test } from "vitest";
import { api, internal } from "./_generated/api";

test("functions", async () => {
  const t = convexTest();
  const x = await t.query(api.myFunctions.myQuery, { a: 1, b: 2 });
  const y = await t.query(internal.myFunctions.internalQuery, { a: 1, b: 2 });
  const z = await t.mutation(api.myFunctions.mutateSomething, { a: 1, b: 2 });
  const w = await t.mutation(internal.myFunctions.mutateSomething, { a: 1 });
  const u = await t.action(api.myFunctions.doSomething, { a: 1, b: 2 });
  const v = await t.action(internal.myFunctions.internalAction, { a: 1, b: 2 });
});

Setting up and inspecting data and storage with t.run
Sometimes you might want to directly write to the mock database or file storage from your test, without needing a declared function in your project. You can use the t.run method which takes a handler that is given a ctx that allows reading from and writing to the mock backend:

convex/tasks.test.ts
TS
import { convexTest } from "convex-test";
import { expect, test } from "vitest";

test("functions", async () => {
  const t = convexTest();
  const firstTask = await t.run(async (ctx) => {
    await ctx.db.insert("tasks", { text: "Eat breakfast" });
    return await ctx.db.query("tasks").first();
  });
  expect(firstTask).toMatchObject({ text: "Eat breakfast" });
});

Testing HTTP actions with t.fetch
Your test can call HTTP actions registered by your router:

convex/http.test.ts
TS
import { convexTest } from "convex-test";
import { test } from "vitest";

test("functions", async () => {
  const t = convexTest();
  const response = await t.fetch("/some/path", { method: "POST" });
});

Mocking the global fetch function doesn't affect t.fetch, but you can use t.fetch in a fetch mock to route to your HTTP actions.

Testing scheduled functions
One advantage of using a mock implementation running purely in JavaScript is that you can control time in the Vitest test environment. To test implementations relying on scheduled functions use Vitest's fake timers in combination with t.finishInProgressScheduledFunctions:

convex/scheduling.test.ts
TS
import { convexTest } from "convex-test";
import { expect, test, vi } from "vitest";
import { api } from "./_generated/api";
import schema from "./schema";

test("mutation scheduling action", async () => {
  // Enable fake timers
  vi.useFakeTimers();

  const t = convexTest(schema);

  // Call a function that schedules a mutation or action
  const scheduledFunctionId = await t.mutation(
    api.scheduler.mutationSchedulingAction,
    { delayMs: 10000 },
  );

  // Advance the mocked time
  vi.advanceTimersByTime(5000);

  // Advance the mocked time past the scheduled time of the function
  vi.advanceTimersByTime(6000);

  // Or run all currently pending timers
  vi.runAllTimers();

  // At this point the scheduled function will be `inProgress`,
  // now wait for it to finish
  await t.finishInProgressScheduledFunctions();

  // Assert that the scheduled function succeeded or failed
  const scheduledFunctionStatus = t.run(async (ctx) => {
    return await ctx.db.get(scheduledFunctionId);
  });
  expect(scheduledFunctionStatus).toMatchObject({ state: { kind: "success" } });

  // Reset to normal `setTimeout` etc. implementation
  vi.useRealTimers();
});

If you have a chain of several scheduled functions, for example a mutation that schedules an action that schedules another action, you can use t.finishAllScheduledFunctions to wait for all scheduled functions, including recursively scheduled functions, to finish:

convex/chainedScheduling.test.ts
TS
import { convexTest } from "convex-test";
import { expect, test, vi } from "vitest";
import { api } from "./_generated/api";
import schema from "./schema";

test("mutation scheduling action scheduling action", async () => {
  // Enable fake timers
  vi.useFakeTimers();

  const t = convexTest(schema);

  // Call a function that schedules a mutation or action
  await t.mutation(api.scheduler.mutationSchedulingActionSchedulingAction);

  // Wait for all scheduled functions, repeatedly
  // advancing time and waiting for currently in-progress
  // functions to finish
  await t.finishAllScheduledFunctions(vi.runAllTimers);

  // Assert the resulting state after all scheduled functions finished
  const createdTask = t.run(async (ctx) => {
    return await ctx.db.query("tasks").first();
  });
  expect(createdTask).toMatchObject({ author: "AI" });

  // Reset to normal `setTimeout` etc. implementation
  vi.useRealTimers();
});

Check out more examples in this file.

Testing authentication with t.withIdentity
To test functions which depend on the current authenticated user identity you can create a version of the t accessor with given user identity attributes. If you don't provide them, issuer, subject and tokenIdentifier will be generated automatically:

convex/tasks.test.ts
TS
import { convexTest } from "convex-test";
import { expect, test } from "vitest";
import { api } from "./_generated/api";
import schema from "./schema";

test("authenticated functions", async () => {
  const t = convexTest(schema);

  const asSarah = t.withIdentity({ name: "Sarah" });
  await asSarah.mutation(api.tasks.create, { text: "Add tests" });

  const sarahsTasks = await asSarah.query(api.tasks.list);
  expect(sarahsTasks).toMatchObject([{ text: "Add tests" }]);

  const asLee = t.withIdentity({ name: "Lee" });
  const leesTasks = await asLee.query(api.tasks.list);
  expect(leesTasks).toEqual([]);
});

Mocking fetch calls
You can use Vitest's vi.stubGlobal method:

convex/ai.test.ts
TS
import { expect, test, vi } from "vitest";
import { convexTest } from "../index";
import { api } from "./_generated/api";
import schema from "./schema";

test("ai", async () => {
  const t = convexTest(schema);

  vi.stubGlobal(
    "fetch",
    vi.fn(async () => ({ text: async () => "I am the overlord" }) as Response),
  );

  const reply = await t.action(api.messages.sendAIMessage, { prompt: "hello" });
  expect(reply).toEqual("I am the overlord");

  vi.unstubAllGlobals();
});

Asserting results
See Vitest's Expect reference.

toMatchObject() is particularly helpful when asserting the shape of results without needing to list every object field.

Asserting errors
To assert that a function throws, use .rejects.toThrowError():

convex/messages.test.ts
TS
import { convexTest } from "convex-test";
import { expect, test } from "vitest";
import { api } from "./_generated/api";
import schema from "./schema";

test("messages validation", async () => {
  const t = convexTest(schema);
  expect(async () => {
    await t.mutation(api.messages.send, { body: "", author: "James" });
  }).rejects.toThrowError("Empty message body is not allowed");
});

Measuring test coverage
You can get a printout of the code coverage provided by your tests. Besides answering the question "how much of my code is covered by tests" it is also helpful to check that your test is actually exercising the code that you want it to exercise.

Run npm run test:coverage

. It will ask you to install a required dependency the first time you run it.

example coverage printout

Debugging tests
You can attach a debugger to the running tests. Read the Vitest Debugging docs and then use npm run test:debug

.

Multiple environments
If you want to use Vitest to test both your Convex functions and your React frontend, you might want to use multiple Vitest environments depending on the test file location via environmentMatchGlobs:

vitest.config.mts
TS
import { defineConfig } from "vitest/config";

export default defineConfig({
  test: {
    environmentMatchGlobs: [
      // all tests in convex/ will run in edge-runtime
      ["convex/**", "edge-runtime"],
      // all other tests use jsdom
      ["**", "jsdom"],
    ],
    server: { deps: { inline: ["convex-test"] } },
  },
});

Custom convex/ folder name or location
If your project has a different name or location configured for the convex/ folder in convex.json, you need to call import.meta.glob and pass the result as the second argument to convexTest.

The argument to import.meta.glob must be a glob pattern matching all the files containing your Convex functions. The paths are relative to the test file in which import.meta.glob is called. It's best to do this in one place in your custom functions folder:

src/convex/test.setup.ts
TS
/// <reference types="vite/client" />
export const modules = import.meta.glob("./**/!(*.*.*)*.*s");

This example glob pattern includes all files with a single extension ending in s (like js or ts) in the src/convex folder and any of its children.

Use the result in your tests:

src/convex/messages.test.ts
TS
import { convexTest } from "convex-test";
import { test } from "vitest";
import schema from "./schema";
import { modules } from "./test.setup";

test("some behavior", async () => {
  const t = convexTest(schema, modules);
  // use `t`...
});

Limitations
Since convex-test is only a mock implementation, it doesn't have many of the behaviors of the real Convex backend. Still, it should be helpful for testing the logic in your functions, and catching regressions caused by changes to your code.

Some of the ways the mock differs:

Error messages content. You should not write product logic that relies on the content of error messages thrown by the real backend, as they are always subject to change.
Limits. The mock doesn't enforce size and time limits.
ID format. Your code should not depend on the document or storage ID format.
Runtime built-ins. Most of your functions are written for the Convex default runtime, while Vitest uses a mock of Vercel's Edge Runtime, which is similar but might differ from the Convex runtime. You should always test new code manually to make sure it doesn't use built-ins not available in the Convex runtime.
Some features have only simplified semantics, namely:
Text search returns all documents that include a word for which at least one word in the searched string is a prefix. It does not implement fuzzy searching and doesn't sort the results by relevance.
Vector search returns results sorted by cosine similarity, but doesn't use an efficient vector index in its implementation.
There is no support for cron jobs, you should trigger your functions manually from the test.
To test your functions running on a real Convex backend, check out Testing Local Backend.

