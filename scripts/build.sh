#!/usr/bin/env bash
set -e

PROJECT_ID="continual-ripple-mcf5x"
REGION="us-central1"
REPO_NAME="whatsapp-ai-agent-repo"
IMAGE_NAME="whatsapp-ai-agent"
VERSION="0.2.0"

IMAGE_URI="${REGION}-docker.pkg.dev/${PROJECT_ID}/${REPO_NAME}/${IMAGE_NAME}:${VERSION}"

echo "Building Docker image..."
echo "Image URI: ${IMAGE_URI}"

gcloud builds submit \
  --tag "${IMAGE_URI}"

echo "Build completed successfully."
