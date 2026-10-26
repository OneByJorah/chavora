# Changelog

## [1.0.2](https://github.com/OneByJorah/chavora/compare/v1.0.1...v1.0.2) (2026-10-26)


### Bug Fixes

* non-root nginx, clean .env placeholders, guarded release reconcile ([#80](https://github.com/OneByJorah/chavora/issues/80)) ([5bccb44](https://github.com/OneByJorah/chavora/commit/5bccb442fd962a6ae20be47549fed696c165394f))

## [1.0.1] - 2026-08-22
### Fixed
- README rewritten to match actual code (Workers AI single-model SSE chat; removed fictional multi-provider/JWT/WebSocket/Docker claims)
- Malformed JSON request bodies now return `400` instead of `500`
### Security
- Added input validation on `/api/chat` messages (role whitelist, max 100 messages, max 32k chars each)
- Added Content-Security-Policy header to all responses
- Frontend: empty assistant bubble is now removed when a stream yields no content
### Removed
- Broken Docker Compose deploy path (nginx-only static serve could never run the Workers AI backend)
- Stale `deploy_log.txt`

## [1.0.0] - 2026-07-07
### Added
- Initial release
- .env.example with placeholder values
- README with deployment instructions
