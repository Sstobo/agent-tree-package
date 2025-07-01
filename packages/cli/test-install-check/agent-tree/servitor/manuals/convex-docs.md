# Convex Production Helper Docs

These guidelines and canonical patterns ensure high-quality, maintainable Convex codebases, adhering to community best practices and Convex's own recommendations.

## 1. Core Rules & Guidelines

- Always authenticate users in mutations
- Never return values from mutations unless explicitly required
- Use only canonical, object-style registration for queries/mutations/actions
- Prefer indexes and `.withIndex()` for queries; use the filter helper only when necessary
- Always use strict types: `import type { Doc, Id } from "./_generated/dataModel"`
- Never use ad hoc types or string for IDs
- Queries must not be placed inside hooks conditionally; always top-level
- Only define schema in `convex/schema.ts`
- Keep all Convex logic in `convex/` files for clarity and maintainability
- System fields auto-added: `_id`, `_creationTime`
- Use the `partial` helper for partial updates

## 2. Function Registration & Usage

### Canonical Query Syntax

```ts
import { query } from "./_generated/server";
import { v } from "convex/values";

export const getById = query({
  args: { _id: v.id("divisions") },
  returns: v.any(), // Or `v.null()` if nothing returned
  handler: async (ctx, args) => {
    const identity = await ctx.auth.getUserIdentity();
    if (!identity) throw new Error("Not authenticated");
    return await ctx.db.get(args._id);
  },
});
```

### Canonical Mutation Syntax

```ts
import { mutation } from "./_generated/server";
import { v } from "convex/values";

export const create = mutation({
  args: { divisionName: v.string() },
  returns: v.null(),
  handler: async (ctx, args) => {
    const identity = await ctx.auth.getUserIdentity();
    if (!identity) throw new Error("Not authenticated");
    await ctx.db.insert("divisions", { divisionName: args.divisionName });
    return null;
  },
});
```

### Argument and Return Validators

Always use argument (`args`) and return (`returns`) validators. If a function does not return anything, use `returns: v.null()`.

## 3. TypeScript & Validator Best Practices

Always use `Id<'table'>` and `Doc<'table'>` for strict typing.

For partial updates, import and use the `partial` helper from `convex-helpers/validators`.

```ts
import { partial } from "convex-helpers/validators";
import { mutation } from "./_generated/server";
import { v } from "convex/values";
import schema from "./schema";

export const update = mutation({
  args: {
    userId: v.string(),
    patch: v.object(partial(schema.tables.users.validator.fields)),
  },
  returns: v.null(),
  handler: async (ctx, args) => {
    const identity = await ctx.auth.getUserIdentity();
    if (!identity) throw new Error("Not authenticated");
    if (identity.subject !== args.userId) throw new Error("Unauthorized");
    const user = await ctx.db.query("users")
      .withIndex("by_userId", (q) => q.eq("userId", args.userId))
      .unique();
    if (!user) throw new Error("User not found");
    await ctx.db.patch(user._id, args.patch);
    return null;
  },
});
```

## 4. Querying Patterns

### Query All

```ts
export const getAll = query({
  args: {},
  returns: v.array(v.any()),
  handler: async (ctx) => {
    const identity = await ctx.auth.getUserIdentity();
    if (!identity) throw new Error("Not authenticated");
    return await ctx.db.query("divisions").collect();
  },
});
```

### Query by Related ID (with index)

```ts
export const getByLeagueId = query({
  args: { leagueId: v.id("leagues") },
  returns: v.array(v.any()),
  handler: async (ctx, args) => {
    const identity = await ctx.auth.getUserIdentity();
    if (!identity) throw new Error("Not authenticated");
    return await ctx.db
      .query("divisions")
      .withIndex("by_league_id", (q) => q.eq("leagueId", args.leagueId))
      .collect();
  },
});
```

## 5. The filter Helper (TypeScript Filtering)

For filtering beyond Convex's built-in indexes, use the canonical filter helper:

```ts
import { filter } from "convex-helpers/server/filter";

export const evens = query({
  args: {},
  returns: v.array(v.any()),
  handler: async (ctx) => {
    return await filter(
      ctx.db.query("counter_table"),
      (c) => c.counter % 2 === 0,
    ).collect();
  },
});
```

For arbitrary filters that must scale, prefer join tables or indexed fields.

## 6. Pagination

Use built-in pagination or combine with filters as needed.

```ts
import { paginationOptsValidator } from "convex/server";

export const listPaginated = query({
  args: { paginationOpts: paginationOptsValidator, author: v.string() },
  returns: v.any(),
  handler: async (ctx, args) => {
    return await ctx.db
      .query("messages")
      .filter((q) => q.eq(q.field("author"), args.author))
      .order("desc")
      .paginate(args.paginationOpts);
  },
});
```

With the filter helper:

```ts
export const postsWithTag = query({
  args: { tag: v.string(), paginationOpts: paginationOptsValidator },
  returns: v.any(),
  handler: (ctx, args) => {
    return filter(
      ctx.db.query("posts"),
      (post) => post.tags.includes(args.tag),
    ).paginate(args.paginationOpts);
  },
});
```

## 7. Indexed Filtering & Join Tables (Canonical Pattern)

For filtering on array membership at scale, denormalize using a join table and index:

```ts
// schema.ts
export default defineSchema({
  posts: defineTable({
    body: v.string(),
    tags: v.array(v.string()),
  }),
  tagged_posts: defineTable({
    tag: v.string(),
    post: v.id("posts"),
  }).index("by_tag", ["tag"]),
});

// query
export const postsWithTag = query({
  args: { tag: v.string() },
  returns: v.array(v.any()),
  handler: async (ctx, args) => {
    const taggedPosts = await ctx.db.query("tagged_posts")
      .withIndex("by_tag", (q) => q.eq("tag", args.tag))
      .collect();
    return await Promise.all(
      taggedPosts.map((taggedPost) => ctx.db.get(taggedPost.post))
    );
  },
});
```

## 8. Full-Text Search

For searching large string fields, define a search index:

```ts
// schema.ts
export default defineSchema({
  posts: defineTable({
    body: v.string(),
    tags: v.string(), // e.g. "happy joyful"
  }).searchIndex("search_tags", { searchField: "tags" }),
});

// query
export const postsWithTag = query({
  args: { tag: v.string() },
  returns: v.array(v.any()),
  handler: async (ctx, args) => {
    return await ctx.db.query("posts")
      .withSearchIndex("search_tags", (q) => q.search("tags", args.tag))
      .collect();
  },
});
```

## 9. CRUD Utilities

For quickly generating full CRUD operations:

```ts
import { crud } from "convex-helpers/server/crud";
import schema from "./schema.js";
export const { create, read, update, destroy } = crud(schema, "users");
```

## 10. Relationship Helpers

For traversing relations:

```ts
import {
  getOneFromOrThrow,
  getManyFrom,
  getManyViaOrThrow,
} from "convex-helpers/server/relationships.js";
import { asyncMap } from "convex-helpers";

// Example: Get author, posts, comments, categories
const author = await getOneFromOrThrow(db, "authors", "userId", user._id);
const posts = await asyncMap(
  await getManyFrom(db, "posts", "authorId", author._id),
  async (post) => {
    const comments = await getManyFrom(db, "comments", "postId", post._id);
    const categories = await getManyViaOrThrow(
      db, "postCategories", "categoryId", "postId", post._id
    );
    return { ...post, comments, categories };
  }
);
```

## 11. Triggers

Run logic on table changes using triggers:

```ts
import { Triggers } from "convex-helpers/server/triggers";
import { customMutation } from "convex-helpers/server/customFunctions";
import { mutation as rawMutation } from "./_generated/server";
import { DataModel } from "./_generated/dataModel";

const triggers = new Triggers<DataModel>();

// Example: Denormalize count
triggers.register("users", async (ctx, change) => {
  const countDoc = (await ctx.db.query("userCount").unique())!;
  if (change.operation === "insert") {
    await ctx.db.patch(countDoc._id, { count: countDoc.count + 1 });
  } else if (change.operation === "delete") {
    await ctx.db.patch(countDoc._id, { count: countDoc.count - 1 });
  }
});

// Wrap mutation
export const mutation = customMutation(rawMutation, triggers.wrapDB);
```

## 12. Custom Function Patterns & Row-level Security (RLS)

Wrap queries/mutations/actions for shared behaviors:

```ts
import { customQuery } from "convex-helpers/server/customFunctions";
import {
  Rules,
  wrapDatabaseReader,
  wrapDatabaseWriter,
} from "convex-helpers/server/rowLevelSecurity";
import { DataModel } from "./_generated/dataModel";
import { query, mutation } from "./_generated/server";

async function rlsRules(ctx) {
  const identity = await ctx.auth.getUserIdentity();
  return {
    users: {
      read: async (_, user) => !!identity,
      modify: async (_, user) => identity && user.tokenIdentifier === identity.tokenIdentifier,
      insert: async () => true,
    },
  } satisfies Rules<typeof ctx, DataModel>;
}

const queryWithRLS = customQuery(
  query,
  async (ctx) => ({ db: wrapDatabaseReader(ctx, ctx.db, await rlsRules(ctx)) })
);

const mutationWithRLS = customQuery(
  mutation,
  async (ctx) => ({ db: wrapDatabaseWriter(ctx, ctx.db, await rlsRules(ctx)) })
);
```

## 13. File Storage

Use `ctx.storage.getUrl()` for signed file URLs.

To get file metadata, use the system `_storage` table:

```ts
import { query } from "./_generated/server";
import { Id } from "./_generated/dataModel";

type FileMetadata = {
  _id: Id<"_storage">;
  _creationTime: number;
  contentType?: string;
  sha256: string;
  size: number;
}

export const getFileMetadata = query({
  args: { fileId: v.id("_storage") },
  returns: v.any(),
  handler: async (ctx, args) => {
    return await ctx.db.system.get(args.fileId);
  },
});
```

## 14. HTTP Endpoints

Define HTTP routes in `convex/http.ts`:

```ts
import { httpRouter } from "convex/server";
import { httpAction } from "./_generated/server";

const http = httpRouter();
http.route({
  path: "/echo",
  method: "POST",
  handler: httpAction(async (ctx, req) => {
    const body = await req.bytes();
    return new Response(body, { status: 200 });
  }),
});
export default http;
```

### With CORS

```ts
import { corsRouter } from "convex-helpers/server/cors";
const cors = corsRouter(http);
cors.route({
  path: "/foo",
  method: "POST",
  handler: httpAction(async () => new Response("ok")),
  allowedOrigins: ["http://localhost:8080"],
});
export default cors.http;
```

## 15. Zod Validation

You can use Zod for advanced argument validation:

```ts
import { z } from "zod";
import { zCustomQuery, zid } from "convex-helpers/server/zod";

const zodQuery = zCustomQuery(query);

export const myComplexQuery = zodQuery({
  args: {
    userId: zid("users"),
    email: z.string().email(),
    num: z.number().min(0),
    kind: z.union([
      z.object({ kind: z.literal("a"), a: z.string() }),
      z.object({ kind: z.literal("b"), b: z.number() }),
    ]),
  },
  handler: async (ctx, args) => {
    // args validated and parsed by Zod
  },
});
```

## 16. Rate Limiting, Migrations, Retries, Sessions

- **Rate limiting**: Use `@convex-dev/rate-limiter` (docs)
- **Migrations**: Use `@convex-dev/migrations` for stateful schema/data changes
- **Retries**: Use the `makeActionRetrier` helper from `convex-helpers/server/retries` for robust actions
- **Anonymous sessions**: Use `SessionProvider` (client) and `queryWithSession` (server) from `convex-helpers/react/sessions` and `convex-helpers/server/sessions` for tracking non-logged-in users

## 17. Validator Utility Helpers

Use helpers for partials, branded strings, deprecated fields, unions, etc.

```ts
import { partial, literals, brandedString, deprecated } from "convex-helpers/validators";
```

See `convex-helpers` documentation for full details.

## 18. Miscellaneous

For composable streams or advanced pagination, see the `convex-helpers/server/stream` and paginator utilities.

For query caching in React, use `ConvexQueryCacheProvider` from `convex-helpers/react/cache`.

---

## The Zen of Convex

Convex is an opinionated framework, with every element designed to pull developers into the pit of success.

The Zen of Convex is a set of guidelines & best practices developers have discovered that keep their projects falling into this wonderful pit.

### Performance

#### Double down on the sync engine

There's a reason why a deterministic, reactive database is the beating heart of Convex: the more you center your apps around its properties, the better your projects will fare over time. Your projects will be easier to understand and refactor. Your app's performance will stay screaming fast. You won't have any consistency or state management problems.

#### Use a query for nearly every app read

Queries are the reactive, automatically cacheable, consistent and resilient way to propagate data to your application and its jobs. With very few exceptions, every read operation in your app should happen via a query function.

#### Keep sync engine functions light & fast

In general, your mutations and queries should be working with less than a few hundred records and should aim to finish in less than 100ms. It's nearly impossible to maintain a snappy, responsive app if your synchronous transactions involve a lot more work than this.

#### Use actions sparingly and incrementally

Actions are wonderful for batch jobs and/or integrating with outside services. They're very powerful, but they're slower, more expensive, and Convex provides a lot fewer guarantees about their behavior. So never use an action if a query or mutation will get the job done.

#### Don't over-complicate client-side state management

Convex builds in a ton of its own caching and consistency controls into the app's client library. Rather than reinvent the wheel, let your client-side code take advantage of these built-in performance boosts.

#### Let Convex handle caching & consistency

You might be tempted to quickly build your own local cache or state aggregation layer in Convex to sit between your components and your Convex functions. With Convex, most of the time, you won't end up needing this. More often than not, you can bind your components to Convex functions in pretty simple ways and things will Just Work and be plenty fast.

#### Be thoughtful about the return values of mutations

Mutation return values can be useful to trigger state changes in your app, but it's rarely a good idea to use them to set in-app state to update the UI. Let queries and the sync engine do that.

### Architecture

#### Create server-side frameworks using "just code"

Convex's built-in primitives are pretty low level! They're just functions. What about authentication frameworks? What about object-relational mappings? Do you need to wait until Convex ships some in-built feature to get those? Nope. In general, you should solve composition and encapsulation problems in your server-side Convex code using the same methods you use for the rest of your TypeScript code bases. After all, this is why Convex is "just code!" Stack always has great examples of ways to tackle these needs.

#### Don't misuse actions

Actions are powerful, but it's important to be intentional in how they fit into your app's data flow.

#### Don't invoke actions directly from your app

In general, it's an anti-pattern to call actions from the browser. Usually, actions are running on some dependent record that should be living in a Convex table. So it's best trigger actions by invoking a mutation that both writes that dependent record and schedules the subsequent action to run in the background.

#### Don't think 'background jobs', think 'workflow'

When actions are involved, it's useful to write chains of effects and mutations, such as:

action code → mutation → more action code → mutation.

Then apps or other jobs can follow along with queries.

#### Record progress one step at a time

While actions could work with thousands of records and call dozens of APIs, it's normally best to do smaller batches of work and/or to perform individual transformations with outside services. Then record your progress with a mutation, of course. Using this pattern makes it easy to debug issues, resume partial jobs, and report incremental progress in your app's UI.