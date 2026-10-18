# chavora Architecture

## Overview

chavora is a single-file Cloudflare Worker that serves both static frontend assets and an AI chat API endpoint.

## Architecture Diagram

```
Browser ──HTTPS──> Cloudflare Worker (src/index.ts)
                        │
                        ├── / or non-/api/* ──> env.ASSETS.fetch() ──> public/ (static files)
                        │
                        └── POST /api/chat ──> env.AI.run() ──> Workers AI (Llama 3.1 8B)
                                                    │
                                                    └── stream ──> text/event-stream response
```

## Key Design Decisions

1. **Single Worker, no origin server** — Eliminates cold starts, reduces complexity, single `wrangler deploy` command.
2. **Vanilla HTML/JS frontend** — No framework overhead, 5.65 KiB gzipped total.
3. **SSE streaming with dual-format parser** — Handles both Workers AI and OpenAI-compatible formats.
4. **Llama 3.1 8B (FP8 quantized)** — Good balance of quality and latency on Cloudflare's edge network.
5. **System prompt auto-injection** — Simplifies client implementation while allowing overrides.

## Limitations

- **No authentication** — Anyone with the Worker URL can use the API
- **No rate limiting** — No protection against excessive usage
- **No persistence** — Chat history is in-memory only, lost on refresh
- **No database** — No D1, KV, or R2 integration

## Upgrade Path

For production use, consider:
- Adding Cloudflare Access for authentication
- Enabling AI Gateway for caching and rate limiting
- Adding D1 or KV for conversation persistence
- Adding a CI/CD deployment workflow
