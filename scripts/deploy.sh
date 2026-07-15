#!/usr/bin/env bash
set -e

PROJECT_ID="continual-ripple-mcf5x"
REGION="us-central1"
SERVICE_NAME="whatsapp-ai-agent"
REPO_NAME="whatsapp-ai-agent-repo"
IMAGE_NAME="whatsapp-ai-agent"
VERSION="0.2.0"

IMAGE_URI="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO_NAME}/${IMAGE_NAME}:${VERSION}"

if [ -z "${META_VERIFY_TOKEN}" ]; then
  echo "ERROR: META_VERIFY_TOKEN is not configured."
  echo "Run: export META_VERIFY_TOKEN=your_private_verify_token"
  exit 1
fi

echo "Deploying to Cloud Run..."
echo "Service: ${SERVICE_NAME}"
echo "Image URI: ${IMAGE_URI}"
echo "META_VERIFY_TOKEN: configured"
echo "Max instances: 1"

gcloud run deploy "${SERVICE_NAME}" \
  --image "${IMAGE_URI}" \
  --region "${REGION}" \
  --allow-unauthenticated \
  --port 8080 \
  --max-instances=1 \
  --set-env-vars "META_VERIFY_TOKEN=${META_VERIFY_TOKEN}"

echo "Deploy completed successfully."
