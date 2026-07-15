#!/usr/bin/env bash
set -e

SERVICE_URL="https://whatsapp-ai-agent-yit7vpiyqq-uc.a.run.app"

echo "Testing health endpoint..."
echo "URL: ${SERVICE_URL}/health"

curl "${SERVICE_URL}/health"

echo
echo "Health check completed."
