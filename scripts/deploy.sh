#!/usr/bin/env bash
set -e

PROJECT_ID="continual-ripple-mcf5x"
REGION="us-central1"
SERVICE_NAME="whatsapp-ai-agent"
REPO_NAME="whatsapp-ai-agent-repo"
IMAGE_NAME="whatsapp-ai-agent"
VERSION="0.1.0"

IMAGE_URI="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO_NAME}/${IMAGE_NAME}:${VERSION}"

echo "Deploying to Cloud Run..."
echo "Service: ${SERVICE_NAME}"
echo "Image URI: ${IMAGE_URI}"

gcloud run deploy "${SERVICE_NAME}" \
  --image "${IMAGE_URI}" \
  --region "${REGION}" \
  --allow-unauthenticated \
  --port 8080

echo "Deploy completed successfully."
