#!/bin/bash

# Build script for the NSFW-filtered version of Bluesky
echo "Building NSFW-filtered Bluesky web client..."

# Set custom environment variables if needed
export BLUESKY_CUSTOM_TITLE="Filtered Bluesky"
export BLUESKY_SERVICE_URL="${BLUESKY_SERVICE_URL:-https://api.bsky.app}"

# Run the normal web build process
echo "Running web build..."
yarn build-web

echo "Build complete! The filtered web client is ready to be deployed."
echo "To test locally, run: cd bskyweb && yarn serve"
echo "To deploy to Vercel, connect your GitHub repo and import the project."
