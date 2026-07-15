# Security Policy — WhatsApp AI Agent v0.1.0

## Current Security Status

This project is currently in MVP stage.

Version `v0.1.0` exposes only two public HTTP endpoints:

- `GET /`
- `GET /health`

The service is deployed on Google Cloud Run and is publicly reachable through a `run.app` HTTPS URL.

Current Cloud Run URL:

```text
https://whatsapp-ai-agent-yit7vpiyqq-uc.a.run.app
