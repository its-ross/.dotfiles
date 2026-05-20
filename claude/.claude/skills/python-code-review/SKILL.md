# Python Code Review — Reference Checklists

## Architecture & Design

- **Single Responsibility**: does each class/module do one thing? Look for God classes or modules that own unrelated concerns
- **Coupling**: are modules tightly coupled via concrete imports instead of abstractions? Watch for circular imports (`A → B → A`)
- **Dependency direction**: do lower layers import from higher layers? (e.g. data layer importing from API layer)
- **Layering violations**: business logic leaking into route handlers or CLI entry points; DB queries scattered across unrelated modules
- **Cohesion**: do the functions/methods in a module belong together conceptually?
- **Interface clarity**: are public APIs narrow and explicit? Are internal helpers clearly private (`_name`)?

## Python Best Practices

- **Type hints**: missing annotations on function signatures, especially public APIs; use `from __future__ import annotations` for forward refs
- **Docstrings**: missing or stale docstrings on public functions/classes
- **Pythonic idioms**:
  - Prefer `dataclasses` or `pydantic` models over raw `dict` for structured data
  - Use context managers (`with`) for resources (files, connections, locks)
  - Prefer comprehensions over `map`/`filter` with lambdas where readable
  - Use `pathlib.Path` over `os.path` string manipulation
  - Use `Enum` over bare string/int constants
  - Use `itertools` / `functools` instead of manual loops where appropriate
- **DRY violations**: copy-pasted logic that should be extracted into a shared helper
- **Dead code**: unreachable branches, unused imports, commented-out blocks
- **Magic numbers/strings**: unnamed literals that should be named constants
- **Mutable default arguments**: `def f(items=[])` — classic Python footgun
- **No local imports**: imports inside functions or methods (`def f(): import x`) obscure dependencies and hurt readability; all imports should be at module top-level (exception: intentional lazy-loading for performance, which should be commented)

## Security

- **SQL injection**: string-formatted queries instead of parameterised queries
- **Command injection**: `subprocess` called with `shell=True` and user-controlled input; prefer `shell=False` with a list
- **Deserialization**: `pickle.loads` on untrusted data; prefer `json` or `msgpack`
- **Hardcoded secrets**: API keys, passwords, tokens in source; should use env vars or a secrets manager
- **`eval` / `exec`**: on any user-supplied or externally sourced string
- **Path traversal**: user input used in file paths without sanitisation (use `Path.resolve()` and check it's within an allowed root)
- **SSRF**: user-controlled URLs passed to `requests`/`httpx` without allowlist validation
- **Insecure temp files**: `open('/tmp/...')` — use `tempfile.NamedTemporaryFile` or `tempfile.mkstemp`
- **Missing input validation**: no length/type/range checks on data entering the system boundary
- **XML vulnerabilities**: `xml.etree` is safe; `lxml` with `resolve_entities=True` is not; avoid `xmlrpc` with untrusted input

## Scalability & Performance

- **O(n²) patterns**: nested loops over the same collection; repeated `.index()` / `in` checks on lists (use sets/dicts)
- **Unbounded growth**: lists/dicts that accumulate indefinitely; missing pagination on queries
- **N+1 queries**: loading a collection then querying per item in a loop; should be a single join/bulk fetch
- **Blocking I/O in async**: `requests`, `time.sleep`, file I/O, or synchronous DB calls inside `async def` functions; use `httpx.AsyncClient`, `asyncio.sleep`, `aiofiles`, async DB drivers
- **Global mutable state**: module-level dicts/lists mutated by concurrent code; not thread-safe
- **Missing caching**: repeated computation or I/O for the same inputs; consider `functools.lru_cache` / `cache`
- **Large in-memory loads**: reading entire files or query result sets into memory; prefer streaming/chunked reads
- **Thread safety**: shared mutable state accessed from threads without locks

## Error Handling

- **Bare `except:`**: catches `SystemExit`, `KeyboardInterrupt`, and everything else; use `except Exception:` at minimum
- **Swallowed exceptions**: `except ...: pass` with no logging; silent failures hide bugs
- **Overly broad types**: catching `Exception` when only `ValueError` is expected; masks unexpected errors
- **Missing `finally` / context managers**: resources (files, DB connections, locks) not released on error paths
- **No logging**: errors caught but not logged; use `logging.exception(...)` inside handlers to preserve tracebacks
- **Re-raising correctly**: `raise` (bare) preserves the original traceback; `raise e` loses it
- **Custom exceptions**: raw `Exception("message")` instead of a named exception class; hard to catch selectively upstream
