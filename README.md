# WhatsApp AI Agent — Cloud Run MVP v0.1.0

## Overview

This project is the first cloud-native foundation for a future WhatsApp AI Agent.

Version v0.1.0 deploys a minimal Node.js + Express backend to Google Cloud Run using Dockerfile, Cloud Build, Artifact Registry and Cloud Run.

The current goal is to validate that the backend runs correctly before integrating Meta WhatsApp Webhooks.

## Live Service

Cloud Run URL:

https://whatsapp-ai-agent-yit7vpiyqq-uc.a.run.app

Health endpoint:

https://whatsapp-ai-agent-yit7vpiyqq-uc.a.run.app/health

Expected response:

{"ok":true,"service":"whatsapp-ai-agent","version":"0.1.0"}

## Stack

- Node.js
- Express
- Docker
- Google Cloud Build
- Google Artifact Registry
- Google Cloud Run
- Cloud IAM

## Project Structure

- app.js
- package.json
- package-lock.json
- Dockerfile
- .gitignore
- .gcloudignore
- docs/
- scripts/

## Scripts

Build image:

./scripts/build.sh

Deploy to Cloud Run:

./scripts/deploy.sh

Test health endpoint:

./scripts/test-health.sh

## Current Status

- Local Express server: complete
- Dockerfile: complete
- Cloud Build: complete
- Artifact Registry push: complete
- Cloud Run deploy: complete
- Public health check: complete
- WhatsApp webhook: pending v0.2.0

## DevOps Lessons

- Validate locally before deploying.
- Separate build from deploy.
- IAM errors are not code errors.
- Use /health before integrating external systems.
- Use versioned images.
- Start with .run.app before custom domains.
- Limit max instances during labs to control cost.

## Next Milestone

v0.2.0 — WhatsApp Webhook Receiver

Planned features:

- GET /webhook
- POST /webhook
- META_VERIFY_TOKEN
- Structured logs
- Meta webhook verification
- First WhatsApp event received
