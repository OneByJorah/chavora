# Changelog

## [0.2.0](https://github.com/OneByJorah/chavora/compare/v0.1.0...v0.2.0) (2026-10-18)


### Features

* add docker-compose.deploy.yml for production deployment ([c5551a7](https://github.com/OneByJorah/chavora/commit/c5551a71d9013d05aa859ab50071770cc6d3ca80))


### Bug Fixes

* add security headers to all Worker responses ([2066262](https://github.com/OneByJorah/chavora/commit/2066262643948faf7b84db1aa69a36e02e2fc84e))
* **audit:** add standard project files ([3fe9d32](https://github.com/OneByJorah/chavora/commit/3fe9d3208b90c3c66ca3739919fc81fdfe3adb24))
* **ci:** audit production dependencies, not dev tooling ([#73](https://github.com/OneByJorah/chavora/issues/73)) ([08a33d3](https://github.com/OneByJorah/chavora/commit/08a33d3346b635c2394482121e4adc574198a446))
* **compose:** bind published ports to localhost only ([#72](https://github.com/OneByJorah/chavora/issues/72)) ([46e4f50](https://github.com/OneByJorah/chavora/commit/46e4f502871f9e7b7fef60dd18140fe960c29763))
* prevent XSS via innerHTML by adding escapeHtml helper ([7c37084](https://github.com/OneByJorah/chavora/commit/7c37084cf633c29c687f506a3b1dae86215c14ea))
* remove template vestiges for non-existent ecosystems ([7759b1f](https://github.com/OneByJorah/chavora/commit/7759b1f5a8409657a2d10f94a2a57ac4e681965b))
* update branding from template defaults to ChatForge ([0d834d8](https://github.com/OneByJorah/chavora/commit/0d834d81ca8b9c095bd00336c731a4dae1c4ddfa))
* use ChatForge as wrangler project name ([009be7b](https://github.com/OneByJorah/chavora/commit/009be7b5d754debee40d8bb7ed7084da479d0f68))

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
